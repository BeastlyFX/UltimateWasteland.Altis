_vehicle = _this;
private["_uid","_playerMoney","_playerMoneyText","_player"];
_player = driver _vehicle;
_uid = getPlayerUID _player;
_playerMoney = _player getVariable "cmoney";
_type = typeOf _vehicle;
_name = name _vehicle;

x_reload_time_factor = 5;

_vehicle setVehicleAmmo 1;

_vehicle setVelocity [0, 0, 0];

_vehicle setFuel 0;	

vehicle _player vehicleChat format ["Servicing %1... Please stand by...", _name];

_magazines = getArray(configFile >> "CfgVehicles" >> _type >> "magazines");

if (count _magazines > 0) then {
	_removed = [];
	{
		if (!(_x in _removed)) then {
			_vehicle removeMagazines _x;
			_removed = _removed + [_x];
		};
	} forEach _magazines;
	{
		vehicle _player vehicleChat format ["Reloading %1", _x];
		sleep x_reload_time_factor;
		_vehicle addMagazine _x;
	} forEach _magazines;
};

_count = count (configFile >> "CfgVehicles" >> _type >> "Turrets");

if (_count > 0) then {
	for "_i" from 0 to (_count - 1) do {
		scopeName "xx_reload2_xx";
		_config = (configFile >> "CfgVehicles" >> _type >> "Turrets") select _i;
		_magazines = getArray(_config >> "magazines");
		_removed = [];
		{
			if (!(_x in _removed)) then {
				_vehicle removeMagazines _x;
				_removed = _removed + [_x];
			};
		} forEach _magazines;
		{
			vehicle _player vehicleChat format ["Reloading %1", _x];
			sleep x_reload_time_factor;
			_vehicle addMagazine _x;
			sleep x_reload_time_factor;
		} forEach _magazines;
		_count_other = count (_config >> "Turrets");
		if (_count_other > 0) then {
			for "_i" from 0 to (_count_other - 1) do {
				_config2 = (_config >> "Turrets") select _i;
				_magazines = getArray(_config2 >> "magazines");
				_removed = [];
				{
					if (!(_x in _removed)) then {
						_vehicle removeMagazines _x;
						_removed = _removed + [_x];
					};
				} forEach _magazines;
				{
					vehicle _player vehicleChat format ["Reloading %1", _x]; 
					sleep x_reload_time_factor;
					_vehicle addMagazine _x;
					sleep x_reload_time_factor;
				} forEach _magazines;
			};
		};
	};
};
_vehicle setVehicleAmmo 1;

sleep x_reload_time_factor;
vehicle _player vehicleChat "Repairing...";
_vehicle setDamage 0;
sleep x_reload_time_factor;
vehicle _player vehicleChat "Refueling...";
while {fuel _vehicle < 0.99} do {
	//_vehicle setFuel ((fuel _vehicle + 0.1) min 1);
	_vehicle setFuel 1;
	sleep 0.01;
};
sleep x_reload_time_factor;
vehicle _player vehicleChat format ["%1 is ready...", _name];

if (true) exitWith {};
