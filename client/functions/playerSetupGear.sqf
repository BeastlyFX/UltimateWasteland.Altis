//	@file Name: playerSetupGear.sqf
//	@file Author: [GoT] JoSchaap, AgentRev

private ["_player", "_uniform", "_vest", "_headgear", "_goggles"];
_player = _this;

// Clothing is now defined in "client\functions\getDefaultClothing.sqf"

_uniform = [_player, "uniform"] call getDefaultClothing;
_vest = [_player, "vest"] call getDefaultClothing;
_headgear = [_player, "headgear"] call getDefaultClothing;
_goggles = [_player, "goggles"] call getDefaultClothing;

if (_uniform != "") then { _player addUniform _uniform };
if (_vest != "") then { _player addVest _vest };
if (_headgear != "") then { _player addHeadgear _headgear };
if (_goggles != "") then { _player addGoggles _goggles };

sleep 0.1;

// Remove GPS
_player unlinkItem "ItemGPS";

// Remove NVG
if (hmd _player != "") then { _player unlinkItem hmd _player };

// Add NVG
_player linkItem "NVGoggles";

// Add Backpack
_player addBackpack "B_Kitbag_mcamo";

//##########################################
//Donator Uniform Gifts - Loadouts START
//##########################################

_uid = getPlayerUID _player;
_spawnedCustom = 0;

	//Blackbeard (Matt)
	if (_uid == "76561198136978828") then {
		_player forceAddUniform "UU_B_CTRG_3";
		_player addHeadgear "H_Helmet_Kerry";
        _player addVest "V_PlateCarrierIAGL_dgtl";
		_player addBackpack "B_Carryall_oli";
        _player addGoggles "G_Bandanna_aviator";
        [_player,"GryffinRegiment"] call bis_fnc_setUnitInsignia;
	};
    
    //Crazyhallum (Jonas)
	if (_uid == "76561198063630406") then {
		_player forceAddUniform "U_B_CombatUniform_mcam_worn";
		_player addHeadgear "H_Booniehat_tan";
        _player addVest "V_PlateCarrierSpec_rgr";
		_player addBackpack "B_Carryall_ocamo";
	};
    
    //Larose R (Ryan)
	if (_uid == "76561198059394219") then {
		_player forceAddUniform "U_B_CombatUniform_mcam_vest";
    	_player addVest "V_PlateCarrierH_CTRG";
        _player addBackpack "B_Carryall_mcamo";
	};
    
    //Nemesis (Michael)
	if (_uid == "76561198115796338") then {
		_player forceAddUniform "U_O_CombatUniform_oucamo";
		_player addHeadgear "H_HelmetLeaderO_oucamo";
        _player addVest "V_PlateCarrierH_CTRG";
		_player addBackpack "B_Carryall_oucamo";
        _player addGoggles "G_Bandanna_aviator";
		_player addItemToBackpack "Medikit";
	};
    
    //Zeppelin (Justin)
	if (_uid == "76561198050765378") then {
		if (hmd _player != "") then { _player unlinkItem hmd _player };
		_player forceAddUniform "U_I_G_resistanceLeader_F";
		_player addHeadgear "H_MilCap_dgtl";
        _player addVest "V_PlateCarrierGL_rgr";
		_player addBackpack "B_Carryall_oli";
        _player addGoggles "G_Bandanna_beast";
	};
    
    //CDSMITH (Chris)
	if (_uid == "76561198042025926") then {
		_player forceAddUniform "U_O_GhillieSuit";
        _player addVest "V_PlateCarrierGL_rgr";
		_player addBackpack "B_Carryall_ocamo";
	};
    
    //Marine By God (Edgar)
	if (_uid == "76561198102097569") then {
		_player forceAddUniform "U_B_HeliPilotCoveralls";
		_player addHeadgear "H_HelmetSpecB_blk";
        _player addVest "V_PlateCarrierIAGL_dgtl";
		_player addBackpack "B_Carryall_oli";
        _player addGoggles "G_Bandanna_beast";
	};
    
    //Bruh (Ryan)
	if (_uid == "76561198039459039") then {
		_player forceAddUniform "U_B_CTRG_1";
        _player addVest "V_PlateCarrierH_CTRG";
		_player addBackpack "B_FieldPack_cbr";
	};
	
    //LARRYDAVID (George)
	if (_uid == "76561197965073283") then {
		_player forceAddUniform "U_C_Poloshirt_blue";
		_player addHeadgear "H_Cap_police";
        _player addVest "V_TacVest_blk_POLICE";
        _player addGoggles "G_Bandanna_shades";
	};
    
    //Five Worlds (Jared)
	if (_uid == "76561198087267808") then {
		_player forceAddUniform "U_I_CombatUniform";
		_player addHeadgear "H_Watchcap_blk";
        _player addVest "V_PlateCarrierGL_rgr";
		_player addBackpack "B_Carryall_oli";
	};
    
    //PairADice
	if (_uid == "76561198137234715") then {
		_player forceAddUniform "U_BG_Guerilla3_1";
		_player addHeadgear "H_Watchcap_blk";
        _player addVest "V_PlateCarrierH_CTRG";
		_player addBackpack "B_Carryall_cbr";
        _player addGoggles "G_Bandanna_beast";
	};
    
    //Everett
	if (_uid == "76561198042480916") then {
		_player forceAddUniform "U_IG_Guerilla3_1";
		_player addHeadgear "H_Bandanna_surfer";
        _player addVest "V_PlateCarrierGL_rgr";
		_player addBackpack "B_Carryall_khk";
	};
    
    //Evan
	if (_uid == "76561197995272108") then {
		_player forceAddUniform "U_BG_Guerilla3_1";
		_player addHeadgear "H_Cap_blk_CMMG";
        _player addVest "V_TacVestIR_blk";
		_player addBackpack "B_Carryall_cbr";
	};
    
    //FutbeleroR10
	if (_uid == "76561198042047377") then {
		_player forceAddUniform "U_B_HeliPilotCoveralls";
		_player addHeadgear "H_CrewHelmetHeli_I";
        _player addVest "V_PlateCarrierSpec_rgr";
		_player addBackpack "B_Carryall_khk";
	};
    
    //Jag648
	if (_uid == "76561198004293015") then {
		_player forceAddUniform "U_I_pilotCoveralls";
		_player addHeadgear "H_HelmetLeaderO_ocamo";
        _player addVest "V_PlateCarrierIA2_dgtl";
		_player addBackpack "B_Carryall_oli";
	};
    
    //Frank648
	if (_uid == "76561198121217668") then {
		_player forceAddUniform "U_B_HeliPilotCoveralls";
		_player addHeadgear "H_HelmetCrew_I";
        _player addVest "V_PlateCarrier3_rgr";
		_player addBackpack "B_Carryall_mcamo";
	};
    
    //CDSMITH
	if (_uid == "76561198042025926") then {
		_player forceAddUniform "U_O_GhillieSuit";
        _player addVest "V_PlateCarrierGL_rgr";
		_player addBackpack "B_Carryall_ocamo";
	};
    
    //Harry (Harrison)
	if (_uid == "76561198136758224") then {
		_player forceAddUniform "U_I_CombatUniform";
        _player addVest "V_PlateCarrierIAGL_dgtl";
		_player addBackpack "B_Carryall_oli";
        _player addHeadgear "H_HelmetIA";
        _player addGoggles "G_Bandanna_oli";
	};
    
    //Howitzer (Matt)
	if (_uid == "76561197977078167") then {
		_player forceAddUniform "U_B_CTRG_3";
        _player addHeadgear "H_StrawHat";
        _player addVest "V_PlateCarrierGL_rgr";
		_player addBackpack "B_Carryall_mcamo";
        _player addGoggles "G_Shades_Green";
	};
    
    //Sim0nSayz
	if (_uid == "76561198133000469") then {
		_player forceAddUniform "U_I_G_Story_Protagonist_F";
        _player addHeadgear "H_HelmetB_camo";
        _player addVest "V_PlateCarrierSpec_rgr";
		_player addBackpack "B_Carryall_cbr";
        _player addGoggles "G_Aviator";
	};

    //Spooky
	if (_uid == "76561198005431487") then {
		_player forceAddUniform "U_I_G_Story_Protagonist_F";
        _player addHeadgear "H_Booniehat_mcamo";
        _player addVest "V_TacVest_blk_POLICE";
		_player addBackpack "B_Carryall_mcamo";
        _player addGoggles "G_Tactical_Black";
	};

    //Gotreaux
	if (_uid == "76561198067312722") then {
		_player forceAddUniform "U_I_G_Story_Protagonist_F";
        _player addHeadgear "H_Booniehat_mcamo";
        _player addVest "V_TacVest_blk_POLICE";
		_player addBackpack "B_Carryall_mcamo";
	};
    
    //Druid
	if (_uid == "76561198008340193") then {
		_player forceAddUniform "U_O_PilotCoveralls";
        _player addHeadgear "H_Watchcap_khk";
        _player addVest "V_PlateCarrier_Kerry";
		_player addBackpack "B_FieldPack_khk";
        _player addGoggles "G_Squares";
	};
    
    //Pedro
	if (_uid == "76561198042461431") then {
		_player forceAddUniform "U_I_GhillieSuit";
        _player addHeadgear "H_HelmetLeaderO_oucamo";
        _player addVest "V_Rangemaster_belt";
		_player addBackpack "B_Carryall_oli";
	};
    
	//TheGeneral
	if (_uid == "76561198093798174") then {
		_player forceAddUniform "U_O_CombatUniform_ocamo";
        _player addHeadgear "H_Watchcap_blk";
        _player addVest "V_TacVest_blk_POLICE";
		_player addBackpack "B_Carryall_ocamo";
	};
	
    //DoctorProfPatrick
	if (_uid == "76561198048046291") then {
		_player forceAddUniform "U_I_CombatUniform";
        _player addHeadgear "H_PilotHelmetHeli_I";
        _player addVest "V_Rangemaster_belt";
		_player addBackpack "B_Carryall_oli";
	};
	
    //RC Goon
	if (_uid == "76561198124622556") then {
		_player forceAddUniform "U_I_G_resistanceLeader_F";
        _player addHeadgear "H_Shemag_olive_hs";
        _player addVest "V_PlateCarrierIA2_dgtl";
		_player addBackpack "B_Carryall_oli";
	};
    
    //Ninjor
	if (_uid == "76561197961966022") then {
		_player forceAddUniform "U_B_GhillieSuit";
        _player addHeadgear "H_HelmetLeaderO_ocamo";
        _player addVest "V_PlateCarrierGL_rgr";
		_player addBackpack "B_Carryall_khk";
	};
	
	//TRevor
	if (_uid == "76561198026003663") then {
		_player forceAddUniform "U_B_CombatUniform_mcam";
        _player addHeadgear "H_HelmetLeaderO_ocamo";
        _player addVest "V_PlateCarrierH_CTRG";
		_player addBackpack "B_Carryall_mcamo";
	};
	
	//Voodoo
	if (_uid == "76561198067036226") then {
		_player forceAddUniform "U_B_CombatUniform_mcam_worn";
        _player addHeadgear "H_Booniehat_tan";
        _player addVest "V_PlateCarrierGL_rgr";
		_player addBackpack "B_Kitbag_cbr";
		_player addGoggles "G_Bandanna_beast";
	};
	
	//Infamous
	if (_uid == "76561198077259055") then {
		_player forceAddUniform "U_BG_Guerrilla_6_1";
        _player addHeadgear "H_HelmetCrew_B";
        _player addVest "V_PlateCarrierH_CTRG";
		_player addBackpack "B_Carryall_oli";
		_player addGoggles "G_Bandanna_aviator";
	};
	
//##########################################
//Donator Uniform Gifts - Loadouts END
//##########################################	

_player addMagazine "11Rnd_45ACP_Mag";
_player addWeapon "hgun_Pistol_heavy_01_F";
_player addMagazine "11Rnd_45ACP_Mag";
_player addMagazine "11Rnd_45ACP_Mag";
_player addMagazine "11Rnd_45ACP_Mag";
_player addItem "FirstAidKit";
_player selectWeapon "hgun_Pistol_heavy_01_F";

if (_player == player) then
{
	thirstLevel = 100;
	hungerLevel = 100;
};
