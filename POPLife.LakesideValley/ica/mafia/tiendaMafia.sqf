/*
Tienda de la mafia
by: Icaruk

life_cash = 1000000; expMafia = 1000; ["menu"] execVM "ica\mafia\tiendamafia.sqf";
*/

_param = _this select 0;

_tiendaLVL0 = [
	["Si no eres de la familia, no eres bienvenido", 0]
];
_tiendaLVL1 = [ // pistolas
	["----- Pistolas -----", 0],
	["RH_g18", 30000], 
	["RH_33Rnd_9x19_g18", 500],
	["", 0],
	["RH_vz61", 30000], 
	["RH_20Rnd_32cal_vz61", 500], 
	["", 0],
	["RH_tec9", 30000], 
	["RH_32Rnd_9x19_tec", 500], 
	["", 0],
	["RH_muzi", 60000], 
	["RH_30Rnd_9x19_UZI", 500], 
	["", 0],
	["hlc_smg_mp5k", 60000], 
	["hlc_30Rnd_9x19_B_MP5", 500], 
	["", 0],
	["RH_deagle", 95000], 
	["RH_deagleg", 90000], 
	["RH_7rnd_50_AE", 750],
	["7Rnd_408_Mag", 1000],
	["", 0]
];
_tiendaLVL2 = [ // ropa
	["----- Ropa -----", 0],
	["cl3_suit_black_black_black", 10000],
	["cl3_suit_black_blue_black", 10000],
	["cl3_suit_black_blue_brown", 10000],
	["cl3_suit_black_red_black", 10000],
	["cl3_suit_brown_blue_black", 10000],
	["cl3_suit_gray_black_black", 10000],
	["cl3_suit_pink_pink_black", 10000],
	["cl3_suit_purple_white_black", 10000],
	["cl3_suit_red_red_black", 10000],
	["cl3_suit_white_white_black", 10000],
	["cl3_suit_black_gold_black", 10000],
	["cl3_Suit_pimp", 10000],
	["cl3_suit_blue_black_black", 10000],
	["cl3_Suit_white_black_black", 10000],
	["cl3_Suit_green_blue_brown", 10000],
	["cl3_Suit_black_pink_brown", 10000],
	["cl3_Suit_grey_stripe_black", 10000],
	["cl3_Suit_blue_purple_black ", 10000],
	["cl3_Suit_red_black_black", 10000],
	["", 0]
];
_tiendaLVL3 = [ // subufiles
	["----- Subfusiles -----", 0],
	["SMG_02_F", 55000],
	["30Rnd_9x21_Mag", 600],
	["", 0],
	["SMG_01_F", 60000],
	["30Rnd_45ACP_Mag_SMG_01", 600],
	["", 0],
	["hgun_PDW2000_F", 60000],
	["30Rnd_9x21_Mag", 600],
	["", 0],
	["hlc_smg_mp5k_PDW", 80000],
	["hlc_30Rnd_9x19_B_MP5", 600],
	["", 0]
];
_tiendaLVL4 = [ // subfusiles grandes
	["----- Subfusiles grandes -----", 0],
	["hlc_smg_mp510", 75000],
	["hlc_30Rnd_10mm_B_MP5", 600],
	["", 0],
	["RH_sbr9_des", 75000],
	["RH_sbr9_tg", 75000],
	["RH_sbr9_wdl",75000],
	["RH_32Rnd_9mm_M822", 600],
	["", 0]
];
_tiendaLVL5 = [ // chalecos
	["----- Chalecos -----", 0],
	["V_HarnessOSpec_brn", 5000],
	["V_Chestrig_blk", 5000],
	["Specter_MBSS_BLK", 5000],
	["Specter_MBSS_TAN", 5000],
	["Specter_MBSS_PACA_BLK", 5000],
	["Specter_MBSS_light_BLK", 5000],
	["V_PlateCarrier2_rgr", 5000],
	["V_PlateCarrierIA2_dgtl", 5000],
	["V_BandollierB_khk", 5000],
	["V_TacVestIR_blk", 5000],
	["V_TacVest_camo", 5000],
	["A3L_deptjvest1", 5000],
	["V_PlateCarrierSpec_rgr", 5000],
	["V_RebreatherIR", 5000],
	["Specter_RAV_BLK", 5000],
	["V_PlateCarrier_Kerry", 5000],
    ["V_PlateCarrierH_CTRG", 5000],
	["", 0]
];
_tiendaLVL6 = [ // fusiles
	["----- Carabinas -----", 0],
	["RH_hb", 50000],
	["RH_30Rnd_762x35_FMJ", 700],
	["", 0],
	["Trixie_XM8_Carbine", 60000],
	["Trixie_XM8_Compact", 60000],
	["Trixie_XM8_30Rnd", 60000],
	["", 0],
	["arifle_TRG20_F", 60000],
	["30Rnd_556x45_Stanag", 700],
	["", 0],
	["arifle_Mk20C_plain_F", 60000],
	["30Rnd_556x45_Stanag", 700],
	["", 0],
	["Trixie_l85a2_nr", 60000],
	["Trixie_30Rnd", 700],
	["", 0]
];
_tiendaLVL7 = [ // fusiles tochos
	["----- Fusiles de asalto -----", 0],
	["RH_Hk416c", 80000],
	["RH_M4m", 80000],
	["RH_M4sbr", 80000],
	["RH_M4sbr_g", 80000],	
	["RH_M4_moe", 80000],
	["RH_m4_des", 80000],	
	["RH_m4_tg", 80000],		
	["RH_m4_wdl", 80000],		
	["RH_30Rnd_556x45_M855A1", 700],
	["", 0]
];
_tiendaLVL8 = [ // vehiculos
	["----- Vehículos -----", 0],
	["", 0]
];
_tiendaLVL9 = [ // fusiles muy tochos
	["----- Fusiles de asalto potentes -----", 0],
	["hlc_rifle_aks74u", 120000],	
	["hlc_rifle_aku12", 120000],
	["hlc_30Rnd_545x39_B_AK", 1000],
	["", 0]
];
_tiendaLVL10 = [ // blindado
	["----- Vehículos blindados -----", 0],
	["Nhz_audia8limo", 1000000]
];

