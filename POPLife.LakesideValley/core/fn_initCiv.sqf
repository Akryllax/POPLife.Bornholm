/*
        File: fn_initCiv.sqf
        Author: Bryan "Tonic" Boardwine

        Description:
        Initializes the civilian.
*/
private ["_spawnPos", "_value", "_action", "_pName", "_playerPosition"];

_playerPosition = civ_position;
diag_log format ["# Civpos: %1", _playerPosition];// For debugging
player removeWeapon "A3L_PaintballGun_red";
player removeWeapon "A3L_PaintballGun_blue";
player removeWeapon "A3L_PaintballGun_pink";
{if (_x == "paintballs") then {player removeMagazine _x};
} foreach (magazines player);

// A tomar por culo age verification
// by Icaruk
if (!life_is_alive) then
{
	[] call life_fnc_spawnMenu;
	waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
	waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.
	life_is_alive = true; // Just in-case the player disconnects before choosing a spawn position I guess? Otherwise debug island it is!
	[24] call SOCK_fnc_updatePartial;
}
else
{
	if(life_is_arrested) then
				{
					life_is_arrested = false;
					[player,true] spawn life_fnc_jail;
				}
					else
						{
							player setPos _playerPosition;
							hint format["Tu personaje sigue vivo. Cargando Ultima Posicion Guardada."];
						};
	life_is_alive = true;
};
player addRating 9999999;
[] call life_fnc_zoneCreator;
[] call life_fnc_initDaemons;
[] execVM "SMS.sqf";