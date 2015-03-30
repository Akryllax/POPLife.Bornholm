
/*
Agricultura por Icaruk

[] execVM "ica\farmeo\agricultura.sqf";
call ica_agricultura;
*/

ica_agricultura = {
	
	// antispam
	if (!isNil {spamAgricultura}) exitWith {
		spamAgricultura = spamAgricultura + 2;
		closeDialog 0;
		hint format ["Tienes que esperar %1 segundos", spamAgricultura];
	};
	[] spawn {
		if (isNil {spamAgricultura}) then {
			spamAgricultura = 2;

			while {true} do {
				if (spamAgricultura <= 0) exitWith {spamAgricultura = nil };
				spamAgricultura = spamAgricultura - 1;
				sleep 1;
			};
		};
	};	


	// seleccion de modo
	private "_param";
	if (stance player == "CROUCH") then { _param = "recolecto"};
	if (stance player == "STAND") then { _param = "planto" };
	
	
	_plantas = [
		"A3L_Wheat",
		"A3L_Sunflower",
		"A3L_Corn",
		"A3L_Beans", 
		"Ficus_Bush_1", // oliva
		"A3L_Cotton", 
		"A3L_Cannabis", // cannabis
		"cl_coca_plant", // coca
		"Oleander2" // opio
	];

	if (_param == "planto") exitWith {
		private ["_class", "_cercania"]; 
		if (isNil {estoyPlantando}) exitWith {hint "Usa una semilla y después intenta plantar" };
		_semilla = estoyPlantando;
		
		// seleccion classname planta
		switch (_semilla) do {
			case "trigo":	{ _class = ["A3L_Wheat", 10, "A3L_Seed_wheat"]};
			case "girasol":	{ _class = ["A3L_Sunflower", 10, "A3L_Seed_sunflower"]};
			case "maiz":	{ _class = ["A3L_Corn", 10, "A3L_Seed_corn"]};
			case "judia":	{ _class = ["A3L_Beans", 10, "A3L_Seed_Beans"]};
			case "oliva":	{ _class = ["Ficus_Bush_1", 10, "A3L_Seed_wheat"]};
			case "algodon":	{ _class = ["A3L_Cotton", 10, "A3L_Seed_cotton"]};
			case "cannabis":	{ _class = ["A3L_Cannabis", 10, "A3L_Seed_Cannabis"]};
			case "coca":	{ _class = ["cl_coca_plant", 10, "A3L_Seed_cocaine"]};
			case "opio":	{ _class = ["Oleander2", 10, "A3L_Seed_heroinu"]};
		};	
		
		// comprobacion tipo de tierra
		
		
		// comprobacion item
		if !([false, class select 2, 1] call life_fnc_handleInv) exitWith { hint "No tienes semillas"; };
		
		// comprobacion cercania
		{
			_cercania = nearestObjects [player, [_x], 3];
			if (count _cercania == 0) then {_cercania = false} else {_cercania = true};
		} foreach _plantas;
		if (_cercania) exitWith { hint "Hay una planta demasiado cerca"; };

		// se lo mando al servidor
		[["plantaServer", player, _class], "ica_agricultura", false, false, false] spawn life_fnc_MP;
	};

	if (_param == "plantoServer") exitWith {
		_pos = _this select 1;
		_class = _this select 2;
		
		_planta = createVehicle [_class select 0, [(getpos player select 0), (getpos player select 1), (getpos player select 2) - 0.1], [], 0, "CAN_COLLIDE"];
		_planta setVariable ["crecimiento", 0, true];
		while {true} do {
			if ((_planta getVariable "crecimiento") >= 100) exitWith {
				_planta setVariable ["crecimiento", 100, true];
			};
			_planta setVariable ["crecimiento", (_planta getVariable "crecimiento") + 20, true];
			sleep ((_class select 1) / 5);
		};
	};
	
	if (_param == "recolecto") exitWith {
		_cercania = nearestObjects [player, [_plantas], 3];
		if (isNull (_cercania select 0)) exitWith {};
		if ((_cercania getVariable "crecimiento") < 100) exitWith {
			hint format ["Esta planta está al %1% de su crecimiento, la paciencia es la clave", _cercania getVariable "crecimiento"];
		};
		
		_que = typeOf (_cercania select 0);
		deleteVehicle (_cercania select 0);
		
		switch (_que) do {
			case "A3L_Wheat": 		{ _pillo = "" }; 
			case "A3L_Sunflower":		{ _pillo = "" }; 
			case "A3L_Corn": 		{ _pillo = "" }; 
			case "A3L_Beans":		{ _pillo = "" }; 
			case "Ficus_Bush_1":		{ _pillo = "" }; 
			case "A3L_Cotton": 		{ _pillo = "" }; 
			case "A3L_Cannabis":		{ _pillo = "" }; 
			case "cl_coca_plant": 		{ _pillo = "" }; 
			case "Oleander2": 		{ _pillo = "" }; 
		};
	};
};


