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
if!(count _itemsRecompensa > 0) exitWith{ hint "Error, _itemsRecompensa is null"};

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
[_nombreRobo]spawn QUICK_fnc_robosDesactivar;

	//si a roabdo pagar al ladron

	if(_pagar_ladron == "si" and alive _ladron) then {

		    //informar al jugador
			_nombreRoboHINT = format["Has robado %1, corre antes de que te pille la policia!!",_nombreRobo];
			hint _nombreRoboHINT;

			//dar pasta
			life_cash = life_cash + _dinero;
			

			//Dar item especiales
			{
				[true,_x,2] call life_fnc_handleInv;
			} forEach _itemsRecompensa;

			//dar Armas
			if(_darArmas == "si") then {


				//crear caja de armas 
				_ammoBox = "Box_NATO_Wps_F" createVehicle position _vendedor;
 				clearMagazineCargoGlobal _ammoBox;
				clearItemCargoGlobal _ammoBox;
				clearWeaponCargoGlobal _ammoBox;

				//crear coche del jugadro que peude abrir y cerrar
				_pagar_random = random 9;
				_pagar_random = round _pagar_random;

				//ninja code fix
				if(_pagar_random == 9) then {
				   _pagar_random = 8;
				};
				if(_pagar_random == 0) then {
					//mx f
					_ammoBox addWeaponCargoGlobal ["arifle_MX_F",1];
					_ammoBox addItemCargoGlobal ["optic_Aco",1];
					_ammoBox addMagazineCargoGlobal ["30Rnd_65x39_caseless_mag",6]; 
				};
				if(_pagar_random == 1) then {
					//zafir
					_ammoBox addWeaponCargoGlobal ["LMG_Zafir_pointer_F",1];
					_ammoBox addItemCargoGlobal ["optic_Aco",1];
					_ammoBox addMagazineCargoGlobal ["150Rnd_762x51_Box",3]; 
				};
				if(_pagar_random == 2) then {
					//pdw200 silenciada
					_ammoBox addWeaponCargoGlobal ["hgun_PDW2000_Holo_snds_F",1];
					_ammoBox addItemCargoGlobal ["optic_Aco",1];
					_ammoBox addMagazineCargoGlobal ["30Rnd_9x21_Mag",6]; 
				};
				if(_pagar_random == 3) then {
					//sniper
					_ammoBox addWeaponCargoGlobal ["srifle_LRR_SOS_F",1];
					_ammoBox addItemCargoGlobal ["optic_SOS",1];
					_ammoBox addMagazineCargoGlobal ["7Rnd_408_Mag",8]; 
				};
				if(_pagar_random == 4) then {
					//mx negra
					_ammoBox addWeaponCargoGlobal ["arifle_MX_Black_F",1];
					_ammoBox addItemCargoGlobal ["optic_Aco",1];
					_ammoBox addMagazineCargoGlobal ["30Rnd_65x39_caseless_mag",6]; 
				};
				if(_pagar_random == 5) then {
					//mk18 silenciada
					_ammoBox addWeaponCargoGlobal ["srifle_EBR_DMS_F",1];
					_ammoBox addItemCargoGlobal ["muzzle_snds_B",1];
					_ammoBox addMagazineCargoGlobal ["20Rnd_762x51_Mag",6]; 
				};
				if(_pagar_random == 6) then {
					//sting
					_ammoBox addWeaponCargoGlobal ["SMG_02_ARCO_pointg_F",1];
					_ammoBox addItemCargoGlobal ["optic_Aco",1];
					_ammoBox addMagazineCargoGlobal ["30Rnd_9x21_Mag",6]; 
				};
				if(_pagar_random == 7) then {
					//vermin silenciada
					_ammoBox addWeaponCargoGlobal ["SMG_01_Holo_pointer_snds_F",1];
					_ammoBox addItemCargoGlobal ["optic_Aco",1];
					_ammoBox addMagazineCargoGlobal ["30Rnd_45ACP_Mag_SMG_01",6]; 
				};
				if(_pagar_random == 8) then {
				//mx sw negra
				_ammoBox addWeaponCargoGlobal ["arifle_MX_SW_Black_F",1];
				_ammoBox addItemCargoGlobal ["optic_Aco",1];
				_ammoBox addMagazineCargoGlobal ["100Rnd_65x39_caseless_mag_Tracer",5]; 
				};

				//tiene 30 segundos pa coger el arma
				_ammoBox spawn { sleep 30; deleteVehicle _this; }

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