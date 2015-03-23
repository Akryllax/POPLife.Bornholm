waitUntil {!(isNull (findDisplay 46))};
disableSerialization;
/*
	File: fn_statusBar.sqf
	Author: Some French Guy named Osef I presume, given the variable on the status bar
	Edited by: [midgetgrimm]
	Description: Puts a small bar in the bottom right of screen to display in-game information
*/
_rscLayer = "osefStatusBar" call BIS_fnc_rscLayer;
_rscLayer cutRsc["osefStatusBar","PLAIN"];
systemChat format["Cargando barra de estado...", _rscLayer];

[] spawn {
	sleep 5;
	_counter = 180;
	_timeSinceLastUpdate = 0;
	while {true} do
	{
		sleep 1;
		_counter = _counter - 1;
		((uiNamespace getVariable "osefStatusBar")displayCtrl 1000)ctrlSetText format["FPS: %1 | Policias: %2 | Civiles: %3 | Medicos: %4 | Mercenarios: %7 | Banco: %5 | Posicion: %6", round diag_fps, west countSide playableUnits, civilian countSide playableUnits, independent countSide playableUnits,[life_atmcash] call life_fnc_numberText,mapGridPosition player, opfor countSide playableUnits, _counter];
	};
};