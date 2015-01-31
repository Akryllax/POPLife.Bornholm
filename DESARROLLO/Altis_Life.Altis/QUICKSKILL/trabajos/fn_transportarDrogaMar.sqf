////////////////FUNCIONES NIINJA DE QUICK NO INTENTES ENTENDERLO ///////////////////////////
QUICK_timerTrabajoTransportarDrogaMar = {

_time = 60*60;
_metros_entregar = 50;
_pagar_jugador= "no";
_marcador = _this select 0;
_furgo = _this select 1;
_jugador = _this select 2;
_destino = _this select 3;


_metrosTotal = _furgo distance getMarkerPos _destino;

while {_time > 0} do {

	//distancia
	_posDestino = getMarkerPos _destino;
	_metros =  _furgo distance _posDestino;

	
	
    	
	/// si muere paramos el contador
		if !(alive _jugador) then {
			_time = 0;
		};

	//avisar a la poli despues de 2 minutos
	
	if(_time == 60*58) then{
		//havisar al jugador;
		hint "La policía te ha detectado!! Ten cuidado!!";
		//enviar mensaje a la poli
	[[1,format["El radar maritimo a detectado una lancha a gran velocidad con drogas a bordo! Se dirigen a %1.", _destino]],"life_fnc_broadcast",west,false] spawn life_fnc_MP;
	//crear marcador
	_pos = position _furgo;
	_markerID = format["marker_%1",floor(random 1000)];
_marker = createMarker [ _markerID, _pos];
_marker setMarkerColor "ColorRed";
_marker setMarkerText "!Lancha Detectada!";
_marker setMarkerType "mil_warning";
	sleep 25;
	deleteMarker _marker;
    };

	//mientrar si esta cerca del edificio
	if(_metros > _metros_entregar) then{		
	
		//contar tiempo
		_time = _time - 1;  
		hintSilent format["Destino: %4 \n Tiempo : %1 \n Distancia: %2m ", [((_time)/60)+.01,"HH:MM"] call BIS_fnc_timetostring,round (_metros),_metrosTotal,_destino];	
		sleep 1;
		
	};

	if(_metros < _metros_entregar )then{

		_pagar_jugador= "si";
		_time = 0;
		
	};
    		
};//end while

if(_time < 1) then{
	//ha terminado el timer dar opcion a entergar

	  if (_pagar_jugador=="si" && alive _jugador ) then {
	    // agregar action de cobrar la pasta y borrar el furgon
	     hint "Ya puedes entregar la lancha";
	    _furgo addAction["Entregar lancha",QUICK_pagarTrabajoTransportarDrogaMar,_furgo];	
	  };

	   if (_pagar_jugador=="no" && alive _jugador ) then {
	    // agregar action de cobrar la pasta y borrar el furgon
	    //no has terminado el trabajo
	     hint "No has entregado la lancha";
	  };

	  deleteMarker _marcador;

	 


};//en time < 1



};//end funcion timer

QUICK_pagarTrabajoTransportarDrogaMar = {

_gen = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
_caller =[_this,1,Objnull,[Objnull]] call BIS_fnc_param;
 _id = _this select 2; 
 
_gen removeAction _id;

_furgo = _this select 3;

//pagar al jugador
life_cash = life_cash +500000+350000;
//hint
hint "Has cobrado 850000$ por tu trabajo";
//borrar
deleteVehicle _furgo;


	
};


QUICK_generarTrabajoTransportarDrogaMar = {
	

_coche = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;

_jugador = [_this,1,Objnull,[Objnull]] call BIS_fnc_param;

life_vehicles pushBack _coche;
[[_coche,"vehicle_info_owners",[[getPlayerUID _jugador,profileName]],true],"TON_fnc_setObjVar",false,false] spawn life_fnc_MP;




//encontrar atm cercana ma o menos

_destinoRandom = "desembarcoDrogas_" +  str (round random 5 );
_destino =_destinoRandom;

//este es un fix penoso, k os den!
if(_destino=="desembarcoDrogas_0")then{

	_destino="desembarcoDrogas_1";
};

if(_destino=="desembarcoDrogas_5")then{

	_destino="desembarcoDrogas_4";
};



_markerID = format["marker_%1",floor(random 1000)];
_marker = createMarkerLocal [ _markerID, _pos];
_marker setMarkerColorLocal "ColorGreen";
_marker setMarkerTextLocal "!Zona Desembarco!";
_marker setMarkerTypeLocal "mil_warning";


	 		
_scriptHandler = [_markerDestino,_coche,_jugador,_destino] spawn QUICK_timerTrabajoTransportarDrogaMar;


};


//////////////////////////////////////////////////////////////
// EMPIEZA TODO AQUI LO DE ARRIBA SON FUNCIONES!!!!

//this addAction["Transportar Droga para el Narco 500000$ - Ganancia: 350000$",QUICK_fnc_TransportarDrogaMar];
//////////////////////////////////////////////////////////

private["_coche"];
_precio = 500000;
_jugador = [_this,1,Objnull,[Objnull]] call BIS_fnc_param;
_gen = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
 _id = _this select 2; 


if(isNull _jugador) exitWith {}; //if not the thief get bent

//puede pagar?¿
 if(life_cash - _precio < 0) exitWith { hint "No tienes suficiente dinero";[] spawn { sleep 5;hint "";} };

life_cash = life_cash-_precio;

 _gen removeAction _id;

//crear coche
[_gen,_jugador] spawn { 

_gen = _this select 0;
_jugador = _this select 1;

_coche = "C_Boat_Civil_01_rescue_F" createVehicle position _gen;

//poner saquitos de decoracion

[_coche,_jugador] spawn QUICK_generarTrabajoTransportarDrogaMar;

hint "Cuidado si no llegas a tu destino no te pagarameos nada!!";
sleep 3;
hint "";

sleep 60 *5;
_gen addAction["Transportar Droga para el Narco 500000$ - Ganancia: 350000$",QUICK_fnc_TransportarDrogaMar];

};