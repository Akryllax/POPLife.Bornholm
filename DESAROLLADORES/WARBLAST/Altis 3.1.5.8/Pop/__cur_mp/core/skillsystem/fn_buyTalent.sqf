#include <macro.h>
/*
	File: fn_buyTalent.sqf
	Author: Ciaran Langton
	
	Desc:
	Executes the user action for buying a talent.. ----ALTISLIFE.CO.UK ONLY----
*/
_display = findDisplay 3500;
_listBox = _display displayCtrl 1500; //Get the list
//TALENTID AS STRING TO NUMBER
_skillID = lbData[1500,lbCurSel (1500)];
_skillID = call compile format["%1",_skillID];
//ERROR - TALENT ID WAS NULL - FAILED DIALOG?
if(isNil '_skillID') exitWith {};
if(_skillID in (life_skills select 0)) exitWith {hint "You already know that skill...";};
if(count (life_skills select 0) >= (__GETC__(life_max_talents))) exitWith {hint format["You can only own %1 different talents! This is increased when we release a update with new talents.",(__GETC__(life_max_talents))];};
if((life_skills select 1) < 5) exitWith {hint "You do not have 5 points to invest into this skill!";};
_skill = [];
{if((_x select 0) == _skillID) exitWith {_skill = _X};} forEach (call life_skillCfg); //"Index function", getting the array via the number.
if(count _skill != 5) exitWith {};
_exit = false;
//Needs a talent before!
if(_skill select 3 != 0) then {
	if(!((_skill select 3) in (life_skills select 0))) then {_exit = true;};
};
if(_exit) exitWith {hint "You are missing a requirement to buy this skill!";};

["<t color='#40FF00'>You gained a new skill!</t>"] spawn life_fnc_showNotification;

hint format["You know know the %1 skill!",_skill select 2];
(life_skills select 0) pushBack _skillID;
life_skills set [1,(life_skills select 1) - 5]; //Set the amount down.

//Repop the dialog.
lbClear _listBox;
[_listBox,0,0] spawn life_fnc_addRow;

_title = _display displayCtrl 1000;
_points = (count (life_skills select 0)*5);
_pointsTotal = (life_skills select 1) + (count (life_skills select 0)*5);
_title ctrlSetText format["AltisLife.co.uk Skills Menu - Points Spent: %1/%2 - Unspent Points: %3", _points, _pointsTotal, (life_skills select 1)];
[8] call SOCK_fnc_updatePartial;

//Handle bag weight fix.
if(_skillID in [20,21,22]) then {life_refreshBackpackSpace = true;};