/*
	File: fn_showBadge.sqf
	Author: Akryllax
	Desc: Local see badge.
*/
disableSerialization;
private["_player", "_badgeNumber"];

_player = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_dniNumber = [_this, 1, "", [""]] call BIS_fnc_param;

titleRsc ["DNI_dialog", "PLAIN DOWN", 1, true];
_d = uiNamespace getVariable ['DNI_dialog', displayNull];
(_d displayCtrl 656721) ctrlSetText (_player getVariable["realname", "ERROR"]);
(_d displayCtrl 656722) ctrlSetText (format["%1", _dniNumber]);