_arrayTienda = [];
if (_param == "menu") exitWith {
	createDialog "tiendaMafia";
	_ui = uiNameSpace getVariable "tiendaMafia";
	_lista = (_ui displayCtrl 5007);
	_nivel = [expMafia] call ica_expToLevel;
	
	if (_nivel == 0) then { _arrayTienda = _arrayTienda + _tiendaLVL0; };
	if (_nivel >= 1) then { _arrayTienda = _arrayTienda + _tiendaLVL1; };
	if (_nivel >= 2) then { _arrayTienda = _arrayTienda + _tiendaLVL2; };
	if (_nivel >= 3) then { _arrayTienda = _arrayTienda + _tiendaLVL3; };
	if (_nivel >= 4) then { _arrayTienda = _arrayTienda + _tiendaLVL4; };
	if (_nivel >= 5) then { _arrayTienda = _arrayTienda + _tiendaLVL5; };
	if (_nivel >= 6) then { _arrayTienda = _arrayTienda + _tiendaLVL6; };
	if (_nivel >= 7) then { _arrayTienda = _arrayTienda + _tiendaLVL7; };
	if (_nivel >= 8) then { _arrayTienda = _arrayTienda + _tiendaLVL8; };
	if (_nivel >= 9) then { _arrayTienda = _arrayTienda + _tiendaLVL9 };
	if (_nivel >= 10) then { _arrayTienda = _arrayTienda + _tiendaLVL10; };


	private ["_nom", "_pre"];
	_idx = 0;
	while {_idx < (count _arrayTienda)} do {
		
		// Hallo su nombre visual
		_nom = [_arrayTienda select _idx select 0] call ica_classToName;
		
		// Hallo su precio
		_precio = (_arrayTienda select _idx select 1); // pillo el precio
		if (_precio != 0) then { // si es 0, es un espaciador
			_pre = format ["(%1€)", ([_precio, 3] call BIS_fnc_numberText)];  
		} else {_pre = ""; };
		
		// Creo cada elemento de la lista
		_lista lbAdd format ["%1 %2", _nom, _pre];
		_lista lbSetData [_idx, (_arrayTienda select _idx select 0)];
		_lista lbSetValue [_idx, (_arrayTienda select _idx select 1)];	
		if ((_arrayTienda select _idx select 1) == 0) then { // si es separador le cambio de color
			_lista lbSetColor [_idx, [0, 0.6, 0, 1]]; 
		};
		
		_idx = _idx + 1;
	};

	
	// _lista lbSetCurSel 0;
};

