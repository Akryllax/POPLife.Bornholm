/*
    File: fn_packupbarricade.sqf
    Author: Bryan "Tonic" Boardwine
	Edited by: synced-gaming.de

    Description:
    Packs up a deployed barricade.
*/
private["_valla"];
_valla = nearestObjects[getPos player,["RoadBarrier_F"],8] select 0;
if(isNil "_valla") exitWith {};
if(playerSide == civilian) exitWith {};

if(([true,"valla",1] call life_fnc_handleInv)) then
{
    titleText["ha levantado la valla.","PLAIN"];
    player removeAction life_action_vallaPickup;
    life_action_vallaPickup = nil;
    deleteVehicle _valla;
};