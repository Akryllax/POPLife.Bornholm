#define PERMA -999
/*
	File: fn_CfgEnfermedades.sqf
	Author: Akryllax
	Desc: Lista de enfermedades y efectos. Estructura de cada enfermedad, sus fases y cura.
	
	["Nombre", int tiempo entre fases (minutos), [[Efectos estadio 1, veces por minuto], cura], [[Efectos estadio 2], cura], ..., [[Efectos estadio N], cura N]];

	NO SE TE OLVIDE MARCAR LOS EFFECTOS PERMA CON -999 HIJOPUTAAAAAAAAAAaaAaAAAAAAaaaaAaaaAaa

*/

ppEffectCreate ["radialBlur", 2001];
ppEffectCreate ["chromAberration", 2002];
ppEffectCreate ["wetDistortion", 2003];
ppEffectCreate ["colorCorrections", 2004];
ppEffectCreate ["dynamicBlur", 2005];
ppEffectCreate ["filmGrain", 2006];
ppEffectCreate ["colorInversion", 2007];

life_enfermedades = [
	["Costipado", 5,[["Incubando",PERMA,"Contagiosa",PERMA],"Aspirina"],[["Tos",1,"Contagiosa",PERMA],"Aspirina"],[["Tos",4,"Temblores",6,"Contagiosa",PERMA],"Aspirina"],[["Tos",4,"Temblores",6,"Fatiga", PERMA, "Contagiosa",PERMA],"Aspirina"]],
	["Ebola",7,[["Incubando",PERMA,"Contagiosa",PERMA],"Anticuerpos"],[["Temblores",4,"Tos",6],"Anticuerpos"],[["Temblores",6,"Tos dolorosa",6,"Fatiga",PERMA],"Anticuerpos"],[["Temblores",4,"Tos dolorosa",6,"Hemorragias externas",2,"Fatiga",PERMA,"Vista borrosa",PERMA],"Anticuerpos"],[["Temblores",4,"Tos dolorosa",6,"Hemorragias externas",4,"Vista borrosa",PERMA,"Fatiga",PERMA,"Alucinaciones",1],"Anticuerpos"],[["Muerte",PERMA],"TERMINAL"]],
	["Ceguera", 2,[["Ceguera",PERMA],"Ninguno"],[["Curar",PERMA],"Ninguno"]],
	["Alucinaciones", 2,[["Disociacion",PERMA],"Ninguno"],[["Curar",PERMA],"Ninguno"]],
	["NI-57", 60,[["Daltonismo severo",PERMA,"Debilidad",PERMA,"Sordera",PERMA],"Erequer"]],
	["Tranquilizante", 5,[["Disociacion",PERMA,"Fatiga", PERMA],"Ninguno"],[["Curar",PERMA],"Ninguno"]],
	["Hipotermia", 60,[["Hipotermia", PERMA],"Bolsa_Calor"]],
	["Nirnia", 60,[["Hipotermia",PERMA,"Contagiosa",PERMA],"Bolsa_Calor"]]
];

life_enf_getArraySintomas = {
	private["_enfermedad", "_nivel"];
	_enfermedad = [_this, 0, "", [""]] call BIS_fnc_param;
	_nivel = [_this, 1, -1, [-1]] call BIS_fnc_param;
	
	if(_enfermedad == "") exitWith {[]};
	if!([_enfermedad] call life_isIllness) exitWith {[]};
	if(_nivel < 1) exitWith {[]};
	if(_nivel > [_enfermedad] call life_enf_getLevelCount) exitWith {[]};
	_i = -1;
	
	_handle = [_enfermedad] call life_enf_getEnfermedad;
	if(count _handle < 1) exitWith {[]};
	
	(_handle select (1 + _nivel)) select 0

};

life_enf_getSintomas = {
	private["_enfermedad", "_nivel"];
	_enfermedad = [_this, 0, "", [""]] call BIS_fnc_param;
	_nivel = [_this, 1, -1, [-1]] call BIS_fnc_param;
	
	_handle = [_enfermedad, _nivel] call life_enf_getArraySintomas;
	if(count _handle < 1) exitWith{[]};
	
	_result = [];
	_k = [_enfermedad, _nivel] call life_enf_getSintomasCount;
	if(_k < 1) exitWith{};
	
	_var = 0;
	while{_var < _k + 1} do {
		_result pushBack (_handle select (_var * 2));
		_var = _var + 1;
	};
		
	_result
};

life_enf_getSintomaPeriod = {
	private["_enfermedad", "_nivel", "_sintoma"];
	_enfermedad = [_this, 0, "", [""]] call BIS_fnc_param;
	_nivel = [_this, 1, -1, [-1]] call BIS_fnc_param;
	_sintoma = [_this, 2, "", [""]] call BIS_fnc_param;
	
	if(_sintoma == "") exitWith{};
	_handle = [_enfermedad, _nivel] call life_enf_getArraySintomas;

	_index = _handle find _sintoma;
	if(_index < 0) exitWith{-1};
	
	(_handle select (_index + 1))
};