if (_param == "actualiza") exitWith {
	_ui = uiNameSpace getVariable "tiendaMafia";
	_lista = (_ui displayCtrl 5007);
	_boton = (_ui displayCtrl 5006);	
	_idxLista = lbCurSel 5007;
	cosa = _lista lbData _idxLista;
	precio = _lista lbValue _idxLista;
	
	_boton buttonSetAction '
		["compro", cosa, precio] execVM "ica\mafia\tiendaMafia.sqf";
	';
};

if (_param == "compro") exitWith {
	_cosa = _this select 1;
	_precio = _this select 2;
	
	if !(life_cash >= _precio) exitWith {hint "Aquí las cosas funcionan con dinero, incluso dentro de la familia."; };
	if !(player canAdd _cosa ) exitWith {hint "No tienes suficiente espacio"; };
	life_cash = life_cash - _precio;
	
	
	if (isClass (configFile >> "CfgWeapons" >> _cosa)) exitWith {
		_type = (getNumber (configFile >> "CfgWeapons" >> _cosa >> "ItemInfo" >> "Type"));
		
		if (_type == 801) then {
			removeUniform player;
			player forceAddUniform _cosa;
		};
		if (_type == 701) then {
			removeVest player;
			player addVest _cosa;
		};
		if (_type == 0) then {
			player addWeapon _cosa;
		};
		hint format ["Has comprado %1 por %2€", _cosa, _precio];
	};
	if (isClass (configFile >> "CfgMagazines" >> _cosa)) exitWith {
		player addMagazine _cosa;
		hint format ["Has comprado %1 por %2€", _cosa, _precio];
	};
	if (isClass (configFile >> "CfgVehicles" >> _cosa)) then {
		private "_mrk"; // ¿qué marcador tengo más cerca?
		_mrk = ["mrkmafia1", "mrkmafia2", "mrkmafia3"] call ica_mrkMasCercano;
		
		_veh = createVehicle [_cosa, (getMarkerPos _mrk), [], 0, "NONE"];
		waitUntil {!isNil "_veh"};
		_veh allowDamage false;
		_veh lock 2;
		_veh setVectorUp (surfaceNormal (getMarkerPos _mrk));
		_veh setDir (markerDir _mrk);
		_veh setPos (getMarkerPos _mrk);
		[[_veh,1],"life_fnc_colorVehicle",true,false] spawn life_fnc_MP;
		[_veh] call life_fnc_clearVehicleAmmo;
		[[_veh,"trunk_in_use",false,true],"TON_fnc_setObjVar",false,false] spawn life_fnc_MP;
		[[_veh,"vehicle_info_owners",[[getPlayerUID player,profileName]],true],"TON_fnc_setObjVar",false,false] spawn life_fnc_MP;
		_veh disableTIEquipment true;
		_veh allowDamage true;
		
		life_vehicles pushBack _veh;
		[[getPlayerUID player,playerSide, _veh, 1],"TON_fnc_keyManagement",false,false] spawn life_fnc_MP;
		[[(getPlayerUID player),playerSide, _veh, 0],"TON_fnc_vehicleCreate",false,false] spawn life_fnc_MP;
		[0] call SOCK_fnc_updatePartial; //Sync silently because it's obviously silently
		closeDialog 0;
		hint format ["Has comprado %1 por %2€", _cosa, _precio];
	};	
};

