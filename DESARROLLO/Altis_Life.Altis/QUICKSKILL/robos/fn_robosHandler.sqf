/*
	File: fn_robosHandler.sqf
	Author: Quickskill
	Edited: Akryllax
	Desc: wacha gona dú güen dei come for yú

	
	NO --> Example: this addAction[format["Robar %1","Camello del bar"],QUICK_fnc_robosHandler,["Camello del bar",15,round random 200000,50,0,["marijuana"]]];
	
	Example:
	
		this addAction["Robar X", QUICK_fnc_robosHandler, ["Camellito camello", TIMEPO, DINERO, METROS DE ROBO, ITEMS RECOMPENSA, POLICIA]];
*/
	
//Variables privadas generales
private["_vendedor","_ladron","_action","_nombreRobo","_tiempoRobo","_dinero","_metros_cancelar_robo","_policias","_robosActivados","_cops","_policias","_Pos","_marker","_markerIDrandom"];

//to?who?what?
_vendedor = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_ladron = 	[_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;
_action = 	[_this,2] call BIS_fnc_param;//Action name

_params = [_this, 3, [], [[]] call BIS_fnc_param;

if!(count _params > 0) exitWith{}; //WHAT THE FUCKING FUCKED FUCK ARMA, STOP MESSING ARROUND
_params pushBack _vendedor;
_params pushBack _ladron;

//_robosActivados = robosActivados ;
_cops = (west countSide playableUnits);

//Si no hay x policias no se puede robar
if(_cops < (_params select 5)) exitWith {
	hint "No hay suficiente policía para robar.";
};

//Si no va armado no puede robar
if (currentWeapon _ladron == "") exitWith {
	hint "No me amenaces! Fuera de aquí pordiosero!";
};

//Avisar a la policia
[[1,format["Alarma activada! - Se esta produciendo un atraco en %1 !", _params select 0]],"life_fnc_broadcast",west,false] spawn life_fnc_MP;

//Añadir robo al ladron
[[getPlayerUID _ladron,name _ladron,"211"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;

//Quitar opcion del robo
_vendedor removeAction _action;

//Poner marcador de robo
_pos = position _vendedor;
//Generate Location ID (non collision)
_i = 1;
_markerID = getMarkerPos format["marker_%1",_i];
while{ !((getMarkerPos _markerID) isEqualTo [0,0,0])} do {
	_markerID = format["marker_%1",_i];
	_i = _i + 1;
};
_marker = createMarker [ _markerID, _pos];
_marker setMarkerColor "ColorRed";
_marker setMarkerText "!ATENCION! Estan robando aqui!";
_marker setMarkerType "mil_warning";

_params pushBack _markerID;

//Iniciar timer robo
_params spawn QUICK_fnc_timerRobo;

//Borrar marcador robo
deleteMarker _marker; // by ehno delete maker

//Regeneramos la accion de poder robar
sleep 15 * 60; //Wait

//Reset the params
_params resize ((count _params) - 3);

//Añadimos otra vez la opcion de robar
_vendedor addAction[format["Robar %1",_nombreRobo],QUICK_fnc_robosHandler,_params];	

