/*
	File: fn_hudInterface.sqf
	Author: Akryllax
	Desc: Open's up and set the interface.
*/

disableSerialization;

20 cutRsc ["power_menu", "PLAIN"];

_d = uiNamespace getVariable ['power_menu', displayNull];

(_d displayCtrl 1201) ctrlSetText "img\devils_eye_lo.paa";
(_d displayCtrl 1202) ctrlSetText "img\techno_psyco_lo.paa";

[] spawn {
	
	waitUntil {!(isNull (findDisplay 46))};
	(findDisplay 46) displayAddEventHandler ["KeyDown", "if(_this select 1 == 15) then { [] call AKR_fnc_useHability;};"];
};