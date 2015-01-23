#include <macro.h>
/*
	File: fn_initCiv.sqf
	Author: Bryan "Tonic" Boardwine


	Description:
	Initializes the civilian.
	blaaaaachecksum mod
*/
private["_spawnPos","_donatorlevel"];

civ_spawn_1 = nearestObjects[getMarkerPos  "civ_spawn_1", ["Land_i_Shop_01_V1_F","Land_i_Shop_02_V1_F","Land_i_Shop_03_V1_F","Land_i_Stone_HouseBig_V1_F"],250];
civ_spawn_2 = nearestObjects[getMarkerPos  "civ_spawn_2", ["Land_i_Shop_01_V1_F","Land_i_Shop_02_V1_F","Land_i_Shop_03_V1_F","Land_i_Stone_HouseBig_V1_F"],250];
civ_spawn_3 = nearestObjects[getMarkerPos  "civ_spawn_3", ["Land_i_Shop_01_V1_F","Land_i_Shop_02_V1_F","Land_i_Shop_03_V1_F","Land_i_Stone_HouseBig_V1_F"],250];
civ_spawn_4 = nearestObjects[getMarkerPos  "civ_spawn_4", ["Land_i_Shop_01_V1_F","Land_i_Shop_02_V1_F","Land_i_Shop_03_V1_F","Land_i_Stone_HouseBig_V1_F"],250];
waitUntil {!(isNull (findDisplay 46))};
// Donadores
switch (__GETC__(life_donator)) do
			{
				case 1: { _donatorlevel = 500; }; //Level 1
				case 2: { _donatorlevel = 1000; }; //Level 2
				case 3: { _donatorlevel = 1500; }; //Level 3
				case 4: { _donatorlevel = 2000; }; //Level 4
				default { _donatorlevel = 0; }; //default for non donators they get nada!
			};
_spawnMenu = {
	[] call life_fnc_spawnMenu;
	waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
	waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.
	life_is_alive = true; //Just to avoid that users appear in the debug island.
};

if (!life_is_alive) then
{
	[] call _spawnMenu;
} else {
	if(life_is_arrested) then
	{
		life_is_arrested = false;
		[player,true] spawn life_fnc_jail;
	} else {
		if(life_civ_position isEqualTo [0,0,0]) then {
			[] call _spawnMenu;
		} else {
			player setPos life_civ_position;
			hint format["Sigues vivo y estas donde la ultima vez..."];
		};
	};
	life_is_alive = true;
};

player addRating 9999999;

