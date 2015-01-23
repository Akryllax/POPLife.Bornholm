#include <macro.h>
/*
	File: fn_initCop.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Cop Initialization file.
*/
private["_end"];
player addRating 9999999;
waitUntil {!(isNull (findDisplay 46))};
_end = false;
if(life_blacklisted) exitWith
{
	["Blacklisted",false,true] call BIS_fnc_endMission;
	sleep 30;
};

if(!(str(player) in [""])) then {
	if((__GETC__(life_coplevel) == 0) && (__GETC__(life_adminlevel) == 0)) then {
		["NotWhitelisted",false,true] call BIS_fnc_endMission;
		sleep 35;
	};
};

player setVariable["rank",(__GETC__(life_coplevel)),true];
[] call life_fnc_spawnMenu;

waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.
player enableFatigue false;

AKR_tiroAtiro = {

	if((_this select 1) isEqualTo "hgun_P07_snds_F") then {
		[] spawn {
			player setAmmo ["hgun_P07_snds_F", 0];
			sleep taserDelay;
			
			player setAmmo ["hgun_P07_snds_F", 1];
		};
	};
};
player addEventHandler ["Fired", "_this call AKR_tiroAtiro"];

//poner uniforme
[] call life_fnc_copUniform;

if(__GETC__(life_adminlevel) > 0) then {
	adminChannel radioChannelAdd [player];
};

EMSChannel radioChannelAdd [player];