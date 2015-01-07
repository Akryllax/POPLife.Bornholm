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
_pagar_ladron = 		false;

//Error checking 'n shit, fucking Arma 3
if(_nombreRobo == "") exitWith{hint "Error, _nombreRobo is null";};
if(_time < 0) exitWith{ hint "Error, _time is null";};
if(isNull _vendedor) exitWith{ hint "Error, _vendedor is null"};
if(isNull _ladron) exitWith{ hint "Error, _ladron is null"};
if(_dinero < 0) exitWith{ hint "Error, _dinero is null"};
if(_metros_cancelar_robo < 0) exitWith{ hint "Error, _metros_cancelar_robo is null"};
if!(count _itemsRecompensa > 0) exitWith{ hint "Error, _itemsRecompensa is null"};

_metros = _vendedor distance _ladron;

while {_time > 0} do {
	
	//mirar la distancia entre ladron i vendedor
	_metros =  _vendedor distance _ladron;

	//abandono zona de robo
	if(_metros > _metros_cancelar_robo) then{	
	
		hintSilent format["Has abandonado la zona de robo estabas a %1m del vendedor",round (_metros)];
		_time = 0;
		_pagar_ladron = "no";
		sleep 1;

	};
    	
	/// si muere paramos el contador
		if !(alive _ladron) then {
			_time = 0;
		};

	//mientras este dentro de rango que cuente el tiempo
	if(_metros < _metros_cancelar_robo) then{		
	
		//contar tiempo
		_time = _time - 1;  
		hintSilent format["Tiempo para robar: %1 \n Distancia: %2m (max %3m)", [((_time)/60)+.01,"HH:MM"] call BIS_fnc_timetostring,round (_metros),_metros_cancelar_robo];	
		sleep 1;
		_pagar_ladron = "si";
	};
    		
};//end while

if(_time < 1) then{

	//si a roabdo pagar al ladron

	if(_pagar_ladron == "si" and alive _ladron) then {

			//dar pasta
			life_cash = life_cash + _dinero;
			[0] call SOCK_fnc_updatePartial;

			//Dar item especiales
			{
				[true,_x,2] call life_fnc_handleInv;
			} forEach _itemsRecompensa;

			//pagar al jugador
			_nombreRoboHINT = format["Has robado %1, corre antes de que te pille la policia!!",_nombreRobo];
			hint _nombreRoboHINT;


	};
	
	//terminar script	
	if(true) exitWith{[]spawn { sleep 3;hint "";} };

};