/*
	File: fn_muro.sqf
	Author: Bryan "Tonic" Boardwine
	Edited by: OLLI aka Hauklotz
	
	Description:
	Creates a wall and preps it.
*/
private["_position","_muro"];
_muro = "Land_Concrete_SmallWall_4m_F" createVehicle [0,0,0];
_muro attachTo[player,[0,5.5,0.2]];
_muro setDir 90;
_muro setVariable["item","muroDeployed",true];

life_action_muroDeploy = player addAction["Montar Muro",{if(!isNull life_muro) then {detach life_muro; life_muro = ObjNull;}; player removeAction life_action_muroDeploy; life_action_muroDeploy = nil;},"",999,false,false,"",'!isNull life_muro'];
life_muro = _muro;
waitUntil {isNull life_muro};
if(!isNil "life_action_muroDeploy") then {player removeAction life_action_muroDeploy;};
if(isNull _muro) exitWith {life_muro = ObjNull;};
_muro setPos [(getPos _muro select 0),(getPos _muro select 1),0];
_muro allowDamage false;
life_fnc_packupmuro = player addAction["Cancelar Muro",QUICK_fnc_packupmuro,"",0,false,false,"",' _muro = nearestObjects[getPos player,["Land_Concrete_SmallWall_4m_F"],8] select 0; !isNil "_muro" && !isNil {(_muro getVariable "item")}'];