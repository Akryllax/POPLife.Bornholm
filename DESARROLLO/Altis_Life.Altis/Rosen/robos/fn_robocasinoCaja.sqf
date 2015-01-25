/*
	Archivo: fn_robocasino
	Autor: Rosen
	Descripción: Robo del casino custom
*/

private ["tiempo","_distancia_robo","_exito"];
_tiempo = 20;
_distancia_robo = 50;
_exito = false;

if(playerSide == west) exitWith{hint "Eres policia, no puedes robar"};

_caja = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_ladron = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;
_robar = [_this,2] call BIS_fnc_param;

_minpolicias= (west countSide playableUnits);
//if(_minpolicias < 6) exitWith{[["",-1],"disableSerialization;",false,false] spawn life_fnc_MP; hint "No hay suficientes policias conectados (6)";};
//disableSerialization;

if (currentWeapon _ladron == "") exitWith { hint "Consigue un arma para robar.";};
if(!([false,"llave_casino",1] call life_fnc_handleInv)) exitWith {hint "Necesitas la llave de la caja fuerte para robar.";};
[[1,format["Robo en curso | Se esta produciendo un atraco en el casino."]],"life_fnc_broadcast",west,false] spawn life_fnc_MP; 

[[getPlayerUID _ladron,name _ladron,"5"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;


_caja removeAction _robar;


hint "Abriendo caja fuerte...";
player playMove "AinvPknlMstpSlayWrflDnon_medic";

_pos = position _caja; 
 _marcador = createMarker ["marcadorcasino", _pos]; 
"marcadorcasino" setMarkerColor "ColorRed";
"marcadorcasino" setMarkerText "|||ROBANDO CASINO|||";
"marcadorcasino" setMarkerType "mil_warning";	

while {_time > 0} do {	
	_rango =  _caja distance _ladron;
	if(_rango > _distancia_robo) then {	
		hintSilent format["Has abandonado la zona del robo. Estabas a %1m de la caja.",round (_rango)];
		_tiempo= 0;
		_exito= false;		sleep 1;

	};

	if !(alive _ladron) then {
		_tiempo = 0;
	};

	if(_rango < _distancia_robo) then {
		_tiempo = _tiempo - 1;  
		hintSilent format["Tiempo restante: %1 \n Distancia: %2m (max %3m)", [((_time)/60)+.01,"HH:MM"] call BIS_fnc_timetostring,round (_rango),_distancia_robo];	
		sleep 1;
		_exito = true;
	};		
};

if(_tiempo < 1) then { 
	if(_exito == true and alive _ladron) then {		
		[false,"llave_casino",1] call life_fnc_handleInv;
		[true,"maletin_casino",1] call life_fnc_handleInv;
		[]spawn{sleep 2;hint "Has robado el dinero de la caja fuerte. ¡Tiene que blanquearlo el banquero!.";sleep 3;hint ""};
	};	
	if(true) exitWith{[]spawn { sleep 1;hint "";} };
};

deleteMarker "marcadorcasino";

_pos = position _ladron; 
 _marcador = createMarker ["marcadorcasinof", _pos]; 
"marcadorcasinof" setMarkerColor "ColorRed";
"marcadorcasinof" setMarkerText "|||ROBO FINALIZADO|||ZONA DE CONFLICTO|||";
"marcadorcasinof" setMarkerType "mil_warning";
sleep 60;
deleteMarker "marcadorcasinof";
sleep 60*10;
_robar = _caja addAction["Robar caja fuerte","Rosen\robos\robocasinoCaja.sqf"];	
