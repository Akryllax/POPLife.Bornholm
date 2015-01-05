/*
	File fn_copVehicleColor.sqf
	Desc: Finds out what cop color index fits coplvl.
*/

private ["_coplvl", "_className"];

_coplvl = [_this, 0, -1, [1]] call BIS_fnc_param;
_className = [_this, 1, "", [""]] call BIS_fnc_param;

switch (_className) do {

	case "C_Hatchback_01_sport_F": {
		if(_coplvl >= 8) exitWith {7};
		if(_coplvl >= 6) exitWith {8};
		if(_coplvl >= 3) exitWith {7};
		if(_coplvl > 0) exitWith {6};
	};
	case "C_Offroad_01_F": {
		if(_coplvl >= 8) exitWith {11};
		if(_coplvl >= 6) exitWith {10};
		if(_coplvl >= 3) exitWith {9};
		if(_coplvl > 0) exitWith {7};
	};
	case "C_SUV_01_F": {
		if(_coplvl >= 8) exitWith {4};
		if(_coplvl >= 6) exitWith {5};
		if(_coplvl >  0) exitWith {4};
	};
	case "B_Quadbike_01_F": {
		if(_coplvl >= 8) exitWith {9};
		if(_coplvl >= 6) exitWith {10};
		if(_coplvl >  0) exitWith {9};
	};
	case "B_MRAP_01_F": {
		if(_coplvl > 7) exitWith {0};
		if(_coplvl > 4) exitWith {1};
	};
	case "B_MRAP_01_hmg_F": {
		if(_coplvl > 7) exitWith {0};
		if(_coplvl > 4) exitWith {1};
	};
	case "B_Heli_Light_01_F": {
		if(_coplvl > 7) exitWith {0};
		if(_coplvl > 5) exitWith {15};
		if(_coplvl > 0) exitWith {0};
	};
	case "I_Heli_light_03_unarmed_F": {
		0
	};
	case "I_MRAP_03_hmg_F": {
		0
	};
};