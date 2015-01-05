#include <macro.h>
/*
	File: fn_adminGodMode.sqf
	Author: Tobias 'Xetoxyc' Sittenauer

	Description: Enables God mode for Admin
*/

if(__GETC__(life_adminlevel) < 4) exitWith {closeDialog 0; hint localize "STR_ANOTF_ErrorLevel";};

admin_unfreeze = 
{
	while(life_god) do {
		if(player getVariable["restrained",FALSE]) then {
			[player] call life_fnc_unrestraing;
		};
	};
};

if(life_god) then {
	life_god = false;
	hint "DIOS Desactivado";
	player allowDamage true;
} else {
	life_god = true;
	hint "DIOS Activado";
	player allowDamage false;
};

if(isNull _handle) then {_handle = [] spawn admin_unfreeze;};
if(scriptDone _handle) then {_handle = [] spawn admin_unfreeze;};