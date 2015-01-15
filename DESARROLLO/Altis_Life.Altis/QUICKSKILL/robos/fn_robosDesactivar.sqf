/*
	File: fn_robosActivos.sqf
	Author: Quickskill
	Desc: Desactivar Robo Activo "-1 a numero de ladroens robandolo"
*/
private ["_maximoRobosActivo", "_nombreRobo ", "_roboActivo ", "_ladronesEnRobo"];
//params
_nombreRobo =  [_this, 0, "",[""]] call BIS_fnc_param;

///for de robos activos


//start for
{
//nombre robo del array global de robos activos

_nombreRoboCompare = _x select 0;

//buscar si no hay ningun robo con ese nombre en el array de robos activos
if (_nombreRobo == _nombreRoboCompare) then {
  // ya estan robando actualizar numero de ladrones  
   _ladronesEnRobo  = _x  select 1;
  _x  set [_forEachIndex,[_nombreRoboCompare,_ladronesEnRobo - 1]];
};


} forEach robosActivosGLOBAL;

publicVariable "robosActivosGLOBAL";

