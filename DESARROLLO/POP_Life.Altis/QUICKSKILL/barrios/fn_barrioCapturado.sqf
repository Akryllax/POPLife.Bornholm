/*
	File: fn_barrioCapturado.sqf
	Author: Quickskill


*/

private ["_barrioBandera", "_jugador", "_barrioMetros", "_marcador", "_dinero", "_darArmas",  "_darVehiculo", "_pagar_ladron","_time","_metros"];

_barrioBandera =	[_this, 0, objNull, [objNull]] call BIS_fnc_param;
_jugador =			[_this, 1, objNull, [objNull]] call BIS_fnc_param;
_barrioMetros =		[_this, 2, -1, [-1]] call BIS_fnc_param;
_marcador =			[_this, 3, "", [""]] call BIS_fnc_param;
_banda =      		[_this, 4, grpNull, [grpNull]] call BIS_fnc_param;
_dinero =			0;
_darArmas =			false;
_darVehiculo =		false;
_pagar_ladron =		false;
_time =				60;

//Error checking 'n shit, fucking Arma 3
if(_time < 0) exitWith{ hint "Error, _time is null";};
if(isNull _barrioBandera) exitWith{ hint "Error, _barrioBandera is null"};
if(isNull _jugador) exitWith{ hint "Error, _jugador is null"};
if(_dinero != 0) exitWith{ hint "Error, _dinero debe empezar a 0"};

_metros = _barrioBandera distance _jugador;

if(_barrioMetros < 0) exitWith { hint "Error, _barrioMetros < 0"};

_oldOwner = _barrioBandera getVariable["capturadoPor", "sinDueño"];

if !(_oldOwner isEqualTo _banda getVariable ["gang_name"]) exitWith {}; //Los dueños no son iguales a la banda del jugador... LOL?

//Empecemos con el contador ;)

_timestamp = time;
_darPremio = true;

while (_timestamp + _time > time) do {
	_actualOwner = _barrioBandera getVariable ["capturadoPor", ""];
	_metros =  _barrioBandera distance _jugador;

	if(_oldOwner != _actualOwner) exitWith {
		hint "Has perdido control del barrio";
		_pagar_ladron = false;
		_darPremio = false;
		sleep 1;
	};

	//Abandono zona de robo
	if(_metros > _barrioMetros) then{

		hint "Has abandonado el barrio, y has perdido su control";
		_barrioBandera setVariable["capturadoPor","",true];
		_pagar_ladron = false;
		_darPremio = false;
		sleep 1;
	};

	//Si muere paramos el contador
		if !(alive _jugador) then {
			_darPremio = false;
		};

	//mientras este dentro de rango que cuente el tiempo
	if(_metros < _barrioMetros && _darPremio) then{
		hintSilent format["Tiempo para recompensa: %1 \n Distancia: %2m (max %3m)", [(_timestamp + _time) - time,"HH:MM"] call BIS_fnc_timetostring,round (_metros),_barrioMetros];
		_darPremio = true;
		_pagar_ladron = true;
	};

	_oldOwner = getVariable["capturadoPor", ""];
};

if(!_pagar_ladron || !alive player || _darPremio)then{
	hint "Has perdido el control del barrio";
	_barrioBandera setVariable["capturadoPor","",true];

	deleteMarker _marcador;
};

