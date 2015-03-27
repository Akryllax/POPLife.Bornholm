/*
	File: fn_packupCone.sqf
	Autor: Tisor


	Description:
	Recoge lo que sea
*/
private["_item"];
_item = nearestObjects[getPos player,["Arrowdesk_L_F"],8] select 0;
if(isNil "_item") exitWith {};

if(([true,"poparrowdeskleft",1] call life_fnc_handleInv)) then
{
	titleText["Has recogido la señal de flechas.","PLAIN"];
	//player removeAction life_action_poparrowdeskleftPickup;
	//life_action_poparrowdeskleftPickup = nil;
	deleteVehicle _item;
};