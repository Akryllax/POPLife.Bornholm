/*
Habilidades pasivas

by: Icaruk
*/

/*
[] spawn {
	while {true} do {
		hint format ["%1", (getFatigue player)];
		sleep 1;
	};
};
*/

[] spawn { // Fortaleza y marinero
	while {true} do {
		_fortaleza = [expFortaleza] call ica_expToLevel;
		if ((([expMarinero] call ica_expToLevel) >= 8) AND (underwater player)) then {
			player setFatigue 0;
		};
		_n = 0;
		
		if (_fortaleza > 0) then {	
			if (_fortaleza >= 1) then {	_n = 0.01;		};
			if (_fortaleza >= 2) then {	_n = 0.015;	};
			if (_fortaleza >= 3) then {	_n = 0.02;		};
			if (_fortaleza >= 4) then {	_n = 0.025;	};
			if (_fortaleza >= 5) then {	_n = 0.03;		};
			if (_fortaleza >= 6) then {	_n = 0.035;	};
			if (_fortaleza >= 7) then {	_n = 0.04;		};
			if (_fortaleza >= 8) then {	_n = 0.045;	};
			if (_fortaleza >= 9) then {	_n = 0.06;		};
			
			player setFatigue ((getFatigue player) - _n);	
		};
		sleep 30;
	};
};

[] spawn { // Primeros auxilios (regeneracion)
	while {true} do {
		_PA = [expPA] call ica_expToLevel;
		_regen = 0;
		
		if (_PA > 0) then {
			if (_PA >= 1) then { _regen = 0.01;	};
			if (_PA >= 3) then { _regen = 0.02;	};
			if (_PA >= 5) then { _regen = 0.04;	};
			if (_PA >= 7) then { _regen = 0.08;	};
			if (_PA >= 9) then { _regen = 0.12;	};

			player setDamage ((damage player) - _regen);
		};
		sleep (60 * 10);	
	};
};

[] spawn { // economía
	private ["_economia", "_base", "_n"];
	while {true} do {
		_economia = [expEconomia] call ica_expToLevel;
		if (_economia > 0) then {
			_base = 700;
			if (_economia >= 1) then { _n = 0.1 };
			if (_economia >= 2) then { _n = 0.15 };
			if (_economia >= 3) then { _n = 0.20 };
			if (_economia >= 4) then { _n = 0.25 };
			if (_economia >= 5) then { _n = 0.50 };
			if (_economia >= 6) then { _n = 0.65 };
			if (_economia >= 7) then { _n = 0.75 };
			if (_economia >= 8) then { _n = 0.85 };
			if (_economia >= 9) then { _n = 0.95 };
			if (_economia >= 10) then { _n = 1.30 };
			
			life_ATMcash = life_ATMcash + round (_base * _n);
			systemChat format ["Tus gestiones te rinden con %1€", round (_base * _n)];
			sleep (60 * 5);
		};
	};
};

[] spawn { // Supervivencia
	while {true} do {
		_supervivencia = [expSupervivencia] call ica_expToLevel;
		_sleep = 5;
		
		if (_supervivencia > 0) then {	
			if (_supervivencia >= 1) then {	_sleep = 45;	};
			if (_supervivencia >= 3) then {	_sleep = 40;	};
			if (_supervivencia >= 5) then {	_sleep = 35;	};
			if (_supervivencia >= 7) then {	_sleep = 30;	};
			if (_supervivencia >= 9) then {	_sleep = 25;	};
			
			life_hunger = life_hunger + 5;
			if (life_hunger > 100) then {life_hunger = 100};
			life_thirst = life_thirst + 5;
			if (life_thirst > 100) then {life_thirst = 100);
		};
		sleep (60 * _sleep);
	};
};

player addEventHandler ["HandleDamage", {
	if ((_this select 3) == player) then {
		_reduc = 0;
		_supervivencia = [expSupervivencia] call ica_expToLevel;
		if (_supervivencia > 0) then {	
			if (_supervivencia >= 2) then {	_reduc = 1;	};
			if (_supervivencia >= 4) then {	_reduc = 2;	};
			if (_supervivencia >= 6) then {	_reduc = 3;	};
			if (_supervivencia >= 8) then {	_reduc = 4;	};
		};

		_dmg = (_this select 2) - _reduc;
		if (_dmg < 0) then {_dmg = 0};
		//hint format ["daño: %1\n daño final %2", _this select 2, _dmg];
		_dmg
	} else {
		_this select 2;
	};
}];