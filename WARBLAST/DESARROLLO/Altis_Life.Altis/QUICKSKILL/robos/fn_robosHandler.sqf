////////funcion timer para el robo, no tocar////
_QUICK_timerRobo = {

        _this spawn{
private "_nombreRobo";
private "_time";
private "_vendedor";
private "_ladron";
private "_metros";
private "_metros_cancelar_robo";
private "_dinero";
private "_pagar_ladron";
private "_itemsRecompensa";


_nombreRobo =  _this select 0;
_time = _this select 1;
_vendedor = _this select 2;
_ladron = _this select 3;
_dinero = _this select 4;
_metros_cancelar_robo = _this select 5;
_itemsRecompensa = _this select 6;
_metros =  _vendedor distance _ladron;
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
    	
/// si muere quitamos el timer
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

	//si a robado pagar al ladron
	if(_pagar_ladron == "si" and alive _ladron) then {
	
		//dar pasta
		life_cash = life_cash + _dinero;

		//dar item especiales
		 { 

		 [true,_x,5] call life_fnc_handleInv;

		} forEach _itemsRecompensa;		

        //informar al jugador
		
		[]spawn{sleep 1;hint format["Has robado %1 ",_nombreRobo];sleep 3;hint ""};



	};//end pagar al ladron


	//terminar script	
	if(true) exitWith{};

};//end ha terminado el timer
     

       };//end this spawn

};//end funcion quicktimerobo

//////////////////////
//Scripts robos v1 by quickskill

//ejemplo de robo
//this addAction[format["Robar %1","Camello del bar"],QUICK_fnc_robosHandler,["Camello del bar",15,round random 200000,50,0,["marijuana"]]];

	
//variables privadas generales
private["_vendedor","_ladron","_action","_nombreRobo","_tiempoRobo","_dinero","_metros_cancelar_robo","_policias","_robosActivados","_cops","_policias","_Pos","_marker","_markerIDrandom"];

//to?who?what?
_vendedor = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_ladron = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;
_action = [_this,2] call BIS_fnc_param;//Action name

//config
_nombreRobo =_this select 3 select 0;//"camello del bar" _this select 3 select 0
_tiempoRobo = _this select 3 select 1;// 300
_dinero = _this select 3 select 2;//round( random( 100000) + 25000);
_metros_cancelar_robo = _this select 3 select 3;//50
_policias = _this select 3 select 4;//3;
//_robosActivados = robosActivados ;
_itemsRecompensa =_this select 3 select 5;//["marijuana","cocainep","heroinep"];
_cops = (west countSide playableUnits);

//si no hay x policias no se puede robar
if(_cops < _policias) exitWith{[["",-1],"disableSerialization;",false,false] spawn life_fnc_MP; hint "No hay suficiente policía para robar!";};
disableSerialization;

//sino va armado no puede robar
if (currentWeapon _ladron == "") exitWith { hint "¡No me amenaces! ¡Fuera de aquí pordiosero!";};

//avisar a la policia
[[1,format["Alarma activada! - Se esta produciendo un atraco en %1 !", _nombreRobo]],"life_fnc_broadcast",west,false] spawn life_fnc_MP;

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
_script_handler = [_nombreRobo,_tiempoRobo,_vendedor,_ladron,_metros_cancelar_robo,_dinero,_itemsRecompensa] spawn _QUICK_timerRobo;
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

//desvelamos la ultima posicion del ladron
sleep 30;

//borramos marcador
deleteMarker _marker; 

//regeneramos la accion de poder robar
sleep _tiempoRegenerarRobo;


//añadimos otra vez la opcion de robar
_action = _vendedor addAction[format["Robar %1",_nombreRobo],QUICK_fnc_robosHandler,[_nombreRobo,_tiempoRobo,_dinero,_metros_cancelar_robo,_policias,_itemsRecompensa]];	

