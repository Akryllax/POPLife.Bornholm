/*
	File: fn_timerRobo.sqf
	Author: Quickskill
	Edited: Akryllax
	Desc: wacha gona dú güen dei come for yú
*/

private ["_nombreRobo", "_time", "_metros", "_metros_cancelar_robo", "_dinero", "_pagar_ladron", "_itemsRecompensa", "_vendedor", "_ladron", "_marker"];

_nombreRobo =  			[_this, 0, "",[""]] call BIS_fnc_param;
_time = 				[_this, 1, -1,[-1]] call BIS_fnc_param;
_dinero = 				[_this, 2, -1,[-1]] call BIS_fnc_param;
_metros_cancelar_robo = [_this, 3, -1,[-1]] call BIS_fnc_param;
_itemsRecompensa = 		[_this, 4, [],[[]]] call BIS_fnc_param;
_vendedor = 			[_this, 5, objNull,[objNull]] call BIS_fnc_param;
_ladron = 				[_this, 6, objNull,[objNull]] call BIS_fnc_param;
_markerID =				[_this, 7, "",[""]] call BIS_fnc_param;
_pagar_ladron = 		false;

//Error checking 'n shit, fucking Arma 3
if!(count _nombreRobo > 0) exitWith{hint "Error, _nombreRobo is null";};
if(_time < 0) exitWith{ hint "Error, _time is null";};
if(isNull _vendedor) exitWith{ hint "Error, _vendedor is null"};
if(_dinero < 0) exitWith{ hint "Error, _dinero is null"};
if(_metros_cancelar_robo) exitWith{ hint "Error, _metros_cancelar_robo is null"};
if!(count _itemsRecompensa > 0) exitWith{ hint "Error, _itemsRecompensa is null"};

_metros = _vendedor distance _ladron;

//Guardamos el tiempo de inicio del robo.
_timestamp = time;

while {time < _timestamp + _time} do {
	_metros =  _vendedor distance _ladron;
	
	if(_metros > _metros_cancelar_robo) exitWith{		
		hintSilent format["Has abandonado la zona de robo estabas a %1m del vendedor",round (_metros)];
		_pagar_ladron = false;
		deleteMarker _markerID;
	};
	
	//Si muere quitamos el timer y el marcador de robo.
	if !(alive _ladron) exitWith{
		deleteMarker _markerID;
	};

	hintSilent format["Tiempo para robar: %1 \n Distancia: %2m (max %3m)", [((_timestamp + _time - time)/60)+.01,"HH:MM"] call BIS_fnc_timetostring,round (_metros),_metros_cancelar_robo];	
	_pagar_ladron = true;
	sleep 1;
};

if!(alive _ladron) exitWith{};

if(_pagar_ladron) then {
	life_cash = life_cash + _dinero;
	[0] call SOCK_fnc_updatePartial;

	//Dar item especiales
	{
		[true,_x,5] call life_fnc_handleInv;
	} forEach _itemsRecompensa;

	//Informar al jugador
	hint format["Has robado %1 ",_nombreRobo];
	deleteMarker _markerID;

	//Crear marcador ultima posicion del ladron
	_pos = position _ladron; 
	_markerIDrandom = format["marker_%1",floor(random 1000)];
	_marker = createMarker [ format["%1", _markerIDrandom],_Pos ];
	_marker setMarkerColor "ColorRed";
	_marker setMarkerText "!ATENCION! Ladrón visto aqui por última vez!";
	_marker setMarkerType "mil_warning";

	//desvelamos la ultima posicion del ladron
	sleep 30;

	//borramos marcador
	deleteMarker _marker; 
};