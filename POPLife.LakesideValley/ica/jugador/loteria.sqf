
/*
Lotería por Icaruk
El sonido de ganador ha sido grabado por Mike Koenig.
*/

_param = _this select 0;

if (_param == "init") exitWith {
	while {true} do {
		loteria = 1 + floor (random 200);
		sleep (60 * 55);
	};
};

if (_param == "menu") exitWith {
	createDialog "loteria_DIALOG";

	_caller = _this select 0;
	_ui = uiNamespace getVariable "loteria_dialog";

	if (tiempoLoteria >= 30) then {
		(_ui displayCtrl 9000) ctrlSetText format ["%1 mins",tiempoloteria - 30];
	};
	if (tiempoLoteria < 30) then {
		_tiempo = tiempoLoteria;
		(_ui displayCtrl 9000) ctrlSetText format ["%1 mins",tiempoloteria];
	};

	if (isNil {_caller getVariable "numeroLoteria"}) then {
		_numero = "";
		(_ui displayCtrl 9001) ctrlSetText format ["%1",_numero];
	} else {
		_numero = _caller getVariable "numeroLoteria";
		(_ui displayCtrl 9001) ctrlSetText format ["%1",_numero];
	};
	if (isNil {loteria}) then {
		_numeroGanador = "";
		(_ui displayCtrl 9002) ctrlSetText format ["%1",_numeroGanador];
	} else {
		_numeroGanador = loteria;
		(_ui displayCtrl 9002) ctrlSetText format ["%1",_numeroGanador];
	};
};

if (_param == "compro") exitWith {
	_caller = _this select 0;

	if (isNil {espera}) then {
		espera = false;
	};

	if (espera) then {
		hint "Tienes que esperar 1 minuto antes de cambiar tu número.";
	};

	if !(espera) then {
		
		if !(life_cash >= 3000) exitWith {hint "No tienes suficiente dinero"};
		
		_num = round random 60;
		
		_caller setVariable ["numeroLoteria", _num, false];
		hint format ["Tu número de lotería es %1.",_num];
			
		[] spawn {
			espera = true;
			sleep 60;
			espera = false;
		};
		
		life_cash = life_cash - 3000;
	};
};


/*
Acciones del NPC

Abrir menu:
	this addAction ["Loterícaruk",'null = [player] execVM "menuloteria.sqf";', "", 9,false,true,"",""];
Cobrar (ya se hace desde el menu);
	this addAction ["Cobrar",'null = [player] execVM "cobrar.sqf";', "", 9,false,true,"",""];
Preguntar número (ya se hace desde el menu);
	this addAction ["¿Cuál es mi número?",'null = [player] execVM "minumero.sqf";', "", 9,false,true,"",""];
*/


if (_param == "cobrar") exitWith {
	_caller = _this select 0;   

	if ((isNil {loteria}) OR (!isNil {cobrado})) exitWith {
		hint "Aún no ha salido el número ganador o alguien ya ha cobrado el premio.";
	};

	if (((_caller getVariable "numeroLoteria") == loteria) and (!isNil {loteria})) then {
		hint "¡¡Has ganado!!";
		playSound "ganador";
		
		nombreGanador = profileName;
		publicVariable "nombreGanador";

		[{systemChat format ["¡%1 ha ganado la lotería!",nombreGanador];},"BIS_fnc_spawn",true,true] call BIS_fnc_MP;
		
		cobrado = true;
		publicVariable "cobrado";
		
		life_cash = life_cash + round (300000 + (random 100000));
		
		loteria = nil;
		publicVariable "loteria";
		
		tiempoLoteria = 30 + tiempoLoteria;
		publicVariable "tiempoLoteria";
		
	}; 

	if !(isNil {loteria}) then {
		if !((_caller getVariable "numeroLoteria") == loteria) then {
			hint format ["Ohh, el número ganador es el %1 y tú tienes el %2.", loteria, (_caller getVariable "numeroLoteria")];
		};
	};
};

if (_param == "historia1") exitWith {
	hint "Así que quieres que te cuente mis historia, bien....\n\n

	Estaba yo tranquilamente trabajando en mi puesto, como siempre, cuando de repente empezaron a sonar alarmas.\n
	Vi como pasaban policías con fusiles de asalto a toda prisa, uniformados como fuerzas especiales, iban de aquí para allá pegando voces diciendo que había que marcharse de Altis lo antes posible. ¿Y qué pasa con mi negocio? ¿Qué hago con el dinero que he ganado todos estos años? No podía dejarlo todo atrás por cualquier mierda así que busqué un sitio para esconderme. \n\n

	Agazapado en la oscuridad, mientras la fuerte lluvia castigaba mi espalda, a cada paso mis pies se hundían en el barro como si aquello fueran arenas movedizas, me apresuré hasta la tienda general, subí al primer piso y me quedé allí esperando.\n\n

	Hubo una gran explosión, venía de muy lejos y al rato empecé a escuchar disparos acompañados de gritos, pero los gritos no eran de personas, sonaban demasiado... no sé, no eran normales. Estaba muy asustado porque empecé a escuchar sonidos extraños en el piso de abajo y me quedé completamente paralizado, no moví ni un sólo músculo temiendo hacer rudido.\n
	Después escuché a alguien subiendo las escaleras hacia donde yo estaba -Joder estoy jodido -pensé, ya no me daba tiempo a escapar por ningún sitio, así que cerré los ojos sin más esperando mi destino...
	";
};

if (_param == "historia2") exitWith {
	hint "-Eh tío no te asustes, no soy uno de esos, me llamo Miguel. Ni muerdo ni voy armado, y creo que los dos estamos igual de jodidos aquí arriba. -Las palabras de aquel tipo me convencieron y abrí los ojos. Su aspecto era deplorable, lleno de mierda, de barro y empapado... como yo. \n\n
	Me explicó la causa de la evacuación de Altis, y el resumen fué: científicos, virus y zombis. Joder, esto es lo que pasa cuando se juega a ser Dios.\n
	Escuchamos un camión y muchas voces, Miguel se levantó de un salto y bajó corriendo las escaleras a gritando algo de que era nuestra última oportunidad. Yo me quedé ahí arriba escuchando conversaciones sobre chupetes y pirulís... vaya panda de retrasados.\n\n

	Al final el camión se marchó y dejé de escuchar voces. Después escuché un helicóptero acercarse... y alejarse. \n\n

	De pronto empezaron a caer bombas del cielo, destuyendo todo a su paso, yo ya estaba sentenciado a morir aplastado en aquel edificio. Vi un destello y perdí la consciencia. \n\n

	No sé cuánto tiempo pasó pero vinieron a por mí y me llevaron a esta maravillosa ciudad.

	";
};
