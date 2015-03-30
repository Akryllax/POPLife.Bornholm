
/*
Sacar dinero público para que lo use la policía por Icaruk
	["consultar"] execVM "ica\policia\sacoDineroPublico.sqf";
	[20000] execVM "ica\policia\sacoDineroPublico.sqf";
*/

_param = _this select 0;



if (_param == "consultar") exitWith {
	if (side player != WEST) exitWith {hint "No eres policía"};
	// añadir comprobacion de rango
	
	["fondosPublicos"] call ica_dameVar; if !(call ica_editando) then { waitUntil {!isNil {paq}}; }; paq = nil;
	
	createDialog "sacoDineroPublico";
	_ui = uiNameSpace getVariable "sacoDineroPublico";
	_txt = _ui displayCtrl 5053;
	_txt ctrlSetText format ["Fondos públicos: %1€", fondosPublicos];
};

if (_param != "consultar") exitWith {
	["fondosPublicos"] call ica_dameVar; if !(call ica_editando) then { waitUntil {!isNil {paq}}; }; paq = nil; 
	_entrada = parseNumber (_this select 0);
	if ((_entrada <= 0) OR (isNil {_entrada})) exitWith {hint "Si no quieres sacar nada, ¿para qué abres este menú?" };
	if (_entrada >= 999999) exitWith {hint "No puedes sacar más de 999.999€ a la vez" };
	if (_entrada > fondosPublicos) exitWith {"No hay tanto dinero" };
	
	fondosPublicos = fondosPublicos - _entrada;
	publicVariableServer "fondosPublicos";
	life_cash = life_cash + _entrada;
	
	hint format ["Has sacado %1€ de los fondos públicos", _entrada];
	
	[[0, format ["La policía ha sacado %1€ de los fondos públicos", _entrada]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
	closeDialog 0;
};