#include <macro.h>
/*
	File: fn_initCiv.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Initializes the civilian.
*/
private["_spawnPos","_playerPosition"];
diag_log format ["%1",life_civ_position]; //For debugging
civ_spawn_1 = nearestObjects[getMarkerPos  "civ_spawn_1", ["Land_i_Shop_01_V1_F","Land_i_Shop_02_V1_F","Land_i_Shop_03_V1_F","Land_i_Stone_HouseBig_V1_F"],250];
civ_spawn_2 = nearestObjects[getMarkerPos  "civ_spawn_2", ["Land_i_Shop_01_V1_F","Land_i_Shop_02_V1_F","Land_i_Shop_03_V1_F","Land_i_Stone_HouseBig_V1_F"],250];
civ_spawn_3 = nearestObjects[getMarkerPos  "civ_spawn_3", ["Land_i_Shop_01_V1_F","Land_i_Shop_02_V1_F","Land_i_Shop_03_V1_F","Land_i_Stone_HouseBig_V1_F"],250];
civ_spawn_4 = nearestObjects[getMarkerPos  "civ_spawn_4", ["Land_i_Shop_01_V1_F","Land_i_Shop_02_V1_F","Land_i_Shop_03_V1_F","Land_i_Stone_HouseBig_V1_F"],250];
waitUntil {!(isNull (findDisplay 46))};

if (!life_is_alive OR life_civ_position isEqualTo [0,0,0]) then
{
	[] call life_fnc_spawnMenu;
	waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
	waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.
	life_is_alive = true; // Just in-case the player disconnects before choosing a spawn position I guess? Otherwise debug island it is!
	player enableFatigue false;
}
else
{
	player enableFatigue false;
	if(life_is_arrested) then
	{
		life_is_arrested = false;
		[player,true] spawn life_fnc_jail;
	} else
	{
		//hint format["%1", civ_position];
		player setPos life_civ_position;
		hint format["Tu personaje sigue vivo. Se ha recuperado su ultima ubicacion."];
	};
	life_is_alive = true;
};

player addRating 99999999;
[] execVM "core\POP\bienvenido.sqf";
[] call life_fnc_copUniform; // added line for cop uniforms 09.03.2014
[[getPlayerUID player, profileName],"TON_fnc_loadBounties",false,false] spawn life_fnc_MP;


if(__GETC__(life_adminlevel) > 0) then {
	adminChannel radioChannelAdd [player];
};