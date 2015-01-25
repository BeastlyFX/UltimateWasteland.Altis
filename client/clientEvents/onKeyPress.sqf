//	@file Version: 1.0
//	@file Name: onKeyPress.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, AgentRev
//	@file Created: 20/11/2012 05:19
//	@file Args:

private ["_key", "_shift", "_ctrl", "_alt", "_handled"];

_key = _this select 1;
_shift = _this select 2;
_ctrl = _this select 3;
_alt = _this select 4;

_handled = false;

switch (true) do
{
	// U key
	case (_key == 35):
	{
		execVM "client\systems\adminPanel\checkAdmin.sqf";
	};

	// Tilde (key above Tab)
	case (_key == 41):
	{
		[] spawn loadPlayerMenu;
		_handled = true;
	};

	// Home & Windows keys
	case (_key in [199,219,220]):
	{
		showPlayerNames = if (isNil "showPlayerNames") then { true } else { !showPlayerNames };
	};
	
    // U Key
	case (_key == 22):
	{
		private ["_uid"];
		_uid = getPlayerUID player;

		switch (true) do
		{
			case ([_uid, serverOwners] call isAdmin || isServer):
			{
				deleteVehicle cursorTarget;
				hint "Vehicle Deleted!";
			};
			case (serverCommandAvailable "#kick"):
			{
				deleteVehicle cursorTarget;
				hint "Vehicle Deleted!";
			};
		};

	};
	
	//Spawn an ATV with Y
	case (_key == 21):
    {
        if(vehicle player != player) exitWith{};
        _pos = getPos player;
        _legitim = player getVariable "Neugeladen";
        if(_legitim == 1) then 
        {
            player setVariable["Neugeladen", 0,true];
            _car = createVehicle ["C_Quadbike_01_F",_pos, [], 0, "CAN_COLLIDE"];
            _car setVariable ["newVehicle",1,true];
            _car setVariable ["R3F_LOG_disabled", true];
            clearMagazineCargoGlobal _car;
            clearWeaponCargoGlobal _car;
            clearItemCargoGlobal _car; 
            _car spawn ATVCleanup;
        } 
        else 
        {
        hint "You have already spawned an ATV!"
        };    
    };

	case (_key in actionKeys "GetOver"):
	{
		if (alive player) then
		{
			_veh = vehicle player;

			if (_veh == player) then
			{
				if ((getPos player) select 2 > 2.5) then
				{
					true call fn_openParachute;
					_handled = true;
				};
			}
			else
			{
				if (_veh isKindOf "ParachuteBase") then
				{
					// 1s cooldown after parachute is deployed so you don't start falling again if you double-tap the key
					if (isNil "openParachuteTimestamp" || {diag_tickTime - openParachuteTimestamp >= 1}) then
					{
						moveOut player;
						_veh spawn
						{
							sleep 1;
							deleteVehicle _this;
						};
					};
				};
			};
		};
	};

	// Scoreboard
	case (_key in actionKeys "NetworkStats"):
	{
		if (_key != 25 || // 25 = P
		   ((!_ctrl || {!(486539289 in actionKeys "NetworkPlayers") && isNil "TFAR_fnc_TaskForceArrowheadRadioInit"}) && // 486539289 = Left Ctrl + P
		   (!_shift || {!(704643042 in actionKeys "NetworkPlayers")}))) then // 704643042 = Left Shift + P
		{
			if (alive player && isNull (uiNamespace getVariable ["ScoreGUI", displayNull])) then
			{
				call loadScoreboard;
			};

			_handled = true;
		};
	};
		
	// Earplugs - End Key
	case (_key == 207):
	{
		if (soundVolume > 0.5) then
		{
			0.5 fadeSound 0.2;
			["You've inserted your earplugs.", 5] call mf_notify_client;
		}
		else
		{
			0.5 fadeSound 1;
			["You've taken out your earplugs.", 5] call mf_notify_client;
		};
	};
};

_handled