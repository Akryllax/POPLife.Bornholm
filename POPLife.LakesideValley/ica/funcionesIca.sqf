/*
Funciones.
by: Icaruk

Función: Carga las funciones necesarias para que funcione todo xD.
*/

onmap = {
    onmapSingleClick "if (_alt) then {vehicle player setPos _pos};    ";
};

ica_meteAccion = {  
    private ["_a", "_b"];  
    _a = _this select 0;  
    _b = _this select 1;  
    _a addAction _b;  
};

ica_dameItem = {
	/*
	dameItem por Icaruk
	Función: añade un item al jugador sin importar de qué tipo sea
	se invoca con
		["classname", cantidad] call ica_dameItem;	
	*/
	private ["_class", "_cantidad", "_veh"];
	_class = _this select 0;
	_cantidad = _this select 1;
	
	if (isNil {_cantidad}) then {_cantidad = 1}; // si no hay cantidad pongo 1
	
	if (isClass (configFile >> "CfgMagazines" >> _class)) exitWith { // si es cargador
		player addMagazines [_class, _cantidad];
	};
	if (isClass (configFile >> "CfgWeapons" >> _class)) exitWith {
			_type = (getNumber (configFile >> "CfgWeapons" >> _class >> "ItemInfo" >> "Type"));
			
			if (_type == 801) then {
				removeUniform player;
				player forceAddUniform _class;
			};
			if (_type == 701) then {
				removeVest player;
				player addVest _class;
			};
			if (_type == 0) then {
				player addWeapon _class;
			};
	};
	if (isClass (configFile >> "CfgVehicles" >> _class)) exitWith { // si es veh
		_pos = getPos player;
		
		_veh = createVehicle [_class, (getPos _pos), [], 0, "NONE"];
		waitUntil {!isNil "_veh"};
		_veh allowDamage false;
		_veh lock 2;
		_veh setVectorUp (surfaceNormal (getPos _pos));
		_veh setPos (getPos _pos);
		[[_veh,1],"life_fnc_colorVehicle",true,false] spawn life_fnc_MP;
		[_veh] call life_fnc_clearVehicleAmmo;
		[[_veh,"trunk_in_use",false,true],"TON_fnc_setObjVar",false,false] spawn life_fnc_MP;
		[[_veh,"vehicle_info_owners",[[getPlayerUID player,profileName]],true],"TON_fnc_setObjVar",false,false] spawn life_fnc_MP;
		_veh disableTIEquipment true;
		_veh allowDamage true;
		
		life_vehicles pushBack _veh;
		[[getPlayerUID player,playerSide, _veh, 1],"TON_fnc_keyManagement",false,false] spawn life_fnc_MP;
		[[(getPlayerUID player),playerSide, _veh, 0],"TON_fnc_vehicleCreate",false,false] spawn life_fnc_MP;
		[0] call SOCK_fnc_updatePartial; //Sync silently because it's obviously silently
	};
	if (!(isClass (configFile >> "CfgMagazines" >> _class)) AND !(isClass (configFile >> "CfgWeapons" >> _class)) AND
	!(isClass (configFile >> "CfgVehicles" >> _class))) then { // es una variable
		_class = [_class] call ica_classToName;
	
		if ((_class == "Heroina") OR (_class == "Heroina x 5")) then {_class = "heroinp"};
		if ((_class == "Marihuana") OR (_class == "Marihuana x 5")) then {_class = "marijuana"};
		if ((_class == "Cocaina") OR (_class == "Cocaina x 5")) then {_class = "cocainep"};
		if (_class == "Papel Moneda")  then {_class = "papelmoneda"};
		if (_class == "Papel")  then {_class = "pepel"};
		if (_class == "Pintura")  then {_class = "pintura"};
		if (_class == "Barril de Combustible")  then {_class = "fuelF"};
		if (_class == "Barril de Crudo")  then {_class = "oilp"};
		if (_class == "Agua Sucia")  then {_class = "aguasucia"};
		if (_class == "Algodon")  then {_class = "cotton"};
		if (_class == "Amoniaco")  then {_class = "amoniaco"};
		if (_class == "Componentes Electricos")  then {_class = "componenteselectricos"};
		if (_class == "Alcohol")  then {_class = "alcohol"};
		if (_class == "Pastillas de Experiencia")  then {_class = "pastilasdeexperiencia"};
		if (_class == "Pocion Parkour")  then {_class = "pocionparkour"};
		if (_class == "Coctel Molotov")  then {_class = "coctelmolotov"};
		if (_class == "Panel de Cristal")  then {_class = "placadecristal"};
		if (_class == "Gran Lingote")  then {_class = "granlingote"};
		if (_class == "Hoja de Coca")  then {_class = "cocaine"};
		if (_class == "Opio")  then {_class = "heroinu"};
		if (_class == "Cannabis")  then {_class = "cannabis"};
		if (_class == "Cristal")  then {_class = "glass"};
		if (_class == "Hierro")  then {_class = "hierro"};
		if (_class == "Arena")  then {_class = "sand"};
		if (_class == "Carbon")  then {_class = "carbon"};
		if (_class == "Polvora")  then {_class = "polvora"};
		if (_class == "Lingote de hierro")  then {_class = "lingotehierro"};
		
		
		[true, _class, _cantidad] call life_fnc_handleInv;
	};	
};