if(_pagar_ladron && alive _jugador) then {
	//random para dar alguna cosita a la banda! :)

	_randomRecompensa = round random 6;

	if(_randomRecompensa <= 1) then{
		//damos armas
		_darArmas = true;
		
		//informar al jugador
		_nombreRoboHINT = "Recompensa obtenida!!Ves a la bandera a recogerlo";
		hint _nombreRoboHINT;
	};

		
   if(_randomRecompensa == 3) then{
		//damos dinero
		_dinero = 100000 + round random 200000;
		life_cash = life_cash + _dinero;
		//informar al jugador
		_nombreRoboHINT = format ["Has obtenido %1 de la venta de drogas en el barrio",_dinero];
		hint _nombreRoboHINT;
	};


	//dar pasta

	if(_randomRecompensa >= 4 && _randomRecompensa <= 5) then{
		//damos coche
		_darVehiculo = true;
		//informar al jugador
		_nombreRoboHINT = "Recompensa obtenida!!Ves a la bandera a recogerlo";
		hint _nombreRoboHINT;
	};			

	//dar Armas
	if(_darArmas) then {
		//crear caja de armas
		_ammoBox = "Box_NATO_Wps_F" createVehicle position _barrioBandera;
		clearMagazineCargoGlobal _ammoBox;
		clearItemCargoGlobal _ammoBox;
		clearWeaponCargoGlobal _ammoBox;
		
		_pagar_random = floor (random 97);
		_pagar_random = round _pagar_random;

		if(_pagar_random >= 0 && _pagar_random <=19) then {
			//TRG 21 %20
			_ammoBox addWeaponCargoGlobal ["arifle_TRG21_F",2];
			_ammoBox addItemCargoGlobal ["optic_Aco",1];
			_ammoBox addMagazineCargoGlobal ["30Rnd_556x45_Stanag",12];
		};
		if(_pagar_random >= 20 && _pagar_random <=39) then {
			//MK20 Camo %20
			_ammoBox addWeaponCargoGlobal ["arifle_Mk20_F",3];
			_ammoBox addItemCargoGlobal ["optic_Aco",2];
			_ammoBox addMagazineCargoGlobal ["30Rnd_556x45_Stanag",8];
		};
		 if(_pagar_random >= 40 && _pagar_random <=49) then {
			//Katiba %10
			_ammoBox addWeaponCargoGlobal ["arifle_Katiba_F",2];
			_ammoBox addItemCargoGlobal ["optic_Aco",2];
			_ammoBox addMagazineCargoGlobal ["30Rnd_65x39_caseless_green",8];
		};
		if(_pagar_random >= 50 && _pagar_random <=59) then {
			//mx_SW %10
			_ammoBox addWeaponCargoGlobal ["arifle_MX_SW_F",1];
			_ammoBox addItemCargoGlobal ["optic_Arco",3];
			_ammoBox addMagazineCargoGlobal ["100Rnd_65x39_caseless_mag",4];
		};
		if(_pagar_random >= 60 && _pagar_random <=69) then {
			//MK 18 %10
			_ammoBox addWeaponCargoGlobal ["srifle_EBR_F",3];
			_ammoBox addItemCargoGlobal ["optic_DMS",1];
			_ammoBox addMagazineCargoGlobal ["20Rnd_762x51_Mag",15];
		};
		if(_pagar_random >= 70 && _pagar_random <=76) then {
			//mk200 %7
			_ammoBox addWeaponCargoGlobal ["LMG_Mk200_F",1];
			_ammoBox addItemCargoGlobal ["optic_Aco",1];
			_ammoBox addMagazineCargoGlobal ["200Rnd_65x39_cased_Box_Tracer",2];
		};
		if(_pagar_random >= 77 && _pagar_random <=83) then {
			//Zafir %7
			_ammoBox addWeaponCargoGlobal ["LMG_Zafir_F",1];
			_ammoBox addItemCargoGlobal ["optic_Aco",1];
			_ammoBox addMagazineCargoGlobal ["150Rnd_762x51_Box_Tracer",3];
		};
		if(_pagar_random >= 84 && _pagar_random <=88) then {
			//GM6 Lynx %5
			_ammoBox addWeaponCargoGlobal ["srifle_GM6_CAMO_F",1];
			_ammoBox addItemCargoGlobal ["optic_SOS",1];
			_ammoBox addMagazineCargoGlobal ["5Rnd_127x108_Mag",5];
		};
		if(_pagar_random >= 89 && _pagar_random <=93) then {
		// M320 LRR %5
			_ammoBox addWeaponCargoGlobal ["srifle_LRR_CAMO_F",1];
			_ammoBox addItemCargoGlobal ["optic_SOS",1];
			_ammoBox addMagazineCargoGlobal ["7Rnd_408_Mag",5];
		};
		if(_pagar_random >= 94 && _pagar_random <=96) then {
		//RPG-42 Alamut %3
			_ammoBox addWeaponCargoGlobal ["launch_RPG32_F",1];
			_ammoBox addItemCargoGlobal ["optic_NVS",1];
			_ammoBox addMagazineCargoGlobal ["RPG32_HE_F",3];
		};
		//tiene 60 segundos pa coger el arma
		_ammoBox spawn { sleep 120; deleteVehicle _this; }

	};//end dar armas

	//dar vehiculos
	if(_darVehiculo) then {

		//crear coche del jugadro que peude abrir errar y vender
		_pagar_random = random 6;
		_pagar_random = round _pagar_random;

		//ninja code fix
		if(_pagar_random == 6) then {
		   _pagar_random = 5;
		};

		if(_pagar_random == 0) then {
			//turismo rapido
			_coche = "C_Hatchback_01_sport_F" createVehicle position _barrioBandera;
			life_vehicles pushBack _coche;
			[[_coche,"vehicle_info_owners",[[getPlayerUID _jugador,profileName]],true],"TON_fnc_setObjVar",false,false] spawn life_fnc_MP;
		};
		if(_pagar_random == 1) then {
			//sport tunning
			_coche = "C_Offroad_01_F" createVehicle position _barrioBandera;
			life_vehicles pushBack _coche;
			[[_coche,"vehicle_info_owners",[[getPlayerUID _jugador,profileName]],true],"TON_fnc_setObjVar",false,false] spawn life_fnc_MP;
		};
		if(_pagar_random == 2) then {
			//pickup rebelde
			_coche = "B_G_Offroad_01_F" createVehicle position _barrioBandera;
			life_vehicles pushBack _coche;
			[[_coche,"vehicle_info_owners",[[getPlayerUID _jugador,profileName]],true],"TON_fnc_setObjVar",false,false] spawn life_fnc_MP;
		};
		if(_pagar_random == 3) then {
			//artillada
			_coche = "B_G_Offroad_01_armed_F" createVehicle position _barrioBandera;
			life_vehicles pushBack _coche;
			[[_coche,"vehicle_info_owners",[[getPlayerUID _jugador,profileName]],true],"TON_fnc_setObjVar",false,false] spawn life_fnc_MP;
		};

		if(_pagar_random == 4) then {
			//camion
			_coche = "C_Van_01_box_F" createVehicle position _barrioBandera;
			life_vehicles pushBack _coche;
			[[_coche,"vehicle_info_owners",[[getPlayerUID _jugador,profileName]],true],"TON_fnc_setObjVar",false,false] spawn life_fnc_MP;
		};
		if(_pagar_random == 5) then {
			//quad
			_coche = "B_Quadbike_01_F" createVehicle position _barrioBandera;
			life_vehicles pushBack _coche;
			[[_coche,"vehicle_info_owners",[[getPlayerUID _jugador,profileName]],true],"TON_fnc_setObjVar",false,false] spawn life_fnc_MP;
		};


	};//end dar vehiculo

	 sleep 3;
	[_barrioBandera,_jugador,_barrioMetros,_marcador] spawn QUICK_fnc_barrioCapturado;
};//end pagar ladron



//terminar script
if(true) exitWith{[]spawn { sleep 3;hint "";} };