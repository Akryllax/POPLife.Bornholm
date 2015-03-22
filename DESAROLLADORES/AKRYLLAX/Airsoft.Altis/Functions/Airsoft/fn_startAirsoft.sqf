/*
	File: fn_startAirsoft.sqf
	Author: Akryllax (Anyway, this isn't public so... Whatever...)
	Desc: Setups serverside airsoft stuff at lauch.
*/

_this spawn {

	private["_width", "_height","_altura","_density","_mrkrOrigin"];
	
	waitUntil {!(isNil "life_server_isReady")};
	
	createCenter east;
	
	airsoft_redGroup = createGroup east;
	publicVariable "airsoft_redGroup";
	
	airsoft_blueGroup = createGroup east;
	publicVariable "airsoft_blueGroup";
	
	_width = 		[_this, 0, -1,[-1]] call BIS_fnc_param;
	_height = 		[_this, 1, -1,[-1]] call BIS_fnc_param;
	_altura = 		[_this, 2, -1,[-1]] call BIS_fnc_param;
	_density = 		[_this, 3, -1,[-1]] call BIS_fnc_param;
	_mrkrOrigin = 	[_this, 4, "not",[""]] call BIS_fnc_param;
	
	if(_width < 0 || _height < 0 || _altura < 0 || _density < 10 || _mrkrOrigin isEqualTo "not") exitWith {
		hint "Hola";
	};
	
	[_width, _height,_altura,_density,_mrkrOrigin] call AKR_fnc_generateScenario;
	
	AKR_addAction_joinRed = {
		_this addAction ["Jugar como rojo", AKR_fnc_createAvatar, "red"];
	};
	
	AKR_addAction_joinBlue = {
		_this addAction ["Jugar como azul", AKR_fnc_createAvatar, "blue"];
	};
	
	AKR_AIR_addActionSetup = {
		_this call AKR_addAction_joinBlue;
		_this call AKR_addAction_joinRed;
	};
	
	publicVariable "AKR_addAction_joinRed";
	publicVariable "AKR_addAction_joinBlue";
	publicVariable "AKR_AIR_addActionSetup";
	
	sleep 5;
	
	//Let's set up the NPCs.
	_npcMarker = "AKR_NPC_AIRSOFT_1";
	_i = 1;
	while{!((getMarkerPos _npcMarker) isEqualTo [0,0,0])} do {
		_sold = "C_Soldier_VR_F" createVehicle (getMarkerPos _npcMarker);
		_sold setDir (markerDir _npcMarker);
		_sold addWeapon "arifle_MXM_black_F";
		_sold allowDamage false;
		_sold enableSimulation false;
		[_sold, "AKR_AIR_addActionSetup", true, true] call BIS_fnc_MP;
		
		_i = _i + 1;
		_npcMarker = format["AKR_NPC_AIRSOFT_%1", _i];
	};
	
	[] spawn {
	
		_weaponsArray = [
			"srifle_EBR_ARCO_pointer_F",
			"arifle_Katiba_ARCO_pointer_snds_F",
			"arifle_Katiba_ACO_pointer_F",
			"arifle_Katiba_ARCO_F",
			"arifle_MX_Hamr_pointer_F",
			"arifle_MXC_Holo_F",
			"arifle_TRG20_ACO_pointer_F",
			"arifle_TRG21_ARCO_pointer_F",
			"arifle_Mk20_Holo_F",
			"arifle_Mk20_MRCO_F",
			"arifle_MXC_Holo_pointer_snds_F",
			"arifle_MX_ACO_pointer_snds_F",
			"arifle_MX_RCO_pointer_snds_F",
			"arifle_MXM_RCO_pointer_snds_F",
			"SMG_01_ACO_F",
			"SMG_01_Holo_pointer_snds_F",
			"SMG_02_ARCO_pointg_F",
			"arifle_MX_SW_Black_Hamr_pointer_F",
			"hgun_PDW2000_Holo_snds_F"
		];
	
		while{true} do {
			_result = [];
			_weapon = _weaponsArray select (floor(random (count _weaponsArray)));
			_result pushBack (_weapon);
			
			_ammo = "";
			
			if((_weapon find "_EBR_") >= 0) then  {_ammo = "20Rnd_762x51_Mag";};
			if((_weapon find "_Katiba_") >= 0) then  {_ammo = "30Rnd_65x39_caseless_green_mag_Tracer";};
			if((_weapon find "_MX_") >= 0) then  {_ammo = "30Rnd_65x39_caseless_mag_Tracer";};
			if((_weapon find "_MXC_") >= 0) then  {_ammo = "30Rnd_65x39_caseless_mag_Tracer";};
			//if((_weapon find "_TRG20_") >= 0) then  {_ammo = "30Rnd_556x45_Stanag_Tracer_Red";};
			//if((_weapon find "_TRG21_") >= 0) then  {_ammo = "30Rnd_556x45_Stanag_Tracer_Red";};
			//if((_weapon find "_Mk20_") >= 0) then  {_ammo = "30Rnd_556x45_Stanag_Tracer_Green";};
			if((_weapon find "_MXM_") >= 0) then  {_ammo = "30Rnd_65x39_caseless_mag_Tracer";};
			//if((_weapon find "SMG_01_") >= 0) then  {_ammo = "30Rnd_45ACP_Mag_SMG_01_tracer_green";};
			if((_weapon find "SMG_02_") >= 0) then  {_ammo = "30Rnd_9x21_Mag";};
			if((_weapon find "_MX_SW_") >= 0) then  {_ammo = "30Rnd_65x39_caseless_mag_Tracer";};

			_result pushBack _ammo;
			
			AirsoftWeapons = _result;
			publicVariable "AirsoftWeapons";	
			
			sleep (10 * 60);
		};
	};
};