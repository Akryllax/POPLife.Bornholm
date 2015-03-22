#include <macro.h>
/*
	File: fn_hasTalent.sqf
	Author: Ciaran Langton
	
	Desc:
	Checks if the player owns the talent or not. ----ALTISLIFE.CO.UK ONLY----
*/
_talent = [_this,0,0,[0]] call BIS_fnc_param;
(_talent in (life_skills select 0)) //Return.