/*
	File: fn_popbarrera.sqf
	Author: Tisor


	Description:
	Para que funcionen los objetos
*/
private["_position","_popbarrera"];
_popbarrera = "RoadBarrier_light" createVehicle [0,0,0];
_popbarrera attachTo[player,[0,2.5,0.5]];
_popbarrera setDir 0;
_popbarrera setVariable["item","popbarreraDeployed",true];
_popbarrera enableSimulation false;

life_action_popbarreraDeploy = player addAction["Poner barrera con luz",{if(!isNull life_popbarrera) then {detach life_popbarrera; life_popbarrera = ObjNull;}; player removeAction life_action_popbarreraDeploy; life_action_popbarreraDeploy = nil;},"",999,false,false,"",'!isNull life_popbarrera'];
life_popbarrera = _popbarrera;
waitUntil {isNull life_popbarrera};
if(!isNil "life_action_popbarreraDeploy") then {player removeAction life_action_popbarreraDeploy;};
if(isNull _popbarrera) exitWith {life_popbarrera = ObjNull;};
_popbarrera setPos [(getPos _popbarrera select 0),(getPos _popbarrera select 1),0];
_popbarrera setDamage 0;
_popbarrera enableSimulation true;
/*life_action_popbarreraPickup = player addAction["Recoger barrera con luz",life_fnc_packuppopbarrera,"",0,false,false,"",
' _popbarreras = nearestObjects[getPos player,["RoadBarrier_light"],3] select 0; !isNil "_popbarreras" && !isNil {(_popbarreras getVariable "item")}'];*/

