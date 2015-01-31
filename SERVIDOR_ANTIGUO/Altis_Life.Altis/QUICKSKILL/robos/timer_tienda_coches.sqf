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
   
 /// si muere no le pagamos

if !(alive _ladron) then {

_time = 0;
_pagar_ladron = "no";

}; 	


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

[]spawn{sleep 2;hint format["Has robado 1 coche",_this select 0];sleep 3;hint "";};


//crear coche del jugadro que peude abrir y cerrar
_pagar_random = random 6;
_pagar_random = round _pagar_random;
if(_pagar_random == 0) then {
//turismo rapido
_coche = "C_Hatchback_01_sport_F" createVehicle position _vendedor;
//EL COCHE TIENE CIERRE Y ADEMAS ES PROPIEDAD DEL LADRON!!! POR FIN, ESTE FIX LO SOÑE XD
life_vehicles pushBack _coche;
[[_coche,"vehicle_info_owners",[[getPlayerUID _ladron,profileName]],true],"TON_fnc_setObjVar",false,false] spawn life_fnc_MP;

};

if(_pagar_random == 1) then {
//sport tunning
_coche = "C_Offroad_01_F" createVehicle position _vendedor;
//EL COCHE TIENE CIERRE Y ADEMAS ES PROPIEDAD DEL LADRON!!! POR FIN, ESTE FIX LO SOÑE XD
life_vehicles pushBack _coche;
[[_coche,"vehicle_info_owners",[[getPlayerUID _ladron,profileName]],true],"TON_fnc_setObjVar",false,false] spawn life_fnc_MP;


};
if(_pagar_random == 2) then {
//pickup rebelde
_coche = "B_G_Offroad_01_F" createVehicle position _vendedor;
//EL COCHE TIENE CIERRE Y ADEMAS ES PROPIEDAD DEL LADRON!!! POR FIN, ESTE FIX LO SOÑE XD
life_vehicles pushBack _coche;
[[_coche,"vehicle_info_owners",[[getPlayerUID _ladron,profileName]],true],"TON_fnc_setObjVar",false,false] spawn life_fnc_MP;

};
if(_pagar_random == 3) then {
//artillada
_coche = "B_G_Offroad_01_armed_F" createVehicle position _vendedor;
//EL COCHE TIENE CIERRE Y ADEMAS ES PROPIEDAD DEL LADRON!!! POR FIN, ESTE FIX LO SOÑE XD
life_vehicles pushBack _coche;
[[_coche,"vehicle_info_owners",[[getPlayerUID _ladron,profileName]],true],"TON_fnc_setObjVar",false,false] spawn life_fnc_MP;

};

if(_pagar_random == 4) then {
//camion
_coche = "C_Van_01_box_F" createVehicle position _vendedor;
//EL COCHE TIENE CIERRE Y ADEMAS ES PROPIEDAD DEL LADRON!!! POR FIN, ESTE FIX LO SOÑE XD
life_vehicles pushBack _coche;
[[_coche,"vehicle_info_owners",[[getPlayerUID _ladron,profileName]],true],"TON_fnc_setObjVar",false,false] spawn life_fnc_MP;

};
if(_pagar_random == 5) then {
//quad

_coche = "B_Quadbike_01_F" createVehicle position _vendedor;

//EL COCHE TIENE CIERRE Y ADEMAS ES PROPIEDAD DEL LADRON!!! POR FIN, ESTE FIX LO SOÑE XD
life_vehicles pushBack _coche;
[[_coche,"vehicle_info_owners",[[getPlayerUID _ladron,profileName]],true],"TON_fnc_setObjVar",false,false] spawn life_fnc_MP;


};





	};



//terminar script
	
if(true) exitWith{[]spawn { sleep 1;hint "";} };

};