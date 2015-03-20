#include <macro.h>
/*
	File: fn_addXP.sqf
	Author: Ciaran Langton
	
	Desc:
	Adds XP to the player.. ----ALTISLIFE.CO.UK ONLY----
*/
if((count (life_skills select 0)*5)+(life_skills select 1) >= ((__GETC__(life_max_talents))*5)) exitWith {}; //Dont give them anymore! They already have maxed out spent points!
_xp = [_this,0,0,[0]] call BIS_fnc_param;
_modifier = 4; //Number to nerf it down by.

_currentPoints = life_skills select 1;
_currentXP = life_skills select 2;
_currentXP = _currentXP + round(floor(_xp / _modifier)); //Divide by the modifer, then round and floor
if(_currentXP >= 100) then { //If it is bigger than 100 xp then add that to one level!
	_currentXP = 0; //Reset the XP
	life_skills set[1,(_currentPoints + 1)]; //Up by one
};
life_skills set[2,_currentXP]; //Set new value
[8] call SOCK_fnc_updatePartial;

[format["<t color='#40FF00'>Gained</t> <t color='#2E2EFE'>%1 XP!</t>",round(floor(_xp / _modifier))]] spawn life_fnc_showNotification;

if(((count (life_skills select 0)*5)+(life_skills select 1) >= ((__GETC__(life_max_talents))*5)) && life_skills select 2 > 0) then {
	life_skills set[2,0]; //Set the XP to 0
	["<t color='#FE2E2E'>Max XP Cap Reached.</t>"] spawn life_fnc_showNotification;
};