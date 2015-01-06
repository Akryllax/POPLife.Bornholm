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

	//hay un robo!! avisar a la poli
	//[{hint "Estan robando la armeria de Kavala!!"}], "BIS_fnc_spawn", west, false] call BIS_fnc_MP;

	

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
    		



	
		
};

if(_time < 1) then{

	//si a roabdo pagar al ladron

	if(_pagar_ladron == "si" and alive _ladron) then {


//dar pasta
life_cash = life_cash + _dinero;


//dar drojas
[true,"heroinp",round(1 + random(6))] call life_fnc_handleInv;
[true,"marijuana",round(1 + random(6))] call life_fnc_handleInv;
[true,"cocainep",round(1 +random(6))] call life_fnc_handleInv;

//pagar al jugador
[]spawn{sleep 2;hint format["Has robado la recaudación y drogas del bar",_this select 0];sleep 3;hint ""};





	};



//terminar script
	
if(true) exitWith{[]spawn { sleep 1;hint "";} };

};