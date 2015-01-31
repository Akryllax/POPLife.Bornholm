/*
    File: fn_packupmuro.sqf
    Author: Bryan "Tonic" Boardwine
    Edited by: OLLI aka Hauklotz

    Description:
    Packs up a deployed wall.
*/
private["_muro"];
_muro = nearestObjects[getPos player,["Land_Concrete_SmallWall_4m_F"],8] select 0;
if(isNil "_muro") exitWith {};

if(([true,"muro",1] call life_fnc_handleInv)) then
{
    titleText["Has colocado un muro.","PLAIN"];
    player removeAction life_action_muroPickup;
    life_action_muroPickup = nil;
    deleteVehicle _muro;
};