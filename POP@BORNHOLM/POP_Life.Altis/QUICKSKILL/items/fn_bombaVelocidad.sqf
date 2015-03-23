/*
shit!!! edited by quick!
*/
private["_unit"];
_unit = cursorTarget;
 
if((!(_unit isKindOf "LandVehicle"))&&(!(_unit getVariable ["restrained",false]))) exitWith {hint "No puedes añadir una bomba lapa a este vehiculo."};
if(player distance _unit > 5) exitWith {hint "Estas muy lejos!"};
if(!([false,"bombaVelocidad",1] call life_fnc_handleInv)) exitWith {};
closeDialog 0;
 
life_action_inUse = true;
 
player playMove "AinvPknlMstpSnonWnonDnon_medic_1";
sleep 1.5;
waitUntil {animationState player != "ainvpknlmstpsnonwnondnon_medic_1"};
 
life_action_inUse = false;
 
titleText["Has instalado una bomba de velocidad en este vehiculo","PLAIN"];
 
[_unit] spawn
{
	_veh = _this select 0;
	waitUntil {(speed _veh) > 70};
	[[_veh, "caralarm",10],"life_fnc_playSound",true,false] spawn life_fnc_MP;
	hint "Tu bomba de velocidad a sido activada! Pobres infieles!";
	{ [[2,"Una bomba de velocidad se a activado en el vehiculo, si reduces la velocidad a menos de 50km/h  BOOM!"],"life_fnc_broadcast",_x,false] spawn life_fnc_MP; } foreach (crew _veh);
	waitUntil {(speed _veh) < 50};

	_test = "Bo_Mk82" createVehicle [0,0,9999];
	_test setPos (getPos _veh);
	_test setVelocity [100,0,0];
	hint "Tu bomba a detonado!";
	[[getPlayerUID player,name player,"2"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
};