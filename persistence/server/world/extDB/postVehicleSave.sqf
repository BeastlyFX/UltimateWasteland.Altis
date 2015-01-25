
//	@file Name: postVehicleSave.sqf
//	@file Author: AgentRev

private "_oldVehicleIDs";
_oldVehicleIDs = _this select 0;

_oldVehicleIDs call fn_deleteVehicles;
