/*
	File: fn_packupCone.sqf
	Autor: Tisor


	Description:
	Recoge lo que sea
*/
private["_item"];
_item = nearestObjects[getPos player,["RoadBarrier_long"],8] select 0;
if(isNil "_item") exitWith {};

if(([true,"popbarreragrande",1] call life_fnc_handleInv)) then
{
	titleText["Has recogido la barrera de carretera.","PLAIN"];
//	player removeAction life_action_popbarreragrandePickup;
	//life_action_popbarreragrandePickup = nil;
	deleteVehicle _item;
};