life_enf_getEnfermedad = {
	private["_enfermedad"];
	_enfermedad = [_this, 0, "", [""]] call BIS_fnc_param;

	if(_enfermedad == "") exitWith {[]};
	if!([_enfermedad] call life_isIllness) exitWith {[]};
	
	_i = -1;
	{
		if(_enfermedad == _x select 0) then {_i = _forEachIndex};
	} forEach life_enfermedades;
	
	if(_i < 0) exitWith{[]};
	
	life_enfermedades select _i
};

life_enf_getSintomasCount = {
	private["_enfermedad", "_nivel"];
	_enfermedad = [_this, 0, "", [""]] call BIS_fnc_param;
	_nivel = [_this, 1, -1, [-1]] call BIS_fnc_param;
	
	_handle = [_enfermedad, _nivel] call life_enf_getArraySintomas;
	if(count _handle < 1) exitWith {0};
	((count _handle) / 2)
};

life_enf_getLevelCount = {
	private["_enfermedad"];
	_enfermedad = [_this, 0, "", [""]] call BIS_fnc_param;
	
	if(_enfermedad == "") exitWith {};
	if!([_enfermedad] call life_isIllness) exitWith {[]};
	
	_i = -1;
	
	{
		if(_enfermedad == _x select 0) then {_i = _forEachIndex};
	} forEach life_enfermedades;
	
	if(_i < 0) exitWith{};
	
	_handle = life_enfermedades select _i;
	(count _handle) - 2
};

life_enf_getCura = {
	private["_enfermedad", "_nivel"];
	_enfermedad = [_this, 0, "", [""]] call BIS_fnc_param;
	_nivel = [_this, 1, -1, [-1]] call BIS_fnc_param;
	
	if(_enfermedad == "") exitWith{ hint "Error obteniendo cura. Contacta con Akryllax!\nCodigo: enfermedad nula."; "" };
	if!([_enfermedad] call life_isIllness) exitWith{ hint "Error obteniendo cura. Contacta con Akryllax!\nCodigo: no es enfermedad"; "" };
	if(_nivel < 1) exitWith{ hint "Error obteniendo cura. Contacta con Akryllax!\nCodigo: nivel menor que 1"; "" };
	if(_nivel > [_enfermedad] call life_enf_getLevelCount) exitWith{ hint "Error obteniendo cura. Contacta con Akryllax!\nCodigo: nivel mayor que reales"; "" };
	
	_handle = ([_enfermedad] call life_enf_getEnfermedad) select (1 + _nivel);
	
	_res = _handle select (count _handle - 1);
	if(count _res < 1) exitWith{ hint "Error obteniendo cura. Contacta con Akryllax!"; "" };
	
	_res
};

life_isIllness = {
	private["_enfermedad"];
	
	_enfermedad = [_this, 0, "", [""]] call BIS_fnc_param;
	
	if(_enfermedad == "") exitWith {};
	
	if (
	{
		if(_enfermedad in _x) exitWith { true};
		false
	} forEach life_enfermedades) then { true } else { false };
};

life_enf_spawnEffectos = {
	_this spawn {
		private["_enfermedad", "_nivel"];
		_enfermedad = [_this, 0, "", [""]] call BIS_fnc_param;
		_nivel = [_this, 1, -1, [-1]] call BIS_fnc_param;
		
		if(_enfermedad == "") exitWith {[]};
		if!([_enfermedad] call life_isIllness) exitWith {[]};
		if(_nivel < 1) exitWith {[]};
		if(_nivel > [_enfermedad] call life_enf_getLevelCount) exitWith {[]};

		_var = [_enfermedad, _nivel] call life_enf_getSintomas;
		
		{
			if(([_enfermedad, _nivel, _x] call life_enf_getSintomaPeriod) >= 0) then {
				[_x] call life_fnc_efectoEnfermedad;
			};
		} forEach _var;
	};
};

life_enf_spawnEffectosPerma = {
	_this spawn {
		private["_enfermedad", "_nivel"];
		_enfermedad = [_this, 0, "", [""]] call BIS_fnc_param;
		_nivel = [_this, 1, -1, [-1]] call BIS_fnc_param;
		
		if(_enfermedad == "") exitWith {[]};
		if!([_enfermedad] call life_isIllness) exitWith {[]};
		if(_nivel < 1) exitWith {[]};
		if(_nivel > [_enfermedad] call life_enf_getLevelCount) exitWith {[]};

		_var = [_enfermedad, _nivel] call life_enf_getSintomas;
		
		{
			if(([_enfermedad, _nivel, _x] call life_enf_getSintomaPeriod) == PERMA) then {
				[_x] call life_fnc_efectoEnfermedad;
			};
		} forEach _var;
	};
};

life_playerWeapons2Ground = {

	_myStuff = weapons player;
	_myMags = magazines player;
	
	// Drop all your stuff on ground.
	if (count (_myStuff+_myMags)>0) then 
	{
		_box = createVehicle ["WeaponHolder", (position player) vectorAdd[0,0,0.1], [], 0.5, "CAN_COLLIDE"];
		_box setDir floor (random 360);

		{_box addWeaponCargoGlobal [_x, 1]; player removeWeaponGlobal _x;} forEach _myStuff;
		{_box addMagazineCargoGlobal [_x, 1]; player removeMagazine _x;} forEach _myMags;
		
		player reveal _box;
	};
};

life_enfermedadesCargadas = true;