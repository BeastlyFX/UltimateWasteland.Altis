
//	@file Name: deleteObjects.sqf
//	@file Author: AgentRev

private ["_objects", "_values", "_id"];
_objects = _this;

_values = "";

{
	_id = if (typeName _x == "OBJECT") then { _x getVariable "A3W_objectID" } else { _x };

	if (!isNil "_id") then
	{
		_values = _values + ((if (_values != "") then { "," } else { "" }) + str _id);
	};
} forEach _objects;

if (_values != "") then
{
	["deleteServerObjects:" + _values] call extDB_Database_async;
};
