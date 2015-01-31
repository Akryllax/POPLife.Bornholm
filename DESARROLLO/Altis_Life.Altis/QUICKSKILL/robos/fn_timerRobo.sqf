/*
	File: fn_timerRobo.sqf
	Author: Quickskill
	Edited: Akryllax
	Desc: wacha gona dú güen dei come for yú
*/

private ["_nombreRobo", "_time", "_metros", "_metros_cancelar_robo", "_dinero", "_pagar_ladron", "_itemsRecompensa", "_vendedor", "_ladron", "_darArmas","_darVehiculo"];

_nombreRobo =  			[_this, 0, "",[""]] call BIS_fnc_param;
_time = 				[_this, 1, -1,[-1]] call BIS_fnc_param;
_dinero = 				[_this, 2, -1,[-1]] call BIS_fnc_param;
_metros_cancelar_robo = [_this, 3, -1,[-1]] call BIS_fnc_param;
_itemsRecompensa = 		[_this, 4, [],[[]]] call BIS_fnc_param;
_vendedor = 			[_this, 5, objNull,[objNull]] call BIS_fnc_param;
_ladron = 				[_this, 6, objNull,[objNull]] call BIS_fnc_param;
_darArmas =             [_this, 7] call BIS_fnc_param;
_darVehiculo =          [_this, 8] call BIS_fnc_param;
_pagar_ladron = 		false;

//Error checking 'n shit, fucking Arma 3
if(_nombreRobo == "") exitWith{hint "Error, _nombreRobo is null";};
if(_time < 0) exitWith{ hint "Error, _time is null";};
if(isNull _vendedor) exitWith{ hint "Error, _vendedor is null"};
if(isNull _ladron) exitWith{ hint "Error, _ladron is null"};
if(_dinero < 0) exitWith{ hint "Error, _dinero is null"};
if(_metros_cancelar_robo < 0) exitWith{ hint "Error, _metros_cancelar_robo is null"};


_metros = _vendedor distance _ladron;

while {_time > 0} do {

	//mirar la distancia entre ladron i vendedor
	_metros =  _vendedor distance _ladron;

	//abandono zona de robo
	if(_metros > _metros_cancelar_robo) then{

		hintSilent format["Has abandonado la zona de robo estabas a %1m del vendedor",round (_metros)];
		_time = 0;
		_pagar_ladron = "no";
		sleep 1;

	};

	/// si muere paramos el contador
		if !(alive _ladron) then {
			_time = 0;
		};

	//mientras este dentro de rango que cuente el tiempo
	if(_metros < _metros_cancelar_robo) then{

		//contar tiempo
		_time = _time - 1;
		hintSilent format["Tiempo para robar: %1 \n Distancia: %2m (max %3m)", [((_time)/60)+.01,"HH:MM"] call BIS_fnc_timetostring,round (_metros),_metros_cancelar_robo];
		sleep 1;
		_pagar_ladron = "si";
	};

};//end while

if(_time < 1) then{

// el ladron ha terminado el robo, quitar 1 ladron del robo
//[_nombreRobo]spawn QUICK_fnc_robosDesactivar;

	//si a roabdo pagar al ladron

	if(_pagar_ladron == "si" and alive _ladron) then {

		    //informar al jugador
			_nombreRoboHINT = format["Has robado %1, corre antes de que te pille la policia!!",_nombreRobo];
			hint _nombreRoboHINT;

			//dar pasta
			life_cash = life_cash + _dinero;


			//Dar item especiales
			if(_itemsRecompensa!=[])then {
				{
					[true,_x,2] call life_fnc_handleInv;
				} forEach _itemsRecompensa;

			};

			//dar Armas
			if(_darArmas == "si") then {


				//crear caja de armas
				_ammoBox = "Box_NATO_Wps_F" createVehicle position _vendedor;
 				clearMagazineCargoGlobal _ammoBox;
				clearItemCargoGlobal _ammoBox;
				clearWeaponCargoGlobal _ammoBox;

				//crear coche del jugadro que peude abrir y cerrar
				_pagar_random = random 97;
				_pagar_random = round _pagar_random;

				//ninja code fix
				if(_pagar_random == 97) then {
				   _pagar_random = 96;
				};
				if(_pagar_random >= 0 && _pagar_random <=19) then {
					//TRG 21 %20
					_ammoBox addWeaponCargoGlobal ["arifle_TRG21_F",1];
					_ammoBox addItemCargoGlobal ["optic_Aco",1];
					_ammoBox addMagazineCargoGlobal ["30Rnd_556x45_Stanag",6];
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
				_ammoBox spawn { sleep 60; deleteVehicle _this; }

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
					_coche = "C_Hatchback_01_sport_F" createVehicle position _vendedor;
					life_vehicles pushBack _coche;
					[[_coche,"vehicle_info_owners",[[getPlayerUID _ladron,profileName]],true],"TON_fnc_setObjVar",false,false] spawn life_fnc_MP;
				};
				if(_pagar_random == 1) then {
					//sport tunning
					_coche = "C_Offroad_01_F" createVehicle position _vendedor;
					life_vehicles pushBack _coche;
					[[_coche,"vehicle_info_owners",[[getPlayerUID _ladron,profileName]],true],"TON_fnc_setObjVar",false,false] spawn life_fnc_MP;
				};
				if(_pagar_random == 2) then {
					//pickup rebelde
					_coche = "B_G_Offroad_01_F" createVehicle position _vendedor;
					life_vehicles pushBack _coche;
					[[_coche,"vehicle_info_owners",[[getPlayerUID _ladron,profileName]],true],"TON_fnc_setObjVar",false,false] spawn life_fnc_MP;
				};
				if(_pagar_random == 3) then {
					//artillada
					_coche = "B_G_Offroad_01_armed_F" createVehicle position _vendedor;
					life_vehicles pushBack _coche;
					[[_coche,"vehicle_info_owners",[[getPlayerUID _ladron,profileName]],true],"TON_fnc_setObjVar",false,false] spawn life_fnc_MP;
				};

				if(_pagar_random == 4) then {
					//camion
					_coche = "C_Van_01_box_F" createVehicle position _vendedor;
					life_vehicles pushBack _coche;
					[[_coche,"vehicle_info_owners",[[getPlayerUID _ladron,profileName]],true],"TON_fnc_setObjVar",false,false] spawn life_fnc_MP;
				};
				if(_pagar_random == 5) then {
					//quad
					_coche = "B_Quadbike_01_F" createVehicle position _vendedor;
					life_vehicles pushBack _coche;
					[[_coche,"vehicle_info_owners",[[getPlayerUID _ladron,profileName]],true],"TON_fnc_setObjVar",false,false] spawn life_fnc_MP;
				};


			};//end dar vehiculo


	};//end pagar ladron

	//terminar script
	if(true) exitWith{[]spawn { sleep 3;hint "";} };

};