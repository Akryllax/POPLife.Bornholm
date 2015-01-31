/*
    File: fn_packupbarricada.sqf
    Author: Bryan "Tonic" Boardwine
	Edited by: synced-gaming.de

    Description:
    Packs up a deployed barricada.
*/
private["_barricada"];
_barricada = nearestObjects[getPos player,["TapeSign_F"],8] select 0;
if(isNil "_barricada") exitWith {};
if(playerSide == civilian) exitWith {};

if(([true,"barricada",1] call life_fnc_handleInv)) then
{
    titleText["ha levantado la barricada.","PLAIN"];
    player removeAction life_action_barricadaPickup;
    life_action_barricadaPickup = nil;
    deleteVehicle _barricada;
};