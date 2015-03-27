
/*
Script de pesca por Icaruk
Si quieres usarlo, pide permiso en adri-rk@hotmail.com

	["ini"] execVM "ica\farmeo\pesca.sqf";
	["vende"] execVM "ica\farmeo\pesca.sqf";
	
	//AKR
	↑
	caca! Define las funciones
*/

_param = _this select 0;
_cuerdas = (ropes (vehicle player));
_pez = "Land_HumanSkull_F";
_listaBarcos = ["CL3_Basic_Fishing_blue", "CL3_Basic_Fishing_green", "CL3_Basic_Fishing_grey", "CL3_Basic_Fishing_red", "CL3_Basic_Fishing_yellow"];

if (_param isEqualTo "ini") exitWith {
	if !((typeOf (vehicle player)) in _listaBarcos) exitWith {hint "No tienes un barco pesquero"; };

	createDialog "pesca";
	_rnd1 = round ((random 40) - 20);
	_rnd2 = round ((random 40) - 20);
	
	if (count (ropes (vehicle player)) != 0) exitWith {
		ropeDestroy (_cuerdas select 0);
		hint "El hilo tenía un nudo, pero lo has soltado y el barco está listo para usar otro.";
	};

	titleText ["Usa la rueda del ratón para tirar del hilo", "PLAIN DOWN", 0.6];

	pez = _pez createVehicleLocal [(getPos player select 0) + 20, (getPos player select 1) + _rnd2, (getPos player select 2)];
	[pez, (60 * 30)] call ica_borrame;
	
	ropeCreate [vehicle player, [-0.95,-2.7,6.8], pez, [0,0,0], 20];
	
	giros = 0;
	while {!isNil {abierto}} do {
		_antiguo = giros;
		if (_antiguo == giros) then {giros = 0};
		pez setVelocity [round (random 1), round (random 1), 2];
		sleep 1;
	};
};

if (_param isEqualTo "tira") exitWith {
	giros = giros + 1;
	
	if (count _cuerdas != 0) then {
		ropeUnwind [(ropes (vehicle player) select 0), 2, -1.2, true]; // obj, vel, hasta, relativo (b)
		hint format ["Metros de hilo: %1. \nTensión del hilo: %2.", round (ropeLength (ropes (vehicle player) select 0)), giros];
	};
	
	if (((ropeLength (_cuerdas select 0)) <= 6) AND (giros >= 5)) exitWith { // demasiado rápido
		hint "Se ha roto el hilo";
		closeDialog 0;
		ropeDestroy (_cuerdas select 0);
		deleteVehicle pez;
	};
	
	if ((ropeLength (_cuerdas select 0)) <= 0.5)  exitWith {
		closeDialog 0;
		ropeDestroy (_cuerdas select 0);
		
		_miNivel = [expMarinero] call ica_expToLevel;
		
		_doble = false;
		if (_miNivel >= 1) then { if ((floor (random 100)) <= 10) then {_doble = true;	}; };
		if (_miNivel >= 3) then { if ((floor (random 100)) <= 20) then {_doble = true;	}; };
		if (_miNivel >= 5) then { if ((floor (random 100)) <= 30) then {_doble = true;	}; };

		if (_doble) then {
			_pezdoble = _pez createVehicleLocal (getmarkerPos "");
			_pezDoble attachTo [pez, [0,0,0.5]];
			[_pezDoble, (60 * 30)] call ica_borrame;			
			hint "¡Has hecho una doble captura!";
			
			if (((getDir vehicle player) >= 315) AND ((getDir vehicle player) < 45)) then { pez setVelocity [1, 0, 0]; };
			if (((getDir vehicle player) >= 45) AND ((getDir vehicle player) < 135)) then { pez setVelocity [0, -1, 0]; };
			if (((getDir vehicle player) >= 135) AND ((getDir vehicle player) < 225)) then { pez setVelocity [-1, 0, 0]; };
			if (((getDir vehicle player) >= 225) AND ((getDir vehicle player) < 315)) then { pez setVelocity [0, 1, 0]; };
		} else {
			hint "¡Bien! El pescado debería de estar en la cubierta";
			
			if (((getDir vehicle player) >= 315) AND ((getDir vehicle player) < 45)) then { pez setVelocity [1, 0, 0]; };
			if (((getDir vehicle player) >= 45) AND ((getDir vehicle player) < 135)) then { pez setVelocity [0, -1, 0]; };
			if (((getDir vehicle player) >= 135) AND ((getDir vehicle player) < 225)) then { pez setVelocity [-1, 0, 0]; };
			if (((getDir vehicle player) >= 225) AND ((getDir vehicle player) < 315)) then { pez setVelocity [0, 1, 0]; };
		};
		
		_tes = false;
		if (_miNivel >= 2) then {if ((floor (random 100)) <= 1) then {_tes = true; }; };
		if (_miNivel >= 4) then {if ((floor (random 100)) <= 3) then {_tes = true; }; };
		if (_miNivel >= 6) then {if ((floor (random 100)) <= 7) then {_tes = true; }; };	
		
		if (_tes) then {
			[true,"goldbar", 1] call life_fnc_handleInv;
			hint "¡Has encontrado un tesoro!";
		};
	};
};

if (_param isEqualTo "vende") exitWith {
	if (!isNil {ocupado}) exitWith {hint "Espera mientras cuento los peces..."};
	ocupado = true;

	_barco = nearestObjects [getMarkerPos "ZDPescado", _listaBarcos, 8];
	if ((count _barco) == 0) exitWith {hint "El barco está demasiado lejos."; ocupado = nil; };
	_pescado = nearestObjects [getPos player, [_pez], 10];
	if ((count _pescado) == 0) exitWith {hint "Por lo que veo has tenido un  mal día de pesca, si no tienes nada, no te puedo comprar nada."; ocupado = nil; };
	
	_can = count _pescado;
	
	_idx = 0;
	while {_can > _idx} do {
		deleteVehicle (_pescado select _idx);
		hint format ["¡Arr! Voy a contar el pescado que llevas ahí...\nDe momento veo %1...", _idx + 1];
		
		_idx = _idx + 1;
		sleep 0.5;
	};
	
	sleep 2;
	
	if ((player distance (getMarkerPos "ZDPescado")) > 20) exitWith {hint "Te has ido justo cuando te iba a dar el dinero, me quedo el pescado"; ocupado = nil; };
	
	["suministrosExt"] call ica_dameVar; if !(call ica_editando) then { waitUntil {!isNil {paq}}; }; paq = nil;
	["beneficiosEmpresas"] call ica_dameVar; if !(call ica_editando) then { waitUntil {!isNil {paq}}; }; paq = nil;
	
	_din = round ((["pescado"] call ica_precioSuministros) * _can);
	
	["campo", _din] call ica_subeBajaBeneficios;
	["central", "pescado", _can] call ica_subeBajaSuministros;
	
	hint format ["Gracias por los %1 pescados.\nTe corresponden %2€", _can, _din];
	life_cash = life_cash + _din;
	ocupado = nil;
};