ica_classToName = {
	private ["_class", "_nom"];
	_class = _this select 0;
	
	if (_class == "") exitWith {_class};
	if (isClass (configFile >> "CfgMagazines" >> _class)) then { // si es cargador
		_nom = getText (configFile >> "CfgMagazines" >> _class >> "Displayname"); // busco nombre cargador
	};
	if (isClass (configFile >> "CfgWeapons" >> _class)) then { // si es arma
		_nom = getText (configFile >> "CfgWeapons" >> _class >> "Displayname"); // lo busco de arma
	};
	if (isClass (configFile >> "CfgVehicles" >> _class)) then { // si es veh
		_nom = getText (configFile >> "CfgVehicles" >> _class >> "Displayname"); // pues de veh
	};
	if (!(isClass (configFile >> "CfgMagazines" >> _class)) AND !(isClass (configFile >> "CfgWeapons" >> _class)) AND
	!(isClass (configFile >> "CfgVehicles" >> _class))) then { // es una variable
		_nom = [_class] call life_fnc_vartostr;
	};
	if (typeName _nom == "BOOL") then {
		_nom = _class;
	};
	if (isNil {_nom}) then {
	
		_nom = _class
	};

	_nom
};

ica_precioSuministros = {
	private ["_cosa", "_n", "_din"];
	_cosa = (_this select 0);
	
	switch (_cosa) do {
		case "": {_n = 0};
		case "aguasucia": {_n = aguExt; _din = round (((2500 - _n) / 10) * 1.5); };
		case "oilp": {_n = comExt; _din = round ((2500 - _n) / 10) * 2.3; };
		case "fuelF": {_n = comExt; _din = round (((2500 - _n) / 10) * 16); };
		case "pescado": {_n = aliExt; _din = round (((2200 - _n) / 10) * 6.4); };
		case "wheat": {_n = aliExt; _din = round (((2500 - _n) / 10) * 1.9); };
		case "sunflower": {_n = aliExt; _din = round (((2500 - _n) / 10) * 1.9); };
		case "corn": {_n = aliExt; _din = round (((2500 - _n) / 10) * 1.9); };
		case "cotton": {_n = aliExt; _din = round (((2500 - _n) / 10) * 1.9); };
		case "olive": {_n = aliExt; _din = round (((2500 - _n) / 10) * 1.9); };
		case "medicamentos": {_n = medExt; _din = round (((2040 - _n) / 10) * 2); };
	};
	if (isNil {_din}) then {_din = 1};
	_din
};
ica_precioSuministrosTrans = {
	private ["_cosa", "_n", "_din", "_base"];
	_cosa = toLower (_this select 0);

	switch (_cosa) do {
		case "alimento": {
			_base = round ((1020 - aliCen) / 10);
			_din = _base * 7; // precio unidad
		};
		case "agua": {
			_base = round ((1020 - aguCen) / 10);
			_din = _base * 13;
		};
		case "combustible": {
			_base = round ((1020 - comCen) / 10);
			_din = _base * 14;
		};
		case "medicamentos": {
			_base = round ((1020 - medCen) / 10);
			_din = _base * 8;
		};
	};
	if (isNil {_din}) then {_din = 1};
	_din
};
ica_precioCombustible = {
	private "_n";
	_n = round ((1400 - comExt) * 0.02); // cada 1%
	_n	
};
ica_precioDrogas = {
	private ["_din", "_sinProcesar", "_procesado"];
	_dro = _this select 0;

	_sinProcesar = 5;
	_procesado = 15;
	
	switch (_dro) do {
		case "cannabis": {_din = 1200 + round (demCan * _sinProcesar); };
		case "marijuana": {_din = 2000 + round (demMar * _procesado); };
		case "heroinu": {_din = 1300 + round (demOpi * _sinProcesar); };
		case "heroinp": {_din = 2500 + round (demHer * _procesado); };
		case "cocaine": {_din = 1400 + round (demHC * _sinProcesar); };
		case "cocainep": {_din = 3000 + round (demCoc * _procesado); };
	};
	if (isNil {_din}) then {_din = 1};
	_din
};
ica_precioMineria = {
	private ["_mina", "_din", "_base"];
	_mina = _this select 0;

	_base = 5;
	
	switch (_mina) do {
		case "sand": {_din = 250 + round (demAre * _base); };
		case "carbon": {_din = 300 + round (demCar * _base); };
		case "hierro": {_din = 350 + round (demHie * _base); };
		case "polvora": {_din = 400 + round (demPol * _base); };
		case "goldbar": {_din = 2000 + round (demOro * _base); };
		case "diamondr": {_din = 3000 + round (demDia * _base); };
	};
	if (isNil {_din}) then {_din = 1};
	_din
};


