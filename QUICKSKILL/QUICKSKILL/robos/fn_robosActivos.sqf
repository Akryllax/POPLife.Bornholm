/*
	File: fn_robosActivos.sqf
	Author: Quickskill
	Desc: Ativar robo
*/
private ["_maximoRobosActivo", "_nombreRobo ", "_roboActivo ", "_ladronesEnRobo", "_iFindID"];

_maximoRobosActivos = 2;
_nombreRobo =  [_this, 0, "",[""]] call BIS_fnc_param;
_roboActivo = "no";

///for de robos activos
_iFindID = 0;
{
//buscar si no hay ningun robo con ese nombre en el array de robos activos
if (_nombreRobo == _x) then {
  // ya estan robando actualizar numero de ladrones
  _ladronesEnRobo =_x _select 1;
  robosActivosGLOBAL  set [_iFindID,_ladronesEnRobo + 1]
}

//siguiente id 
_iFindID = _iFindID +1;

} forEach robosActivosGLOBAL;

//sino esta en la lista de robosActivos agregamso el robo con 1 ladron inicial
if(_roboActivo == "no") then {

robosActivosGLOBAL pushBack [_nombreRobo,1];

};

publicVariable robosActivosGLOBAL;

	
//terminar script si hay mas de 2 robos activos
if(count robosActivosGLOBAL > _maximoRobosActivos ) exitWith{[]spawn { sleep 3;hint "Hay demasiados robos activos, espera a que terminen para poder robar";sleep 3;} };

