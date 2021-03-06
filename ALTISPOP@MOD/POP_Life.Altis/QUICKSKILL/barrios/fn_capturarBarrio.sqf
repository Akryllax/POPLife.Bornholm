/*
	File: fn_capturarBarrio.sqf
	Author: quick
	
	Description:
	mis cojones gordos


	Ejemplo -> poner en una bandera de esas.
	Solo será visible si no esta capturado ya por la banda.
	
	this addAction["Capturar Barrio",QUICK_fnc_capturarBarrio,"Las 3000", 1.5, false, true, "", {!(this getVariable["capturadoPor", ""] isEqualTo ((group _jugador) getVariable ["gang_name", ""]))}];
*/
private["_barrioBandera","_jugador","_barrioName","_capturado","_tiempoCaptura","_barrioMetros"];


_barrioBandera = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_jugador = 		 [_this, 1, objNull, [objNull]] call BIS_fnc_param;
_id = 			 [_this, 2, -1, [-1]] call BIS_fnc_param;

_barrioName = 	 [_this, 3, "", [""]] call BIS_fnc_param;
_bandaNombre = 	 (group _jugador) getVariable ["gang_name", ""];
_capturado = 	 0;
_tiempoCaptura = 30;
_barrioMetros =  250;

if(count (_barrioBandera getVariable ["nombreBarrio", ""]) == 0) then { //AKR: No gastemos trafico.
	_barrioBandera setVariable["nombreBarrio",_barrioName,true];
};

debugCaptura = _barrioBandera getVariable ["capturadoPor",false];
debugNombreBarrio = _barrioBandera getVariable ["nombreBarrio",false];


//sino tiene una banda que la creee
if(count _bandaNombre == 0) exitWith {
	titleText["Crea una banda para poder capturar el barrio","Plain"];
};
//ya la estan capturando
if((_barrioBandera getVariable ["capturando",false])) exitWith {
	titleText["Ya estan capturando el barrio","Plain"];
};

//ya es de tu banda
if((_barrioBandera getVariable ["capturadoPor",""] isEqualTo _bandaNombre)) exitWith {	//AKR: isEqualTo es mejor que == para comparacion de strings
	titleText["Este barrio ya es de tu banda","Plain"];
};

_barrioBandera setVariable["capturando",true,true];

life_action_inUse = true;

hint format["Capturando el barrio de %1",_barrioName];

//timer
while {_tiempoCaptura > 0} do
{    
	//Si muere matamos al timer
	if(!alive _jugador) exitWith { _tiempoCaptura = 0 };

	// disableUserInput true;
	
	if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
		[[player,"AinvPknlMstpSnonWnonDnon_medic_1"],"life_fnc_animSync",true,false] spawn life_fnc_MP;
		player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
	};

	sleep 1;

	_tiempoCaptura = _tiempoCaptura - 1;	

	hintSilent format["Tiempo para capturar: %1 ", [((_tiempoCaptura)/60)+.01,"HH:MM"] call BIS_fnc_timetostring];
};


//ha terminado el timer
if(_tiempoCaptura < 1)then{

	debugCapturadoPor = _barrioBandera getVariable ["capturadoPor",false];

	hint "";

	if( alive _jugador )then{
		//han capturado el barrio

		titleText["El barrio ha sido capturado.","PLAIN"];

		_barrioBandera setVariable["capturadoPor",_bandaNombre,true];

		//crear markador de capturado
		_pos = position _barrioBandera;
		_markerID = format["marker_%1",floor(random 1000)];
		_marker = createMarker [ _markerID, _pos];
		_marker setMarkerColor "ColorRed";
		_marker setMarkerText format["!Barrio capturado por %1!!",_bandaNombre];
		_marker setMarkerType "mil_warning";

		//iniciar recompensas
		[_barrioBandera,_jugador,_barrioMetros,_marker,(group player)] spawn QUICK_fnc_barrioCapturado;

		//quitar action
		//_barrioBandera removeAction _id;


	};

	if(!alive _jugador)then{
		//han capturado el barrio
		titleText["Has fallado al capturar el barrio.","PLAIN"];

	};

	//disableUserInput false;
	life_action_inUse = false;
	_barrioBandera setVariable["capturando",false,true];

};