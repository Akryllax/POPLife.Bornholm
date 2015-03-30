#include <macro.h>
/*
	File: fn_initMedic.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Initializes the medic..
*/


private["_spawnPos","_value","_action","_pName","_end"];

_value = parseNumber(ctrlText 9922);
if(_value < 0) exitWith {};
if(_value > 999999) exitWith {};

player removeWeapon "A3L_PaintballGun_red";
player removeWeapon "A3L_PaintballGun_blue";
player removeWeapon "A3L_PaintballGun_pink";
{if(_x == "paintballs") then {player removeMagazine _x};} foreach (magazines player);

/*Spawn Menu*/
player addRating 99999999;
waitUntil {!(isNull (findDisplay 46))};

if((__GETC__(life_medicLevel)) < 1) exitWith {
	["Notwhitelisted",FALSE,TRUE] call BIS_fnc_endMission;
	sleep 35;
};

[] call life_fnc_spawnMenu;
waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.

[] execVM "SMS.sqf";

