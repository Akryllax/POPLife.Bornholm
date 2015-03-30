/*
	File: fn_spikeStrip.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Creates a spike strip and preps it.
*/
private["_position","_spikeStrip"];
_spikeStrip = "Orel_Herse" createVehicle [0,0,0];
_spikeStrip attachTo[player,[0,5.5,0]];
_spikeStrip setDir 90;
_spikeStrip setVariable["item","spikeDeployed",true];

life_action_spikeStripDeploy = player addAction["Poner banda de clavos",{if(!isNull life_spikestrip) then {detach life_spikeStrip; life_spikeStrip = ObjNull;}; player removeAction life_action_spikeStripDeploy; life_action_spikeStripDeploy = nil;},"",999,false,false,"",'!isNull life_spikestrip'];

life_spikestrip = _spikeStrip;
waitUntil {isNull life_spikeStrip};
if(!isNil "life_action_spikeStripDeploy") then {player removeAction life_action_spikeStripDeploy;};
if(isNull _spikeStrip) exitWith {life_spikestrip = ObjNull;};
_spikeStrip setPos [(getPos _spikeStrip select 0),(getPos _spikeStrip select 1),0];
/*_spikeStrip setDamage 1; -> Estos no es necesario dañarlos, porque ya viene el model hecho. El daño era para el alambre de espino de altis life.*/

/*Aquí habría que estudiar la posibilidad de añadir la opción a todos los policias porque sino puede quitarla solo el que la ha puesto. Quizás un foreach de todos los policias en un radio de 50 metros?*/
/*life_action_spikeStripPickup = player addAction["Recoger barra de clavos",life_fnc_packupSpikes,"",0,false,false,"",
' _spikes = nearestObjects[getPos player,["Orel_Herse"],8] select 0; !isNil "_spikes" && !isNil {(_spikes getVariable "item")}'];*/

[[_spikeStrip],"TON_fnc_spikeStrip",false,false] spawn life_fnc_MP; //Send it to the server for monitoring.