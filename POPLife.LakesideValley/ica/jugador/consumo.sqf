/*
Consumo de combustible
by: Icaruk
*/


while {true} do {

	_coef = 0.015; // (100 / (_coef * 2)) = 33min
	_aumento = 0.001;
	

	_miNivel = [expConduccion] call ica_expToLevel;
	sleep 0.1;
	
	if (_miNivel == 0) then {
		_coef = _coef * 1;
	} else {
		if (_miNivel >= 1) then {
			_coef = _coef * 0.95;
		} else {
			if (_miNivel >= 3) then {
				_coef = _coef * 0.90;
			} else {
				if (_miNivel >= 5) then {
					_coef = _coef * 0.85;
					} else {
						if (_miNivel >= 7) then {
							_coef = _coef * 0.80;
					};
				};
			};
		};
	};
	
	
	if (vehicle player != player) then { // estoy en veh
		if ((vehicle player) isKindOf "Land") then { // veh terrestre
			if (isEngineOn vehicle player) then { // motor encendido
				if (driver (vehicle player) == player) then {	// soy conductor
					_vel = speed vehicle player;
					
					if ((_vel >= 20) AND (_vel < 60)) then {
						vehicle player setFuel ((fuel vehicle player) - _coef);
					};
					if ((_vel >= 60) AND (_vel < 100)) then {
						vehicle player setFuel ((fuel vehicle player) - (_coef + _aumento));
					};
					if ((_vel >= 100) AND (_vel < 140)) then {
						vehicle player setFuel ((fuel vehicle player) - (_coef + (_aumento * 2)));
					};
					if (_vel >= 140) then {
						vehicle player setFuel ((fuel vehicle player) - (_coef + (_aumento * 3)));
					};
				};
			};
		};
	};
	
	sleep 30;
};