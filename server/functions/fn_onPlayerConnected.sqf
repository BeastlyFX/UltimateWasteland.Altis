
//	@file Name: fn_onPlayerConnected.sqf
//	@file Author: AgentRev

private ["_id", "_uid", "_name"];
_id = _this select 0;
_uid = _this select 1;
_name = _this select 2;

diag_log format ["Player connected: %1 (%2)", _name, _uid];
