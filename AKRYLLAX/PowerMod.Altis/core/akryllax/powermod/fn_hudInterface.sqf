/*
	File: fn_hudInterface.sqf
	Author: Akryllax
	Desc: Open's up and set the interface.
*/

disableSerialization;

20 cutRsc ["power_menu", "PLAIN"];

_d = uiNamespace getVariable ['power_menu', displayNull];

(_d displayCtrl 1201) ctrlSetText "#(argb,8,8,3)color(0.5,0.5,0.5,0.3)";
(_d displayCtrl 1202) ctrlSetText "#(argb,8,8,3)color(0.5,0.5,0.5,0.3)";

[] spawn {
	disableSerialization;

	_d = uiNamespace getVariable ['power_menu', displayNull];

	_tag1 = ctrlText (_d displayCtrl 1201);
	_tag2 = ctrlText (_d displayCtrl 1202);

	while {(_tag1 == ctrlText (_d displayCtrl 1201)) && (_tag2 == ctrlText (_d displayCtrl 1202))} do {
			(_d displayCtrl 1201) ctrlSetText (format["#(argb,8,8,3)color(0.%1,0.%2,0.%3,0.5)", cos(time),cos(time),cos(time)]);
			(_d displayCtrl 1202) ctrlSetText (format["#(argb,8,8,3)color(0.%1,0.%2,0.%3,0.5)", cos(time),cos(time),cos(time)]);
	};
};