/*
	File: fn_robosActivos.sqf
	Author: Quickskill
	Desc: Desactivar Robo Activo "-1 a numero de ladroens robandolo"
*/
private ["_maximoRobosActivo", "_nombreRobo ", "_roboActivo ", "_ladronesEnRobo", "_iFindID"];
//params
_nombreRobo =  [_this, 0, "",[""]] call BIS_fnc_param;

///for de robos activos
_iFindID = 0;
{
//nombre robo del array global de robos activos
_nombreRoboCompare = _x select 0;

//buscar si no hay ningun robo con ese nombre en el array de robos activos
if (_nombreRobo == _nombreRoboCompare) then {
  // ya estan robando actualizar numero de ladrones
  
   _ladronesEnRobo  = _x  select 1;
  _x  set [_iFindID,_ladronesEnRobo - 1];
};

//siguiente id 
_iFindID = _iFindID +1;

} forEach robosActivosGLOBAL;

publicVariable "robosActivosGLOBAL";



