/*
	File: fn_packupCone.sqf
	Autor: Tisor


	Description:
	Recoge lo que sea
*/
private["_item"];
_item = nearestObjects[getPos player,["RoadBarrier_light"],8] select 0;
if(isNil "_item") exitWith {};

if(([true,"popbarrera",1] call life_fnc_handleInv)) then
{
	titleText["Has recogido la barrera con luz.","PLAIN"];
//	player removeAction life_action_popbarreraPickup;
//	life_action_popbarreraPickup = nil;
	deleteVehicle _item;
};