ica_bajaDemandaDeDrogas = {
	private ["_dro", "_can"];
	_dro = _this select 0;
	_can = _this select 1;
	
	switch (_dro) do {
		case "cannabis": {demCan = demCan - _can; if (demCan < 0) then {demCan = 0; }; publicVariableServer "demCan"; };
		case "marijuana": {demMar = demMar - _can; if (demMar < 0) then {demMar = 0; }; publicVariableServer "demMar"; };
		case "opium": {demOpi = demOpi - _can; if (demOpi < 0) then {demOpi = 0; }; publicVariableServer "demOpi"; };
		case "heroinp": {demHer = demHer - _can; if (demHer < 0) then {demHer = 0; }; publicVariableServer "demHer"; };
		case "cocaine": {demHC = demHC - _can; if (demHC < 0) then {demHC = 0; }; publicVariableServer "demHC"; };
		case "cocainep": {demCoc = demCoc - _can; if (demCoc < 0) then {demCoc = 0; }; publicVariableServer "demCoc"; };
	};
};
ica_bajaDemandaDeMineria = {
	private ["_mina", "_can"];
	_mina = _this select 0;
	_can = _this select 1;
	
	switch (_mina) do {
		case "sand": {demAre = demAre - _can; if (demAre < 0) then {demAre = 0; }; publicVariableServer "demAre"; };
		case "carbon": {demCar = demCar - _can; if (demCar < 0) then {demCar = 0; }; publicVariableServer "demCar"; };
		case "hierro": {demHie = demHie - _can; if (demHie < 0) then {demHie = 0; }; publicVariableServer "demHie"; };
		case "polvora": {demPol = demPol - _can; if (demPol < 0) then {demPol = 0; }; publicVariableServer "demPol"; };
		case "goldbar": {demOro = demOro - _can; if (demOro < 0) then {demOro = 0; }; publicVariableServer "demOro"; };
		case "diamondr": {demDia = demDia - _can; if (demDia < 0) then {demDia = 0; }; publicVariableServer "demDia"; };
	};
};
ica_subeBajaBeneficios = {
	private ["_que", "_can"];
	_que = toLower (_this select 0);
	_can = round (_this select 1);
	
	["beneficiosEmpresas"] call ica_dameVar; if !(call ica_editando) then { waitUntil {!isNil {paq}}; }; paq = nil;
	
	switch (true) do {
		case (_que in ["wheat", "sunflower",  "corn",  "cotton",  "olive",  "campo"]): {
			benCampo = benCampo + _can;
			publicVariableServer "benCampo";
		};
		case (_que in ["purificadora",  "aguasucia"]): {
			benPurificadora = benPurificadora + _can;
			publicVariableServer "benPurificadora";
		};
		case (_que in ["oilp", "fuelf", "refineria"]): {
			benRefineria = benRefineria + _can;
			publicVariableServer "benRefineria";
		};
		case (_que in ["farmacia"]): {
			benFarmacia = benFarmacia + _can;
			publicVariableServer "benFarmacia";
		};		
		case (_que in ["sand", "carbon", "hierro", "polvora", "mina"]): {
			benMina = benMina + _can;
			publicVariableServer "benMina";
		};
	};
};
ica_subeBajaSuministros = {
	private ["_estoy", "_cosa", "_can", "_fuera", "_n"];
	_estoy = toLower (_this select 0);
	_cosa = _this select 1;
	_can = round (_this select 2);
	
	["suministrosCen"] call ica_dameVar; if !(call ica_editando) then { waitUntil {!isNil {paq}}; }; paq = nil;
	["suministrosExt"] call ica_dameVar; if !(call ica_editando) then { waitUntil {!isNil {paq}}; }; paq = nil;
	
	switch (_estoy) do {
		case "zonac_1": {
			if (_cosa == "agua") then { 
				if (_can > aguExt) exitWith {_fuera = true };
				aguExt = aguExt - _can;
				publicVariableServer "aguExt";
			};
		};
		case "zonac_2": { 
			if (_cosa == "alimento") then { 
				if (_can > aliExt) exitWith {_fuera = true };
				aliExt = aliExt - _can;
				publicVariableServer "aliExt";
			};
		};
		case "zonac_3": { 
			if (_cosa == "medicamentos") then { 
				if (_can > medExt) exitWith {_fuera = true };
				medExt = medExt - _can;
				publicVariableServer "medExt";
			};
		};
		case "zonac_4": { 
			if (_cosa == "combustible") then { 
				if (_can > comExt) exitWith {_fuera = true };
				comExt = comExt - _can;
				publicVariableServer "comExt";
			};
		};		
		case "descarga": { 
			if (_cosa == "alimento") then { 
				aliCen = aliCen + _can;
				if (aliCen >= 1000) exitWith {aliCen = 1000; _fuera = true };
				publicVariableServer "aliCen";
			};
			if (_cosa == "agua") then { 
				aguCen = aguCen + _can;
				if (aguCen > 1000) exitWith {aguCen = 1000; _fuera = true };
				publicVariableServer "aguCen";
			};
			if (_cosa == "combustible") then { 
				comCen = comCen + _can;
				if (comCen > 1000) exitWith {comCen = 1000; _fuera = true };
				publicVariableServer "comCen";
			};
			if (_cosa == "medicamentos") then { 
				medCen = medCen + _can;
				if (medCen > 1000) exitWith {medCen = 1000; _fuera = true };
				publicVariableServer "medCen";
			};
		};	
		case "central": { 
			_alimentos = ["alimento", "pescado", "wheat", "sunflower", "corn", "cotton", "olive"];
			if (_cosa in _alimentos) then { 
				aliExt = aliExt + _can;
				if (aliExt >= 1000) exitWith {aliExt = 1000; _fuera = true };
				publicVariableServer "aliExt";
			};
			if (_cosa == "aguasucia") then { 
				aguExt = aguExt + _can;
				if (aguExt > 1000) exitWith {aguExt = 1000; _fuera = true };
				publicVariableServer "aguExt";
			};
			if ((_cosa == "oilp") OR (_cosa == "fuelF")) then { 
				comExt = comExt + _can;
				if (comExt > 1000) exitWith {comExt = 1000; _fuera = true };
				publicVariableServer "comExt";
			};
			if (_cosa == "medicamentos") then { 
				medExt = medExt + _can;
				if (medExt > 1000) exitWith {medExt = 1000; _fuera = true };
				publicVariableServer "medExt";	
			};
		};	
	};
	
	if (!isNil {_fuera}) then {_n = false} else {_n = true};
	_n
};


