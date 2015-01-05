/*
	File: fn_valla.sqf
	Author: Bryan "Tonic" Boardwine
	Edited by: synced-gaming.de
	
	Description:
	Creates a valla.
*/
private["_position","_valla"];
_valla = "RoadBarrier_F" createVehicle [0,0,0];
_valla attachTo[player,[0,5.5,0.2]];
_valla setDir 90;
_valla setVariable["item","vallaDeployed",true];

life_action_vallaDeploy = player addAction["Poner barricada",{if(!isNull life_valla) then {detach life_valla; life_valla = ObjNull;}; player removeAction life_action_vallaDeploy; life_action_vallaDeploy = nil;},"",999,false,false,"",'!isNull life_valla'];
life_valla = _valla;
waitUntil {isNull life_valla};
if(!isNil "life_action_vallaDeploy") then {player removeAction life_action_vallaDeploy;};
if(isNull _valla) exitWith {life_valla = ObjNull;};
_valla setPos [(getPos _valla select 0),(getPos _valla select 1),0];
_valla allowDamage false;
life_action_vallaPickup = player addAction["Cancelar barricada",QUICK_fnc_packUpvalla,"",0,false,false,"",
' _valla = nearestObjects[getPos player,["RoadBarrier_F"],8] select 0; !isNil "_valla" && !isNil {(_valla getVariable "item")}'];
[[_valla],"TON_fnc_valla",false,false] spawn life_fnc_MP; //Send it to the server for monitoring.