/*
Animación de llenar botella con la rueda del ratón
by: Icaruk

["menu"] execVM "ica\farmeo\llenaBotella.sqf";
*/


_param = _this select 0;

if (_param isEqualTo "menu") then {
	createDialog "llenandoBotella";
	titleText ["Usa la rueda del ratón para llenar la botella", "PLAIN DOWN", 0.6];
};

if (_param isEqualTo "llena") then {
	disableSerialization;
	_ui = uiNameSpace getVariable "llenandoBotella";
	_barrita = (_ui displayCtrl 4058);
	
	_n = progressPosition _barrita;
	_barrita progressSetPosition (_n + 0.020);
	
	if (_n == 1) exitWith {
		disableUserInput true;
		sleep 1.5;
		closeDialog 0;
		
		[true,"aguasucia",1] call life_fnc_handleInv;
		
		if ((floor (random 100)) < 5) then {
			["Supervivencia", 1] call ica_dameExp;
		};
		
		_str = format ["Has llenado 2 botellas de agua"];
		titleText [_str, "PLAIN DOWN", 0.2];
		
		disableUserInput false;
	};
};
