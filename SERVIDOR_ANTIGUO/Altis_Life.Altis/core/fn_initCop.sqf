#include <macro.h>
/*
	File: fn_initCop.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Cop Initialization file.
*/
private["_end"];
player addRating 99999999;
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
[] call life_fnc_copUniform; // added line for cop uniforms 09.03.2014
waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.
player enableFatigue false; 

[] spawn
{
while {true} do
	{
		waitUntil {uniform player == "U_Rangemaster"};
		[] call life_fnc_copUniform;
		waitUntil {uniform player != "U_Rangemaster"};
	};
};

[] spawn
{
while {true} do
	{
		waitUntil {uniform player == "U_B_CombatUniform_mcam_vest"};
		[] call life_fnc_copUniform;
		waitUntil {uniform player != "U_B_CombatUniform_mcam_vest"};
	};
};
[] execVM "core\POP\bienvenido.sqf";

if(__GETC__(life_adminlevel) > 0) then {
	adminChannel radioChannelAdd [player];
};

EMSChannel radioChannelAdd [player];