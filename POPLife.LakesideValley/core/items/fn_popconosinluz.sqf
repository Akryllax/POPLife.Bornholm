/*
	File: fn_popconosinluz.sqf
	Author: Tisor


	Description:
	Para que funcionen los objetos
*/
private["_position","_popconosinluz"];
_popconosinluz = "RoadCone_F" createVehicle [0,0,0];
_popconosinluz attachTo[player,[0,2.5,0.5]];
_popconosinluz setDir 0;
_popconosinluz setVariable["item","popconosinluzDeployed",true];
_popconosinluz enableSimulation false;

life_action_popconosinluzDeploy = player addAction["Poner cono sin luz",{if(!isNull life_popconosinluz) then {detach life_popconosinluz; life_popconosinluz = ObjNull;}; player removeAction life_action_popconosinluzDeploy; life_action_popconosinluzDeploy = nil;},"",999,false,false,"",'!isNull life_popconosinluz'];
life_popconosinluz = _popconosinluz;
waitUntil {isNull life_popconosinluz};
if(!isNil "life_action_popconosinluzDeploy") then {player removeAction life_action_popconosinluzDeploy;};
if(isNull _popconosinluz) exitWith {life_popconosinluz = ObjNull;};
_popconosinluz setPos [(getPos _popconosinluz select 0),(getPos _popconosinluz select 1),0];
_popconosinluz setDamage 0;
/*life_action_popconosinluzPickup = player addAction["Recoger cono sin luz",life_fnc_packuppopconosinluz,"",0,false,false,"",'_popconosinluzs = nearestObjects[getPos player,["RoadCone_F"],3] select 0; !isNil "_popconosinluzs" && !isNil {(_popconosinluzs getVariable "item")}'];*/