ica_ganoSubasta = {
	private ["_quien", "_cuanto"];
	_quien = _this select 0;
	_cuanto = _this select 1;
	
	if (name player == _quien) then {
		life_atmcash = life_atmcash - _cuanto;
		iniciaSubasta = nil;
		publicVariable "iniciaSubasta";	
		
		hint format ["Has ganado la subasta, te pertenece toda la actividad económica de ese sector durante 1h. \n\nSe te han descontado de tu cuenta los %1€ de tu puja.", _cuanto];
		[[0, format ["%1 ha ganado una subasta.", name player]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
		paq = [player, "anuncio", 
			[8, format ["%1", name player], [1,0,0], 1.5, "ha ganado una subasta", [1,1,1], 1]
		]; publicVariableServer "paq"; paq = nil;
	};	
};
/*
ica_expToLevel = {
	private "_n";
	_n = _this select 0;
	// _n = 500

	switch (true) do {
		case ((_n >= 0) AND (_n < 30)): {_n = 0; };			// 30
		case ((_n >= 30) AND (_n < 80)): {_n = 1; }; 			// 50
		case ((_n >= 80) AND (_n < 140)): {_n = 2; }; 		// 60
		case ((_n >= 140) AND (_n < 210)): {_n = 3; }; 		// 70
		case ((_n >= 210) AND (_n < 300)): {_n = 4; };			// 90
		case ((_n >= 300) AND (_n < 410)): {_n = 5; };			// 110
		case ((_n >= 410) AND (_n < 530)): {_n = 6; };			// 120
		case ((_n >= 530) AND (_n < 670)): {_n = 7; };			// 140
		case ((_n >= 670) AND (_n < 820)): {_n = 8; };			// 150
		case ((_n >= 820) AND (_n < 1000)): {_n = 9; };		// 180
		case ((_n >= 1000) AND (_n <= 1100)): {_n = 10; };
	};
	_n
};
*/


ica_expToLevel = {
	// [30] call ica_expToLevel2 // pido nivel
	// 30 call ica_expToLevel2 // pido exp necesaria

	private ["_lvl", "_n", "_base", "_req", "_aumento"];
	if ((typeName _this) == "ARRAY") then {_n = _this select 0};
	if ((typeName _this) == "SCALAR") then {_n = _this};
	
	if (isNil {_n}) exitWith {};
	
	_lvl = 0;
	_base = 30;

	while {true} do {
		if (_n < _base) exitWith {_req = _base - _n};
		_aumento = 50 + round (((_lvl + 1) * 2) ^ 2.2);
		_base = _base + _aumento;
		_lvl = _lvl + 1;
	};
	
	if ((typeName _this) == "ARRAY") then {_n = _lvl; if (isNil {_n}) then {_n = 0}; };
	if ((typeName _this) == "SCALAR") then {_n = _req};
	_n
};
ica_expParaSubir = {
	private ["_n", "_lvl", "_tengo"];
	_tengo = _this select 0;
	_lvl = [_tengo] call ica_expToLevel;

	switch (_lvl) do {
		case 0: {_n = 30 - _tengo		};
		case 1: {_n = 80 - _tengo		};
		case 2: {_n = 140 - _tengo	};
		case 3: {_n = 210 - _tengo	};
		case 4: {_n = 300 - _tengo	};
		case 5: {_n = 410 - _tengo	};
		case 6: {_n = 530 - _tengo	};
		case 7: {_n = 670 - _tengo	};
		case 8: {_n = 820 - _tengo	};
		case 9: {_n = 1000 - _tengo	};
		case 10: {_n = 0			};
	};
	if (_n < 0) then {_n = 0};
	_n
};
ica_desempaquetaExp = {
	waitUntil {!isNil {experiencia}};
	//waitUntil {life_session_completed};
	
	expMarinero = (experiencia select 0) select 0;
	expMineria = (experiencia select 1) select 0;
	expQuimica = (experiencia select 2) select 0;
	expConduccion = (experiencia select 3) select 0;
	expPA = (experiencia select 4) select 0; 
	expSupervivencia = (experiencia select 5) select 0; 
	expFortaleza = (experiencia select 6) select 0;
	expEconomia = (experiencia select 7) select 0; 
	expMafia = (experiencia select 8) select 0;
	
	systemChat "----- Variables de experiencia cargadas -----";
	
	if ((isNil {expMarinero}) AND (isNil {expMafia})) then {
		if (isNil {expMarinero}) then {expMarinero = 0};
		if (isNil {expMineria}) then {expMineria = 0};
		if (isNil {expQuimica}) then {expQuimica = 0};
		if (isNil {expConduccion}) then {expConduccion = 0};
		if (isNil {expPA}) then {expPA = 0};
		if (isNil {expSupervivencia}) then {expSupervivencia = 0};
		if (isNil {expFortaleza}) then {expFortaleza = 0};
		if (isNil {expEconomia}) then {expEconomia = 0};
		if (isNil {expMafia}) then {expMafia = 0};
		
		experiencia = [[expMarinero], [expMineria], [expQuimica], [expConduccion], [expPA], [expSupervivencia], [expFortaleza], [expEconomia], [expMafia]];
		[22] call SOCK_fnc_updatePartial; //Akry: Guardar datos.
		
		systemChat "----- La experiencia era nil y se ha reiniciado -----";
	};
};
ica_dameExp = {
	// ["Agricultura", 10];
	private ["_n", "_que", "_max"];
	_que = toLower (_this select 0);
	_n = round(_this select 1);
	
	_max = 2506; // 2406 + 100
	switch (_que) do {
		case "marinero": {expMarinero = expMarinero + _n; if (expMarinero > _max) then {expMarinero = _max}; };
		case "minería": {expMineria = expMineria + _n; if (expMineria > _max) then {expMineria = _max}; };
		case "química": {expQuimica = expQuimica + _n; if (expQuimica > _max) then {expQuimica = _max}; };
		case "conducción": {expConduccion = expConduccion + _n; if (expConduccion > _max) then {expConduccion = _max}; };
		case "primeros auxilios": {expPA = expPA + _n; if (expPA > _max) then {expPA = _max}; };
		case "supervivencia": {expSupervivencia = expSupervivencia + _n; if (expSupervivencia > _max) then {expSupervivencia = _max}; };
		case "fortaleza": {expFortaleza = expFortaleza + _n; if (expFortaleza > _max) then {expFortaleza = _max}; };
		case "economía": {expEconomia = expEconomia + _n; if (expEconomia > _max) then {expEconomia = _max}; };
		case "mafia": {expMafia = expMafia + _n; if (expMafia > _max) then {expMafia = _max}; };
	};
	experiencia = [[expMarinero], [expMineria], [expQuimica], [expConduccion], [expPA], [expSupervivencia], [expFortaleza], [expEconomia], [expMafia]];
	
	[22] call SOCK_fnc_updatePartial; //Akry: Guardar datos.
	
	_str = _que + format [" +%1 exp", _n];
	[_str] call ica_masuno
};
ica_quitameExp = {
	private ["_n", "_que"];
	_n = 0.90;
	
	for "_i" from 1 to 2 do {
		_que = ["marinero", "minería", "química", "conducción", "primeros auxilios", "supervivencia", "fortaleza", "economía"] call BIS_fnc_selectRandom;
		switch (_que) do {
			case "marinero": {expMarinero = round(expMarinero * _n); if (expMarinero <= 0) then {expMarinero = 0}; };
			case "minería": {expMineria = round(expMineria * _n); if (expMineria <= 0) then {expMineria = 0}; };
			case "química": {expQuimica = round(expQuimica * _n); if (expQuimica <= 0) then {expQuimica = 0}; };
			case "conducción": {expConduccion = round(expConduccion * _n); if (expConduccion <= 0) then {expConduccion = 0}; };
			case "primeros auxilios": {expPA = round(expPA * _n); if (expPA <= 0) then {expPA = 0}; };
			case "supervivencia": {expSupervivencia = round(expSupervivencia * _n); if (expSupervivencia <= 0) then {expSupervivencia = 0}; };
			case "fortaleza": {expFortaleza = round(expFortaleza * _n); if (expFortaleza <= 0) then {expFortaleza = 0}; };
			case "economía": {expEconomia = round(expEconomia * _n); if (expEconomia <= 0) then {expEconomia = 0}; };
		};
	};
	experiencia = [[expMarinero], [expMineria], [expQuimica], [expConduccion], [expPA], [expSupervivencia], [expFortaleza], [expEconomia], [expMafia]];
	
	[22] call SOCK_fnc_updatePartial; //Akry: Guardar datos.
};

ica_masuno = {
	/*
	Script de la misión Desolation creado por Icaruk
	Función: Muestra un efecto de texto con los parametros recibidos
	Se invoca con:
		["texto"] call ica_masuno;
	*/
	[_this select 0, _this select 1] spawn {
		_texto = _this select 0;
		_tipo = _this select 1;

		("icapa5" call BIS_fnc_rscLayer) cutText ["","PLAIN"];
		("icapa5" call BIS_fnc_rscLayer) cutRsc ["masuno","PLAIN"];

		_ui = uiNameSpace getVariable "masuno";
		_masuno = _ui displayCtrl 4065;
		_masuno ctrlSetText _texto;

		if (isNil {_tipo}) then {
			_parpadeos = 0;
			while {_parpadeos < 5} do {
				_masuno ctrlSetTextColor [0.2,1,0.2,1];
				sleep 0.2;
				_masuno ctrlSetTextColor [1,1,1,1];
				sleep 0.2;
				_parpadeos = _parpadeos + 1;
			};
		};

		_a = 100;
		while {true} do {
			if (_a <= 0) exitWith {};
			
			_masuno ctrlSetPosition [
				((ctrlPosition _masuno) select 0),
				((ctrlPosition _masuno) select 1) + 0.003,
				((ctrlPosition _masuno) select 2),
				((ctrlPosition _masuno) select 3)
			];
			_masuno ctrlCommit 0;
			
			sleep 0.001;
			
			_a = _a - 1;
		};
	};
};

ica_barrita = {
	/*
	Creador de barras de proceso por Icaruk
	Se invoca con:
		[20, "Reparando..."] call ica_barrita;
	*/
	[_this select 0, _this select 1] spawn {
		_t = _this select 0;
		_texto = _this select 1;
		private "_barra";
		("icapa7" call BIS_fnc_rscLayer) cutRsc ["barrita","PLAIN"];

		_barra = uiNameSpace getVariable "barrita";
		_progreso = _barra displayCtrl 5010;
		_tx = _barra displayCtrl 5011;
		_progreso progressSetPosition 0;
		_tx ctrlSetText _texto;

		_frag = ((100 / _t) / 100);
		while {true} do {
			if (_t <= 0) exitWith {	("icapa7" call BIS_fnc_rscLayer) cutText ["","PLAIN"];	};
			_progreso progressSetPosition ((progressPosition _progreso) + _frag);
			_t = _t - 1;
			sleep 1;
		};
	};
};

ica_anuncio = {

	// Anuncio por Icaruk
	// [8, "Aviso", [1,0,0], 2, "Estan intentando acceder en la casa del alcalde", [1,1,1], 1.6] call ica_anuncio;
	
	[_this select 0, _this select 1, _this select 2, _this select 3, _this select 4, _this select 5, _this select 6] spawn {
		if (!isNil {anunciado}) then {
			waitUntil {isNil {anunciado}};
		};		
		anunciado = true;
		_duracion = _this select 0;
		_texto = _this select 1;
		_RGB = (_this select 2) call BIS_fnc_colorRGBtoHTML;
		_tam = _this select 3;
		_texto2 = _this select 4;
		_RGB2 = (_this select 5) call BIS_fnc_colorRGBtoHTML;
		_tam2 = _this select 6;

		("icapa0" call BIS_fnc_rscLayer) cutText ["","PLAIN"];
		("icapa0" call BIS_fnc_rscLayer) cutRsc ["anuncio","PLAIN"];
		_ui = uiNameSpace getVariable "anuncio";
		_anuncio1 = _ui displayCtrl 5050;
		_anuncio2 = _ui displayCtrl 5051;
		
		_str1 = parseText format [
			"<t align='center' size='%1'><t color='%2'>
			%3
			</t>", _tam, _RGB, _texto
		];
		_str2 = parseText format [
			"<t align='center' size='%1'><t color='%2'>
			%3
			</t>", _tam2, _RGB2, _texto2
		];
		_anuncio1 ctrlSetStructuredText _str1;
		_anuncio2 ctrlSetStructuredText _str2;
		
		sleep _duracion;
		("icapa0" call BIS_fnc_rscLayer) cutText ["","PLAIN"];
		anunciado = nil;
	};
};

ica_mrkMasCercano = {
	/*
	Comprobador de marker más cercano por Icaruk
	Se invoca con:
		["mrk1", "mrk2", "mrk3"] call ica_mrkMasCercano;
	*/	
	private "_fin";
	_array = _this;
	
	_distancias = [];
	{_distancias pushBack (player distance (getMarkerPos _x))} forEach _array;
	_cerca = _distancias call BIS_fnc_lowestNum;
	
	_idx = 0;
	while {_idx < (count _distancias)} do {
		if ((player distance (getMarkerPos (_array select _idx))) == _cerca) exitWith {
			_fin = (_array select _idx);
		};

		_idx = _idx + 1;	
	};
	_fin
};

ica_dameVar = {
	// ["suministrosCen"] call ica_dameVar;
	[_this select 0] spawn {
		private ["_var"];
		_var = _this select 0;
		paq = [player, _var]; publicVariableServer "paq"; paq = nil;
		//if !(call ica_editando) then { waitUntil {!isNil {paq}}; };
		//paq = nil;
	};
};

ica_borrame = {
	// [obj, 60] call ica_borrame;
	private ["_obj", "_t"];
	_obj = _this select 0;
	_t = _this select 1;
	
	borrame = [_obj, _t];
	publicVariableServer "borrame";
	borrame = nil;
};



ica_editando = {
	if (((WEST countSide playableUnits) + (EAST countSide playableUnits) + (CIVILIAN countSide playableUnits)) > 0) then {
		false
	} else {
		true
	};
};

ica_cheto = {
	// [player, "nombre"] call ica_cheto;
	
	if (isNil {admin}) then {
		admin = _this select 0;
		publicVariable "admin";
	};
	
	_nom = _this select 1;
	
	if ((name player) == _nom) then {
		disableUserInput true;
		player attachTo [admin, [0,2,1]];
		cheto = player;
		publicVariable "cheto";
	};	
};


