/*
Recogedor de beneficios
["campo"] execVM "ica\subasta\recogeBeneficios.sqf";
*/

_que = _this select 0;
_soy = name player;

if (!isNil {ocupado}) exitWith {hint "Espera 4s"; };
[] spawn {
	ocupado = true;
	sleep 4;
	ocupado = nil;
};

["beneficiosEmpresas"] call ica_dameVar; if !(call ica_editando) then { waitUntil {!isNil {paq}}; }; paq = nil;
["subastas"] call ica_dameVar; if !(call ica_editando) then { waitUntil {!isNil {paq}}; }; paq = nil;

if (subastaActual == _que) exitWith {hint "Ahora mismo hay una subasta con este sector"; };

private "_din";
switch (_que) do {
	case "campo": {
		if (isNil {campo}) exitWith {hint "Este sector no te pertenece"};
		if ((_soy != (campo select 0)) OR ((campo select 0) == "")) exitWith {hint "Este sector no te pertenece."};
		
		_din = benCampo;
		benCampo = 0;
		publicVariableServer "benCampo";
	};
	case "purificadora": {
		if (isNil {purificadora}) exitWith {hint "Este sector no te pertenece"};
		if ((_soy != (purificadora select 0)) OR ((purificadora select 0) == "")) exitWith {hint "Este sector no te pertenece."};
		_din = benPurificadora;
		benPurificadora = 0; 
		publicVariableServer "benPurificadora";		
	};
	case "refineria": {
		if (isNil {refineria}) exitWith {hint "Este sector no te pertenece"};
		if ((_soy != (refineria select 0)) OR ((refineria select 0) == "")) exitWith {hint "Este sector no te pertenece."};
		_din = benRefineria;
		benRefineria = 0;
		publicVariableServer "benRefineria";
	};
	case "farmacia": {
		if (isNil {farmacia}) exitWith {hint "Este sector no te pertenece"};
		if ((_soy != (farmacia select 0)) OR ((farmacia select 0) == "")) exitWith {hint "Este sector no te pertenece."};
		_din = benFarmacia;
		benFarmacia = 0; 
		publicVariableServer "benFarmacia";		
	};
	case "mina": {
		if (isNil {mina}) exitWith {hint "Este sector no te pertenece"};
		if ((_soy != (mina select 0)) OR ((mina select 0) == "")) exitWith {hint "Este sector no te pertenece."};
		_din = round (benMina / 3);
		benMina = 0; 
		publicVariableServer "benMina";		
	};
};

if (!isNil {_din}) then {
	if (_din == 0) exitWith {hint "No hay beneficios, de momento."; };
	life_cash = life_cash + round (_din * 0.15);
	hint format ["Este sector te ha otorgado %1€ en beneficios.", round (_din * 0.15)];	
};