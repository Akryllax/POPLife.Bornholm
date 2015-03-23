//gps espia [coded by quicksill para plataoplomo.es]
private "_espia";
private "_espiado";
private "_time";
private "_marcador";



_espia = _this select 0;
_espiado = _this select 1;
_time = _this select 2;
_marcador = _this select 3;

while {_time > 0} do {


	

		
	
//contar tiempo
	_time = _time - 1;  
	//hintSilent format["Gps activado: %1", [((_time)/60)+.01,"HH:MM"] call BIS_fnc_timetostring];	
	sleep 1;
	

//actualizar posicion marcador
_Pos = position _espiado; 
_marcador setMarkerPosLocal _Pos;

};
    		



	
	

if(_time < 1) then{

	

hint format["El GPS se ha quedado sin baterias"];
sleep 3;
hint "";

    


	};



//terminar script
	
if(true) exitWith{[]spawn { sleep 1;hint ""} };

