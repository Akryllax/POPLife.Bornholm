#include <macro.h>
/*
	File: fn_initInd.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Initializes the Indipendent
*/

waitUntil {!(isNull (findDisplay 46))};

if((__GETC__(life_merLevel)) < 1) exitWith {
	["Notwhitelisted",FALSE,TRUE] call BIS_fnc_endMission;
	sleep 35;
};

if(life_is_arrested) then
{
	life_is_arrested = false;
	[player,true] spawn life_fnc_jail;
};
	[] call life_fnc_spawnMenu;
	waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
	waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.
	player enableFatigue false; 

player addRating 0;

//[] call life_fnc_zoneCreator;
//[] call life_fnc_initHouses;
[] execVM "core\POP\bienvenido.sqf";

if(__GETC__(life_adminlevel) > 0) then {
	adminChannel radioChannelAdd [player];
};