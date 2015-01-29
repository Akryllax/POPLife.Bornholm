#include <macro.h>
/*
	File: fn_initCop.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Cop Initialization file.
*/
private["_end","_donatorlevel"];
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
// Donadores
switch (__GETC__(life_donator)) do
			{
				case 1: { _donatorlevel = 500; }; //Level 1
				case 2: { _donatorlevel = 1500; }; //Level 2
				case 3: { _donatorlevel = 3000; }; //Level 3
				case 4: { _donatorlevel = 5000; };
				case 5: { _donatorlevel = 10000;}; //Level 4
				default { _donatorlevel = 0; }; //default for non donators they get nada!
			};

// Policia
switch (__GETC__(life_coplevel)) do
			{
				case 1: { life_paycheck = ((7000) + (_donatorlevel)); }; //local
				case 2: { life_paycheck = ((8000) + (_donatorlevel)); }; //local 2
				case 3: { life_paycheck = ((9000) + (_donatorlevel)); }; //nacional
				case 4: { life_paycheck = ((10000) + (_donatorlevel)); }; //nacional 2
				case 5: { life_paycheck = ((11000) + (_donatorlevel)); }; //GC
				case 6: { life_paycheck = ((12000) + (_donatorlevel)); }; //GC 2
				case 7: { life_paycheck = ((13000) + (_donatorlevel)); }; //GEO
				case 8: { life_paycheck = ((140000) + (_donatorlevel)); }; //Capitan
				default { life_paycheck = ((2000) + (_donatorlevel)); }; //default in-case anything goes tits up
			};
player setVariable["rank",(__GETC__(life_coplevel)),true];
[] call life_fnc_spawnMenu;

waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.
player enableFatigue false;

life_tiroAtiro = {

	if((_this select 1) isEqualTo "hgun_P07_snds_F") then {
		[] spawn {
			player setAmmo ["hgun_P07_snds_F", 0];
			sleep taserDelay;

			player setAmmo ["hgun_P07_snds_F", 1];
		};
	};
};
player addEventHandler ["Fired", "_this call life_tiroAtiro"];

//poner uniforme
[] call life_fnc_copUniform;

if(__GETC__(life_adminlevel) > 0) then {
	adminChannel radioChannelAdd [player];
};

EMSChannel radioChannelAdd [player];