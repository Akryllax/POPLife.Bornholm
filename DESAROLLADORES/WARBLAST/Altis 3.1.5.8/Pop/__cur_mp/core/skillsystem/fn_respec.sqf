#include <macro.h>
/*
	File: fn_respec.sqf
	Author: Ciaran Langton
	
	Desc:
	Executes the user action for respecing the talents.. ----ALTISLIFE.CO.UK ONLY----
*/
_points = (count (life_skills select 0))*5;
if(_points < 1) exitWith {hint "You do not have any points to respec!"};
if(ALUK_bankedwonga < 25000) exitWith {hint "You do not have £25,000 to respec all your skills!";};

_text = switch (playerSide) do
{
	case west: {"Cop"};
	case independent: {"NHS"};
	case civilian: {"Civilian"};
};

_action = [
	format["This will cause you to lose all of your %1 talents! You will lose 33%2 of your points!",_text,"%"],
	"Are you sure?",
	localize "STR_Global_Yes",
	localize "STR_Global_No"
] call BIS_fnc_guiMessage;

if(!_action) exitWith {};

_points = (round((_points/100)*67));
_points = _points + (life_skills select 1);

life_skills = [[],_points,(life_skills select 2)]; 
ALUK_bankedwonga = ALUK_bankedwonga - 25000;
hint format["You have now forgotten everything you knew! You were charged £25,000 for it. You received: %1 Points back.",_points];
["<t color='#FE2E2E'>You lost all your skills!</t>"] spawn life_fnc_showNotification;
life_refreshBackpackSpace = true;

_display = findDisplay 3500;
_listBox = _display displayCtrl 1500; 
_title = _display displayCtrl 1000;

_title ctrlSetText format["AltisLife.co.uk Skills Menu - Points Spent: %1/%2 - Unspent Points: %3", 0, _points, _points];
lbClear _listBox;
[_listBox,0,0] spawn life_fnc_addRow;
[8] call SOCK_fnc_updatePartial;