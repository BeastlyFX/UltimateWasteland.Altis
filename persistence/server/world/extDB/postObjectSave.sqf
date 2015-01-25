
//	@file Name: postObjectSave.sqf
//	@file Author: AgentRev

private "_oldObjectIDs";
_oldObjectIDs = _this select 0;

_oldObjectIDs call fn_deleteObjects;
