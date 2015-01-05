//variabbles privadas genrales
private["_vendedor","_ladron","_action","_nombreRobo","_tiempoRobo","_dinero","_metros_cancelar_robo","_policias","_robosActivados","_cops","_policias","_Pos","_marker","_markerIDrandom"];

//to?who?what?
_vendedor = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_ladron = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;

_action = [_this,2] call BIS_fnc_param;//Action name

//config
_nombreRobo = "Camello del Bar";
_tiempoRobo = 60 * 8;
_dinero = 0;
_metros_cancelar_robo = 50;
_policias = 4;
_robosActivados = robosActivados ;
_itemsRecompensa =["marijuana","cocainep","heroinep"];


//si no hay x policias no se puede robar
_cops = (west countSide playableUnits);
if(_cops < _policias) exitWith{[["",-1],"disableSerialization;",false,false] spawn life_fnc_MP; hint "No hay suficiente policía para robar!";};
disableSerialization;

//sino va armnado no peude robar
if (currentWeapon _ladron == "") exitWith { hint "¡No me amenaces! ¡Fuera de aquí pordiosero!";};


//avisar a la policia
[[1,format["Alarma activada! - Se esta produciendo un atraco en %1 !", _nombreRobo]],"life_fnc_broadcast",west,false] spawn life_fnc_MP;

//+1 robo activo 
robosActivados = robosActivados + 1;

//añadir robo al ladron
[[getPlayerUID _ladron,name _ladron,"211"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;

//quitar opcion del robo
_vendedor removeAction _action;




//poner marcador de robo
_Pos = position _vendedor; 
_markerIDrandom = format["marker_%1",floor(random 1000)];
_marker = createMarker [ format["%1", _markerIDrandom],_Pos ];
_marker setMarkerColor "ColorRed";
_marker setMarkerText "!ATENCION! Estan robando aqui!";
_marker setMarkerType "mil_warning";	

//iniciar timer robo
_script_handler = [_tiempoRobo,_vendedor,_ladron,_metros_cancelar_robo,_dinero] execVM "robos\timer_hotel.sqf";
waitUntil { scriptDone _script_handler };



//borrar marcador robo
deleteMarker _marker; // by ehno delete maker

//crear marcador ultima posicion del ladron
_Pos = position _ladron; 
_markerIDrandom = format["marker_%1",floor(random 1000)];
_marker = createMarker [ format["%1", _markerIDrandom],_Pos ];
_marker setMarkerColor "ColorRed";
_marker setMarkerText "!ATENCION! Ladrón visto aqui por última vez!";
_marker setMarkerType "mil_warning";

sleep 30;

deleteMarker _marker; // by ehno delete maker

//regeneramos la accion de poder robar
sleep _tiempoRegenerarRobo;


//añadimos otra vez la opcion de robar
_action = _vendedor addAction["Robar",[_nombreRobo,_tiempoRobo,_dinero,_metros_cancelar_robo,_policias] spawn QUICK_fnc_robosHandler];	
_vendedor switchMove "";

////funciones robo ////

QUICK_timerRobo = {

        _this spawn{

private "_time";
private "_vendedor";
private "_ladron";
private "_metros";
private "_metros_cancelar_robo";
private "_dinero";
private "_pagar_ladron";
private "_itemsRecompensa";


_time = _this select 0;
_vendedor = _this select 1;
_ladron = _this select 2;
_metros =  _vendedor distance _ladron;
_metros_cancelar_robo = _this select 3;
_dinero = _this select 4;
_itemsRecompensa _this select 4;
_pagar_ladron = "no";

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
    	
/// si muere no le pagamos

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
    		

		
};//en while timer

//si el tiempo es mas pequeño que 1 ha termiando el robo

if(_time < 1) then{

	//si a roabdo pagar al ladron

	if(_pagar_ladron == "si" and alive _ladron) then {


		//dar pasta
		life_cash = life_cash + _dinero;


		//dar item especiales
		 { 

		 [true,_x,round(2 + random(8))] call life_fnc_handleInv;

		} forEach _itemsRecompensa;

		

      //informar al jugador
		
		[]spawn{sleep 1;hint format["Has robado ",_this select 0];sleep 3;hint ""};





	};



//terminar script
	
if(true) exitWith{ 

  //salir limpiando lso hints
	[]spawn { sleep 1;hint "";} };

};//end if termianr script

     

       };//end this spawn

};//en quicktiemrrobo
