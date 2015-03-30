
while {true} do {
	sleep (60 * 10);
	_i = floor (life_ATMcash * 0.0005);
	life_ATMcash = life_ATMcash - _i;
	
	systemChat format ["Se te han deducido %1€ de impuestos, hacienda somos todos.", _i];
};
