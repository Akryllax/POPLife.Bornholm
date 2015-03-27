/*
	File: fn_packupCone.sqf
	Autor: Tisor


	Description:
	Recoge lo que sea
*/
private["_item"];
_item = nearestObjects[getPos player,["RoadCone_F"],8] select 0;
if(isNil "_item") exitWith {};

if(([true,"popconosinluz",1] call life_fnc_handleInv)) then
{
	titleText["Has recogido el cono.","PLAIN"];
//	player removeAction life_action_popconosinluzPickup;
//	life_action_popconosinluzPickup = nil;
	deleteVehicle _item;
};