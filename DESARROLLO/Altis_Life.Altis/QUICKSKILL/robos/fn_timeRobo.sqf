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