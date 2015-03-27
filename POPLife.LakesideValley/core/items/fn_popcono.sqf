/*
	File: fn_popcono.sqf
	Author: Tisor/

	Description:
	Para que funcionen los objetos
*/
private["_position","_popcono"];
_popcono = "RoadCone_L_F" createVehicle [0,0,0];
_popcono attachTo[player,[0,2.5,0.5]];
_popcono setDir 0;
_popcono setVariable["item","popconoDeployed",true];
_popcono enableSimulation false;

life_action_popconoDeploy = player addAction["Poner cono con luz",{if(!isNull life_popcono) then {detach life_popcono; life_popcono = ObjNull;}; player removeAction life_action_popconoDeploy; life_action_popconoDeploy = nil;},"",999,false,false,"",'!isNull life_popcono'];
life_popcono = _popcono;
waitUntil {isNull life_popcono};
if(!isNil "life_action_popconoDeploy") then {player removeAction life_action_popconoDeploy;};
if(isNull _popcono) exitWith {life_popcono = ObjNull;};
_popcono setPos [(getPos _popcono select 0),(getPos _popcono select 1),0];
_popcono setDamage 0;
/*life_action_popconoPickup = player addAction["Recoger cono con luz",life_fnc_packuppopcono,"",0,false,false,"",'_popconos = nearestObjects[getPos player,["RoadCone_L_F"],3] select 0; !isNil "_popconos" && !isNil {(_popconos getVariable "item")}'];
*/