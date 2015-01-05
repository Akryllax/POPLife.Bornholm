private "_time";
private "_vendedor";
private "_ladron";
private "_metros";
private "_metros_cancelar_robo";
private "_dinero";
private "_pagar_ladron";

_time = _this select 0;
_vendedor = _this select 1;
_ladron = _this select 2;
_metros =  _vendedor distance _ladron;
_metros_cancelar_robo = _this select 3;
_dinero = _this select 4;
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
    	


	if(_metros < _metros_cancelar_robo) then{
		
	
//contar tiempo
	_time = _time - 1;  
	hintSilent format["Tiempo para robar: %1 \n Distancia: %2 (max %3)", [((_time)/60)+.01,"HH:MM"] call BIS_fnc_timetostring,round (_metros),_metros_cancelar_robo];	
	sleep 1;
	_pagar_ladron = "si";

	

};
    		



	
		
};

if(_time < 1) then{

	//si a roabdo pagar al ladron

	if(_pagar_ladron == "si") then {

		//pagar al jugador
[_dinero]spawn{sleep 2;hint format["Robo Completado, has robado %1 €",_this select 0];sleep 3;hint ""};

life_cash = life_cash + _dinero;



//añadir a la wanted list [solo para altis]
//[[getPlayerUID _ladron,name _ladron,"211"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;


	};



//terminar script
	
if(true) exitWith{[]spawn { sleep 1;hint "";} };

};