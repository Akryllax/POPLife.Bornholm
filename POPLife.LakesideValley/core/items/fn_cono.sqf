/*
	File: fn_cono.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Creates a spike strip and preps it.
*/
private["_position","_cono"];
_cono = "RoadCone_L_F" createVehicle [0,0,0];
_cono attachTo[player,[0,2,0.5]];
_cono setDir 90;
_cono setVariable["item","conoDeployed",true];

life_action_conoDeploy = player addAction["Poner cono",{if(!isNull life_cono) then {detach life_cono; life_cono = ObjNull;}; player removeAction life_action_conoDeploy; life_action_conoDeploy = nil;},"",999,false,false,"",'!isNull life_cono'];
life_cono = _cono;
waitUntil {isNull life_cono};
if(!isNil "life_action_conoDeploy") then {player removeAction life_action_conoDeploy;};
if(isNull _cono) exitWith {life_cono = ObjNull;};
_cono setPos [(getPos _cono select 0),(getPos _cono select 1),0];
_cono setDamage 0;
life_action_conoPickup = player addAction["Recoger Cono",life_fnc_packupCono,"",0,false,false,"",
' _conos = nearestObjects[getPos player,["RoadCone_L_F"],3] select 0; !isNil "_conos" && !isNil {(_conos getVariable "item")}'];
[[_cono],"TON_fnc_cono",false,false] spawn life_fnc_MP; //Send it to the server for monitoring.