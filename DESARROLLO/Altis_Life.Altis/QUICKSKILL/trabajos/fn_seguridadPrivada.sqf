////////////////FUNCIONES NIINJA DE QUICK NO INTENTES ENTENDERLO ///////////////////////////
QUICK_timerTrabajoSeguridad = {

_time = 60*60;
_metros_entregar = 5;
_pagar_jugador= "no";
_marcador = _this select 0;
_furgo = _this select 1;
_jugador = _this select 2;
_destino = _this select 3;



while {_time > 0} do {

	//distancia
	_metros =  _furgo distance getMarkerPos _destino;
	
	
    	
	/// si muere paramos el contador
		if !(alive _jugador) then {
			_time = 0;
		};

	//mientrar si esta cerca del edificio
	if(_metros > _metros_entregar) then{		
	
		//contar tiempo
		_time = _time - 1;  
		hintSilent format["Destino: %4 - %3m \n Tiempo para entregar el furgon: %1 \n Distancia: %2m ", [((_time)/60)+.01,"HH:MM"] call BIS_fnc_timetostring,round (_metros),_metros_entregar,_destino];	
		sleep 1;
		
	};

	if(_metros < _metros_entregar )then{

		_pagar_jugador= "si";
		_time = 0;
		hint "Has llegado a tu destino, baja  ya puedes cobrar tu recompensa en la furgo";
	};
    		
};//end while

if(_time < 1) then{
	//ha terminado el timer dar opcion a entergar

	  if (_pagar_jugador=="si" && alive _jugador ) then {
	    // agregar action de cobrar la pasta y borrar el furgon
	    _furgo addAction["Entregar furgoneta",QUICK_pagarTrabajoSeguridad,_furgo];	
	  };

	  //no has terminado el trabajo
	  hint "No has entregado la furgoneta";


};//en time < 1



};//end funcion timer

QUICK_pagarTrabajoSeguridad = {

_gen = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
_caller =[_this,1,Objnull,[Objnull]] call BIS_fnc_param;
 _id = _this select 2; 
 
_gen removeAction _id;

_furgo = _this select 3;

//pagar al jugador
life_cash = life_cash +500000;
//hint
hint "Has cobrado 500000$ por tu trabajo";
//borrar
deleteVehicle _furgo;


	
};


QUICK_generarTrabajoSeguridad = {
	

_coche = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;

_jugador = [_this,1,Objnull,[Objnull]] call BIS_fnc_param;

life_vehicles pushBack _coche;
[[_coche,"vehicle_info_owners",[[getPlayerUID _jugador,profileName]],true],"TON_fnc_setObjVar",false,false] spawn life_fnc_MP;




//encontrar atm cercana ma o menos

_destinoRandom = "dp" +  str (round random 26 );
_destino =_destinoRandom;

 				
_markerDestino = createMarkerLocal ["MarkerTrabajoseguridad", getMarkerPos _destino ];
_markerDestino setMarkerShapeLocal "ICON"; 
_markerDestino setMarkerTypeLocal "n_motor_inf";
_markerDestino setMarkerColor "ColorGreen";
_markerDestino setMarkerText "Entregar Camion aqui!!";

	 		
_scriptHandler = [_markerDestino,_coche,_jugador,_destino] spawn QUICK_timerTrabajoSeguridad;


};


//////////////////////////////////////////////////////////////
// EMPIEZA TODO AQUI LO DE ARRIBA SON FUNCIONES!!!!

//cursorTarget addAction["Tranporte de Furgoneta 35000$ - Ganancia: 150000$",QUICK_fnc_seguridadPrivada];
//////////////////////////////////////////////////////////

private["_coche"];
_precio = 350000;
_jugador = [_this,1,Objnull,[Objnull]] call BIS_fnc_param;
_gen = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;

if(isNull _jugador) exitWith {}; //if not the thief get bent

//puede pagar?¿
 if(life_cash - _precio < 0) exitWith { hint "No tienes suficiente dinero";[] spawn { sleep 5;hint "";} };

life_cash = life_cash-_precio;

//crear coche
[_gen,_jugador] spawn { 

_gen = _this select 0;
_jugador = _this select 1;

_coche = "C_Van_01_box_F" createVehicle position _gen;

[_coche,_jugador] spawn QUICK_generarTrabajoSeguridad;

hint "Cuidado si no llegas a tu destino no te pagarameos nada!!";
sleep 3;
hint "";



};

