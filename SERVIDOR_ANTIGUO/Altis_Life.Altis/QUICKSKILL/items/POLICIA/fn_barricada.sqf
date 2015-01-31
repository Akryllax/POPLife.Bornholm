/*
	File: fn_barricada.sqf
	Author: Bryan "Tonic" Boardwine
	Edited by: synced-gaming.de

	Description:
	Creates a barricada.
*/
private["_position","_barricada"];
_barricada = "TapeSign_F" createVehicle [0,0,0];
_barricada attachTo[player,[0,5.5,0.2]];
_barricada setDir 90;
_barricada setVariable["item","barricadaDeployed",true];

life_action_barricadaDeploy = player addAction["Poner barricada",{if(!isNull life_barricada) then {detach life_barricada; life_barricada = ObjNull;}; player removeAction life_action_barricadaDeploy; life_action_barricadaDeploy = nil;},"",999,false,false,"",'!isNull life_barricada'];
life_barricada = _barricada;
waitUntil {isNull life_barricada};
if(!isNil "life_action_barricadaDeploy") then {player removeAction life_action_barricadaDeploy;};
if(isNull _barricada) exitWith {life_barricada = ObjNull;};
_barricada setPos [(getPos _barricada select 0),(getPos _barricada select 1),0];
_barricada allowDamage false;
life_action_barricadaPickup = player addAction["Cancelar barricada",QUICK_fnc_packUpbarricada,"",0,false,false,"",
' _barricada = nearestObjects[getPos player,["TapeSign_F"],8] select 0; !isNil "_barricada" && !isNil {(_barricada getVariable "item")}'];
[[_barricada],"TON_fnc_barricada",false,false] spawn life_fnc_MP; //Send it to the server for monitoring.