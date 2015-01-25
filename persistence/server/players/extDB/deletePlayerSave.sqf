
//	@file Name: deletePlayerSave.sqf
//	@file Author: AgentRev

[format ["deletePlayerSave:%1:%2", _this, call A3W_extDB_MapID]] call extDB_Database_async;
