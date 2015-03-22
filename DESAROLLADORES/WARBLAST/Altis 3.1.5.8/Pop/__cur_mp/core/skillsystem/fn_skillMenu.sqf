#include <macro.h>
/*
	File: fn_skillMenu.sqf
	Author: Ciaran Langton
	
	Desc:
	Loads the skill menu and populates the dialog. ----ALTISLIFE.CO.UK ONLY----
*/
disableSerialization;
createDialog "life_skill_dialog"; //Create the dialog.
_display = findDisplay 3500;
_listBox = _display displayCtrl 1500; //Get the list
_title = _display displayCtrl 1000;

_points = (count (life_skills select 0)*5);
_pointsTotal = (life_skills select 1) + (count (life_skills select 0)*5);

_title ctrlSetText format["AltisLife.co.uk Skills Menu - Points Spent: %1/%2 - Unspent Points: %3", _points, _pointsTotal, (life_skills select 1)];

[_listBox,0,0] spawn life_fnc_addRow;