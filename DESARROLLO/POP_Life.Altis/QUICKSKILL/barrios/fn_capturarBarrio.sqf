/*
	Author: quick
	
	Description:
	mis cojones gordos

	this addAction["Capturar Barrio",QUICK_fnc_capturarBarrio,[_barrioBandera,_jugador,_barrioName]];

	Ejemplo -> poner en una bandera de esas 
	this addAction["Capturar Barrio",QUICK_fnc_capturarBarrio,"Las 3000"];
*/
private["_barrioBandera","_jugador","_barrioName","_capturado","_tiempoCaptura","_barrioMetros"];


_barrioBandera= _this select 0;
_jugador= _this select 1;
 _id = _this select 2; 

_barrioName = _this select 3;
_bandaNombre = (group _jugador) getVariable "gang_name";
_barrioBandera setVariable["capturadoPor","",true];
_barrioBandera setVariable["nombreBarrio",_barrioName,true];




//sino tiene una banda que la creee
if(_bandaNombre == "") exitWith {titleText["Crea una banda para poder capturar el barrio","Plain"];};
//ya la estan caapturando
if((_barrioBandera getVariable ["capturando",false])) exitWith {titleText["Ya estan capturando el barrio","Plain"];};

//ya es de tu banda
if((_barrioBandera getVariable ["capturadoPor",""]==_bandaNombre)) exitWith {titleText["Este barrio ya es de tu banda","Plain"];};


_barrioBandera setVariable["capturando",true,true];

life_action_inUse = true;

//timer
_parametrosTimer= [_barrioBandera,_jugador,_barrioName];

_script_handler = _parametrosTimer spawn QUICK_fnc_timerCapturarBarrio;
waitUntil { scriptDone _script_handler };