/*
	File: fn_robosActivos.sqf
	Author: Quickskill
	Desc: Ativar robo "+1 si ya estan robando sino incluir robo en array global de robos"
*/
private ["_nombreRobo ", "_roboActivo ", "_ladronesEnRobo"];

_nombreRobo =  [_this, 0, "",[""]] call BIS_fnc_param;
_roboActivo = "no";

///for de robos activos

{
//nombre robo del array global de robos activos
_nombreRoboCompare = _x select 0;

//buscar si no hay ningun robo con ese nombre en el array de robos activos
if (_nombreRobo == _nombreRoboCompare) then {
  // ya estan robando actualizar numero de ladrones
    _roboActivo = "si";
   _ladronesEnRobo  = _x  select 1;
   _x  set [_nombreRobo,_ladronesEnRobo + 1];
};



} forEach robosActivosGLOBAL;

//sino esta en la lista de robosActivos agregamso el robo con 1 ladron inicial
if(_roboActivo == "no") then {

robosActivosGLOBAL pushBack [_nombreRobo,1];

};

publicVariable "robosActivosGLOBAL";

	
///for de robos activos
_robosActivosCount = 0;
_iFindID = 0;
{

	 // mirar cuantos ladrones hay en cada robo
   _ladronesEnRobo = robosActivosGLOBAL select _iFindID;
   _ladronesEnRobo  = _ladronesEnRobo  select 1;

//buscar si no hay ningun robo con ese nombre en el array de robos activos
if (_ladronesEnRobo > 0) then {
 
  _robosActivosCount = _robosActivosCount +1;
};

//siguiente id 
_iFindID = _iFindID +1;

} forEach robosActivosGLOBAL;

//devuelve el numero de robos activos
robosActivosCount = _robosActivosCount;
publicVariable "robosActivosCount";
