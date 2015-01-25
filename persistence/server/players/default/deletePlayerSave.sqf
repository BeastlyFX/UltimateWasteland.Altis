
//	@file Name: deletePlayerSave.sqf
//	@file Author: AgentRev

private "_fileName";
_fileName = _this call PDB_playerFileName;

if (call A3W_savingMethod == "iniDB" && {parseNumber (call iniDB_version) < 1.2}) then
{
	// Required for iniDB v1.0
	_fileName call iniDB_delete;
}
else
{
	[_fileName, "PlayerSave"] call PDB_deleteSection;
};
