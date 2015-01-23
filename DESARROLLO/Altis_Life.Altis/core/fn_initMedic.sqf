#include <macro.h>
/*
	File: fn_initMedic.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Initializes the medic..
*/
private["_end"];
player addRating 99999999;
waitUntil {!(isNull (findDisplay 46))};

if((__GETC__(life_medicLevel)) < 1) exitWith {
	["Notwhitelisted",FALSE,TRUE] call BIS_fnc_endMission;
	sleep 35;
};

// Donadores
switch (__GETC__(life_donator)) do
			{
				case 1: { _donatorlevel = 500; }; //Level 1
				case 2: { _donatorlevel = 1000; }; //Level 2
				case 3: { _donatorlevel = 1500; }; //Level 3
				case 4: { _donatorlevel = 2000; }; //Level 4
				default { _donatorlevel = 0; }; //default for non donators they get nada!
			};

// Policia
switch (__GETC__(life_mediclevel)) do
			{
				case 1: { life_paycheck = ((2000) + (_donatorlevel)); }; //local
				case 2: { life_paycheck = ((3000) + (_donatorlevel)); }; //local 2
				case 3: { life_paycheck = ((4000) + (_donatorlevel)); }; //nacional
				case 4: { life_paycheck = ((5000) + (_donatorlevel)); }; //nacional 2
				default { life_paycheck = ((2000) + (_donatorlevel)); }; //default in-case anything goes tits up
			};
[] call life_fnc_spawnMenu;
waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.