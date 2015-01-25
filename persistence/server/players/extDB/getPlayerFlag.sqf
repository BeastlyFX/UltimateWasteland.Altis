
//	@file Name: getPlayerFlag.sqf
//	@file Author: AgentRev

private "_UID";
_UID = _this;

[format ["getAntihackEntry:%1", _UID], 2] call extDB_Database_async
