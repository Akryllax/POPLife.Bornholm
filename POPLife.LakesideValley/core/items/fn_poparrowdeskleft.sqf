/*
	File: fn_poparrowdeskleft.sqf
	Author: Tisor


	Description:
	Para que funcionen los objetos
*/
private["_position","_poparrowdeskleft"];
_poparrowdeskleft = "Arrowdesk_L_F" createVehicle [0,0,0];
_poparrowdeskleft attachTo[player,[0,2.5,0.5]];
_poparrowdeskleft setDir 0;
_poparrowdeskleft setVariable["item","poparrowdeskleftDeployed",true];
_poparrowdeskleft enableSimulation false;

life_action_poparrowdeskleftDeploy = player addAction["Poner flechas",{if(!isNull life_poparrowdeskleft) then {detach life_poparrowdeskleft; life_poparrowdeskleft = ObjNull;}; player removeAction life_action_poparrowdeskleftDeploy; life_action_poparrowdeskleftDeploy = nil;},"",999,false,false,"",'!isNull life_poparrowdeskleft'];

life_poparrowdeskleft = _poparrowdeskleft;
waitUntil {isNull life_poparrowdeskleft};
if(!isNil "life_action_poparrowdeskleftDeploy") then {player removeAction life_action_poparrowdeskleftDeploy;};
if(isNull _poparrowdeskleft) exitWith {life_poparrowdeskleft = ObjNull;};
_poparrowdeskleft setPos [(getPos _poparrowdeskleft select 0),(getPos _poparrowdeskleft select 1),0];
_poparrowdeskleft setDamage 0;
_poparrowdeskleft enableSimulation true;
//life_action_poparrowdeskleftPickup = player addAction["Recoger flechas",life_fnc_packuppoparrowdeskleft,"",0,false,false,"",
//' _poparrowdesklefts = nearestObjects[getPos player,["Arrowdesk_L_F"],3] select 0; !isNil "_poparrowdesklefts" && !isNil {(_poparrowdesklefts getVariable "item")}'];

