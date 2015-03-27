/*
	File: fn_packupCone.sqf
	Autor: Tisor


	Description:
	Recoge lo que sea
*/
private["_item"];
_item = nearestObjects[getPos player,["RoadCone_L_F"],8] select 0;
if(isNil "_item") exitWith {};

if(([true,"popcono",1] call life_fnc_handleInv)) then
{
	titleText["Has recogido el cono con luz.","PLAIN"];
	//player removeAction life_action_popconoPickup;
//	life_action_popconoPickup = nil;
	deleteVehicle _item;
};