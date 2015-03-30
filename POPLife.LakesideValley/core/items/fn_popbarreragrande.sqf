/*
	File: fn_popbarreragrande.sqf
	Author: Tisor


	Description:
	Para que funcionen los objetos
*/
private["_position","_popbarreragrande"];
_popbarreragrande = "RoadBarrier_long" createVehicle [0,0,0];
_popbarreragrande attachTo[player,[0,2.5,0.5]];
_popbarreragrande setDir 0;
_popbarreragrande setVariable["item","popbarreragrandeDeployed",true];
_popbarreragrande enableSimulation false;

life_action_popbarreragrandeDeploy = player addAction["Poner barrera",{if(!isNull life_popbarreragrande) then {detach life_popbarreragrande; life_popbarreragrande = ObjNull;}; player removeAction life_action_popbarreragrandeDeploy; life_action_popbarreragrandeDeploy = nil;},"",999,false,false,"",'!isNull life_popbarreragrande'];
life_popbarreragrande = _popbarreragrande;
waitUntil {isNull life_popbarreragrande};
if(!isNil "life_action_popbarreragrandeDeploy") then {player removeAction life_action_popbarreragrandeDeploy;};
if(isNull _popbarreragrande) exitWith {life_popbarreragrande = ObjNull;};
_popbarreragrande setPos [(getPos _popbarreragrande select 0),(getPos _popbarreragrande select 1),0];
_popbarreragrande setDamage 0;
_popbarreragrande enableSimulation true;
/*life_action_popbarreragrandePickup = player addAction["Recoger barrera",life_fnc_packuppopbarreragrande,"",0,false,false,"",
' _popbarreragrandes = nearestObjects[getPos player,["RoadBarrier_long"],3] select 0; !isNil "_popbarreragrandes" && !isNil {(_popbarreragrandes getVariable "item")}'];*/

