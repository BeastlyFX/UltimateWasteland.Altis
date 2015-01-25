
//	@file Name: fn_setName.sqf
//	@file Author: AgentRev

private ["_unit", "_name"];

_unit = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_name = [_this, 1, "", ["",[]]] call BIS_fnc_param;

if (!isNull _unit) then
{
	_unit setName _name;
};
