
//	@file Name: fn_publicVariableAll.sqf
//	@file Author: AgentRev

private ["_pvar", "_value"];
_pvar = _this select 0;
_value = _this select 1;

missionNamespace setVariable [_pvar, _value];
publicVariable _pvar;

if (isServer) then { publicVariableServer _pvar };
