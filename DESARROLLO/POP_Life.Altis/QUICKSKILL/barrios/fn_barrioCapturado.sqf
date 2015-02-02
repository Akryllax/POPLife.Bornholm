/*

	Author: Quickskill


*/

private ["_barrioBandera", "_jugador", "_barrioMetros", "_marcador", "_dinero", "_darArmas",  "_darVehiculo", "_pagar_ladron","_time","_metros"];

_barrioBandera =  		_this select 0;
_jugador = 				_this select 1;
_barrioMetros = 		_this select 2;
_marcador =             _this select 3;
_dinero = 				0;
_darArmas =             "no";
_darVehiculo =          "no";
_pagar_ladron = 		false;
_time = 				600;
_metros = 				_barrioBandera distance _jugador;

//Error checking 'n shit, fucking Arma 3
if(_time < 0) exitWith{ hint "Error, _time is null";};
if(isNull _barrioBandera) exitWith{ hint "Error, _barrioBandera is null"};
if(isNull _jugador) exitWith{ hint "Error, _jugador is null"};
if(_dinero != 0) exitWith{ hint "Error, _dinero debe empezar a 0"};
if(_barrioMetros < 0) exitWith{ hint "Error, _barrioMetros < 0"};




while {_time > 0} do {

	//mirar la distancia entre ladron i vendedor
	_metros =  _barrioBandera distance _jugador;

	//abandono zona de robo
	if(_metros > _barrioBandera) then{

		hintSilent format["Has abandonado el barrio estabas a %1m del barrio",round (_metros)];
		_barrioBandera setVariable["capturadoPor","",true];
		_time = 0;
		_pagar_ladron = "no";
		sleep 1;

	};

	/// si muere paramos el contador
		if !(alive _jugador) then {
			_time = 0;
		};

	//mientras este dentro de rango que cuente el tiempo
	if(_metros < _metros_cancelar_robo) then{

		//contar tiempo
		_time = _time - 1;
		hintSilent format["Tiempo para recompensa: %1 \n Distancia: %2m (max %3m)", [((_time)/60)+.01,"HH:MM"] call BIS_fnc_timetostring,round (_metros),_barrioMetros];
		sleep 1;
		_pagar_ladron = "si";
	};

};//end while



if(_time < 1) then{

	if(_pagar_ladron == "no" || !alive player)then{

		hint "Has perdido el control del barrio";
		_barrioBandera setVariable["capturadoPor","",true];

		deleteMarker _marcador ;
	};


	//si a roabdo pagar al ladron

	if(_pagar_ladron == "si" and alive _ladron) then {

		    //informar al jugador
			_nombreRoboHINT = "Recompensa obtenida!!Vez a la bandera a recogerlo";
			hint _nombreRoboHINT;

			//random para dar alguna cosita a la banda! :)

			_randomRecompensa = round random 5;

			if(_randomRecompensa == 0 || _randomRecompensa == 1) then{
				//damos armas
				_darArmas = "si";

			};

				
	       if(_randomRecompensa == 3) then{
				//damos dinero
			life_cash = life_cash + _dinero;
			};


			//dar pasta

			if(_randomRecompensa == 4 || _randomRecompensa == 5) then{
				//damos coche
			    _darVehiculo == "si"
			};			


		
			//dar Armas
			if(_darArmas == "si") then {


				//crear caja de armas
				_ammoBox = "Box_NATO_Wps_F" createVehicle position _barrioBandera;
 				clearMagazineCargoGlobal _ammoBox;
				clearItemCargoGlobal _ammoBox;
				clearWeaponCargoGlobal _ammoBox;

				
				_pagar_random = random 97;
				_pagar_random = round _pagar_random;

				//ninja code fix
				if(_pagar_random == 97) then {
				   _pagar_random = 96;
				};
				if(_pagar_random >= 0 && _pagar_random <=19) then {
					//TRG 21 %20
					_ammoBox addWeaponCargoGlobal ["arifle_TRG21_F",2];
					_ammoBox addItemCargoGlobal ["optic_Aco",1];
					_ammoBox addMagazineCargoGlobal ["30Rnd_556x45_Stanag",12];
				};
				if(_pagar_random >= 20 && _pagar_random <=39) then {
					//MK20 Camo %20
					_ammoBox addWeaponCargoGlobal ["arifle_Mk20_F",1];
					_ammoBox addItemCargoGlobal ["optic_Aco",1];
					_ammoBox addMagazineCargoGlobal ["30Rnd_556x45_Stanag",5];
				};
				 if(_pagar_random >= 40 && _pagar_random <=49) then {
					//Katiba %10
					_ammoBox addWeaponCargoGlobal ["arifle_Katiba_F",1];
					_ammoBox addItemCargoGlobal ["optic_Aco",1];
					_ammoBox addMagazineCargoGlobal ["30Rnd_65x39_caseless_green",5];
				};
				if(_pagar_random >= 50 && _pagar_random <=59) then {
				    //mx_SW %10
					_ammoBox addWeaponCargoGlobal ["arifle_MX_SW_F",1];
					_ammoBox addItemCargoGlobal ["optic_Arco",1];
					_ammoBox addMagazineCargoGlobal ["100Rnd_65x39_caseless_mag",2];
				};
				if(_pagar_random >= 60 && _pagar_random <=69) then {
					//MK 18 %10
				    _ammoBox addWeaponCargoGlobal ["srifle_EBR_F",1];
				    _ammoBox addItemCargoGlobal ["optic_DMS",1];
				    _ammoBox addMagazineCargoGlobal ["20Rnd_762x51_Mag",5];
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
			if(_darVehiculo == "si") then {

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

			//reiniciar counter recompensas
					
		[_barrioBandera,_jugador,_barrioMetros,_marcador] spawn QUICK_fnc_barrioCapturado;


	};//end pagar ladron

	

	//terminar script
	if(true) exitWith{[]spawn { sleep 3;hint "";} };

};