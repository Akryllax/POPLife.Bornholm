
_param = _this select 0;

if (_param == "hablo") exitWith {
	private "_bla";
	
	_bla = [
		"Mi nombre es Nedipar y la mesa está justo debajo del sombrero, que no te vea yo tocar el paraguas eh.", 
		"Dicen que estoy loco, pero ¿no es más loco el que cree todo lo que le dicen? No lo sé eh, yo pregunto.", 
		"Bua ¿has visto a los duendes de la entrada? A ver si el loco vas a ser tú, porque yo sólo he visto 2,7 dragones.            Rosas.", 
		"Me han dicho que el secreto de la vida es que me han dicho que el secreto de la vida es que te he dicho que dejes de preguntarme cuál es el secreto de la vida. Jodido loco...", 
		"Jajajajajjajajajaajajajajajajaj", 
		"Uhm...", 
		"Dios es el camino, yo lo he seguido y mírame, he sobrevivido y a penas estoy jodido. Y sin haberlo planeado me ha salido un pareado.", 
		"A veces me vuelvo loco de pensar en cosas que hace la gente, pienso torturas y castigos pa hijos de puta que merecen la muerte. Pero de buen rollo eh.", 
		"Jojojojojojojojojojojojojojojo", 
		"...", 
		"Quiereh sentil·la en er pesho?", 
		"Ayer vi a un par de esqueletos andando por ahí, ¿conoces a algún nigromante? Tengo un par de dudas sobre lo que hay después del nacimiento y antes de la muerte."
	] call BIS_fnc_selectRandom;
	
	if ((floor (random 10)) < 3) then {
		loco setDir 19;
	} else {
		loco setDir 196;
	};
	
	if ((floor (random 10)) < 2) then {
		_bla = [
			"Dicen que digo, que la primera letra está en la posición de 5+5", 
			"La segunda letra dice 'Eh que le dejé de tres en tres le E eh' ", 
			"La tercera letra es igual que la cuarta, y lidera la palabra que define el acto sexual", 
			"La quinta letra ha copiado a la segunda", 
			"Las ratas tienen delante a la sexta letra", 
			"La sexta, séptima y octava letra, SON hijo en INGLÉS.", 
			"La décima letra... no hay décima letra", 
			"La letra número 11, 12, 13 y 14 SON colina en INGLÉS"
		] call BIS_fnc_selectRandom;	
	};
	
	hint _bla;
};

if (_param == "abro") exitWith {
	disableUserInput true;
	cofreloco setPos (getMarkerPos "lejos");
	titleText ["Abriendo cofre...", "PLAIN", 1];
	sleep 2;
	titleText ["El cofre está vacío...", "PLAIN", 1];
	sleep 3;
	titleText ["...porque acabas de sacar todo el dinero...", "PLAIN", 1];
	sleep 3;
	titleText ["... jodido loco...", "PLAIN", 1];

	// life_cash = life_cash + 175000;
	disableUserInput false;
};

if (_param == "tp") exitWith {
	player setPosATL [5124,8368.75,0.0022583];
};