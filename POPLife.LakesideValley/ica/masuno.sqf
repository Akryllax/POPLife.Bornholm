
/*
Script de la misión Desolation creado por Icaruk

Función: Muestra un efecto de texto 3D con los parametros recibidos
["+1 food"] execVM "ica\masuno.sqf";
param 0 = texto
*/

waitUntil {player == player};
waitUntil {!isNull player};

_texto = _this select 0;
_tipo = _this select 1;

disableSerialization;

("icapa5" call BIS_fnc_rscLayer) cutText ["","PLAIN"];
("icapa5" call BIS_fnc_rscLayer) cutRsc ["masuno","PLAIN"];

_ui = uiNameSpace getVariable "masuno";
_masuno = _ui displayCtrl 4065;


_masuno ctrlSetText _texto;


if (isNil {_tipo}) then {
	_masuno ctrlSetTextColor [1,1,1,1];
	sleep 0.2;
	_masuno ctrlSetTextColor [0.2,1,0.2,1];
	sleep 0.2;
	_masuno ctrlSetTextColor [1,1,1,1];
	sleep 0.2;
	_masuno ctrlSetTextColor [0.2,1,0.2,1];
	sleep 0.2;
	_masuno ctrlSetTextColor [1,1,1,1];
	sleep 0.2;
	_masuno ctrlSetTextColor [0.2,1,0.2,1];
	sleep 0.2;
	_masuno ctrlSetTextColor [1,1,1,1];
};

sleep 0.8;

_a = 100;
while {true} do {
	if (_a <= 0) exitWith {};
	
	_masuno ctrlSetPosition [
		((ctrlPosition _masuno) select 0) + 0.005,
		((ctrlPosition _masuno) select 1) + 0.0015,
		((ctrlPosition _masuno) select 2),
		((ctrlPosition _masuno) select 3)
	];
	_masuno ctrlCommit 0;
	
	sleep 0.001;
	
	_a = _a - 1;
};


// ("icapa8" call BIS_fnc_rscLayer) cutText ["","PLAIN"]; // para cancelar
