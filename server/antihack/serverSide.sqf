
//	@file Version: 1.0
//	@file Name: serverSide.sqf
//	@file Author: AgentRev
//	@file Created: 29/06/2013 18:01

if (!isServer) exitWith {};

private ["_serverID", "_cheatFlag", "_unit"];

waitUntil {!isNil "bis_functions_mainscope"};
_serverID = owner bis_functions_mainscope;

// diag_log "ANTI-HACK: Starting loop!";

// diag_log "ANTI-HACK: Detection of hacked units!";

while { true } do
{
	waitUntil {time > 0.1};

	if (isNil "_cheatFlag") then
	{
		{
			_unit = _x;

			if (owner _unit > _serverID) then
			{
				if (alive _unit && !isPlayer _unit && {getText (configFile >> "CfgVehicles" >> typeOf _unit >> "simulation") != "UAVPilot"}) then
				{
					if (isNil "_cheatFlag") then
					{
						_cheatFlag = [];
					};

					_cheatFlag pushBack ["hacked unit", typeOf _unit, [owner _unit] call findClientPlayer];

					for [{_i = 0}, {_i < 10 && vehicle _unit != _unit}, {_i = _i + 1}] do
					{
						moveOut _unit;
						sleep 0.01;
					};

					deleteVehicle _unit;
				};
			};
		} forEach (allUnits - playableUnits);
	};

	if (!isNil "_cheatFlag") then
	{
		{
			private "_player";
			_player = _x select 2;

			if (isPlayer _player) then
			{
				[[getPlayerUID _player, _flagChecksum], "A3W_fnc_clientFlagHandler", _player, false] call A3W_fnc_MP;

				[name _player, getPlayerUID _player, _x select 0, _x select 1, _flagChecksum] call A3W_fnc_flagHandler;
			};
		} forEach _cheatFlag;

		_cheatFlag = nil;
	};

	sleep 5;
};
