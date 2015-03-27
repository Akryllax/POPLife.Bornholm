/*
	File: fn_poparrowdeskright.sqf
	Author: Tisor


	Description:
	Para que funcionen los objetos
*/
private["_position","_poparrowdeskright"];
_poparrowdeskright = "Arrowdesk_R_F" createVehicle [0,0,0];
_poparrowdeskright attachTo[player,[0,2.5,0.5]];
_poparrowdeskright setDir 0;
_poparrowdeskright setVariable["item","poparrowdeskrightDeployed",true];
_poparrowdeskright enableSimulation false;

life_action_poparrowdeskrightDeploy = player addAction["Poner flechas",{if(!isNull life_poparrowdeskright) then {detach life_poparrowdeskright; life_poparrowdeskright = ObjNull;}; player removeAction life_action_poparrowdeskrightDeploy; life_action_poparrowdeskrightDeploy = nil;},"",999,false,false,"",'!isNull life_poparrowdeskright'];
life_poparrowdeskright = _poparrowdeskright;
waitUntil {isNull life_poparrowdeskright};
if(!isNil "life_action_poparrowdeskrightDeploy") then {player removeAction life_action_poparrowdeskrightDeploy;};
if(isNull _poparrowdeskright) exitWith {life_poparrowdeskright = ObjNull;};
_poparrowdeskright setPos [(getPos _poparrowdeskright select 0),(getPos _poparrowdeskright select 1),0];
_poparrowdeskright setDamage 0;
_poparrowdeskright enableSimulation true;
/*life_action_poparrowdeskrightPickup = player addAction["Recoger flechas",life_fnc_packuppoparrowdeskright,"",0,false,false,"",
' _poparrowdeskrights = nearestObjects[getPos player,["Arrowdesk_R_F"],3] select 0; !isNil "_poparrowdeskrights" && !isNil {(_poparrowdeskrights getVariable "item")}'];*/

