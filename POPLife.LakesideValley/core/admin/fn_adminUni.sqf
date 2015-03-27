#include <macro.h>
/*
    File: fn_adminKill.sqf
    Author: tenshi
*/
if(__GETC__(life_adminlevel) < 2) exitWith {closeDialog 0;};

if (uniform player != "A3L_SECRET") then{

	player addUniform "A3L_SECRET";
    life_god = false;
	hint "DIOS Desactivado";
	player allowDamage true;
} else {
	life_god = true;
	hint "DIOS Activado";
	player allowDamage false;
	player addUniform "A3L_Character_Uniform";
};



