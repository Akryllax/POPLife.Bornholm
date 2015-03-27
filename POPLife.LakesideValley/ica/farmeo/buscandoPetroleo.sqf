/*
Minijuego de petróleo, un botón transparente aparece en un lugar aleatorio, cuando se pone el ratón encima ocurre X.
by: Icaruk

["menu"] execVM "ica\farmeo\buscandoPetroleo.sqf";
*/
_param = _this select 0;

if (_param isEqualTo "menu") then {
	disableSerialization;
	createDialog "buscandoPetroleo";

	_ui = uiNamespace getVariable "buscandoPetroleo";
	_boton = (_ui displayCtrl 4059);

	_x = random 0.5;
	_y = random 0.5;

	_boton ctrlSetPosition [_x, _y, 0.07, 0.09];
	_boton ctrlCommit 0;
	titleText ["Busca petróleo con el ratón", "PLAIN DOWN", 0.6];
};

if (_param isEqualTo "click") then {
	if (!isNil {ocupado}) exitWith {};
	[] spawn {
		ocupado = true;
		sleep 5; 
		ocupado = nil;
	};
	sleep 1;
	closeDialog 0;
	
	_tiempo = 4;
	while {true} do {
		if (_tiempo <= 0) exitWith {
			titleText ["Has encontrado petróleo", "PLAIN DOWN", 0.6];
			ocupado = nil;
			[true,"oilp",2] call life_fnc_handleInv;
		};
		
		_str = format ["Buscando... (%1s) ", _tiempo];
		titleText [_str, "PLAIN DOWN", 0.6];
		_tiempo = _tiempo - 1;
		sleep 1;
	};	

};

/*
["0.350469 * safezoneW + safezoneX","0.247 * safezoneH + safezoneY","0.0330001 * safezoneW","0.055 * safezoneH"]
["0.628906 * safezoneW + safezoneX","0.247 * safezoneH + safezoneY","0.0330001 * safezoneW","0.055 * safezoneH"]
["0.350469 * safezoneW + safezoneX","0.698 * safezoneH + safezoneY","0.0330001 * safezoneW","0.055 * safezoneH"]
["0.62375 * safezoneW + safezoneX","0.698 * safezoneH + safezoneY","0.0330001 * safezoneW","0.055 * safezoneH"]
