
//	@file Name: initPlayerLocal.sqf
//	@file Author: AgentRev

if (!isServer) then
{
	"BIS_fnc_MP_packet" addPublicVariableEventHandler compileFinal preprocessFileLineNumbers "server\antihack\filterExecAttempt.sqf";
};
