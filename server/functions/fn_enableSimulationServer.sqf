
//	@file Name: fn_enableSimulationServer.sqf
//	@file Author: AgentRev

private ["_object", "_simul"];
_object = _this select 0;
_simul = _this select 1;

if (typeName _object == "STRING") then { _object = objectFromNetId _object };

if (isServer) then
{
	_object enableSimulation _simul;
}
else
{
	_object enableSimulation _simul;
	pvar_enableSimulationServer = [netId _object, _simul];
	publicVariableServer "pvar_enableSimulationServer";
};
