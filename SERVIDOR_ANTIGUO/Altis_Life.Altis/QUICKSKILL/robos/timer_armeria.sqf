private "_time";
private "_vendedor";
private "_ladron";
private "_metros";
private "_metros_cancelar_robo";
private "_dinero";
private "_pagar_ladron";

_time = _this select 0;
_vendedor = _this select 1;
_ladron = _this select 2;
_metros =  _vendedor distance _ladron;
_metros_cancelar_robo = _this select 3;
_dinero = _this select 4;
_pagar_ladron = "no";

while {_time > 0} do {

	//hay un robo!! avisar a la poli
	//[{hint "Estan robando la armeria de Kavala!!"}], "BIS_fnc_spawn", west, false] call BIS_fnc_MP;

	

	//mirar la distancia entre ladron i vendedor
	_metros =  _vendedor distance _ladron;

	//abandono zona de robo

	if(_metros > _metros_cancelar_robo) then{
		
	
hintSilent format["Has abandonado la zona de robo estabas a %1m del vendedor",round (_metros)];
_time = 0;
_pagar_ladron = "no";
sleep 1;

};


/// si muere no le pagamos

if !(alive _ladron) then {

_time = 0;


};
    	


	if(_metros < _metros_cancelar_robo) then{
		
	
//contar tiempo
	_time = _time - 1;  
	hintSilent format["Tiempo para robar: %1 \n Distancia: %2m (max %3m)", [((_time)/60)+.01,"HH:MM"] call BIS_fnc_timetostring,round (_metros),_metros_cancelar_robo];	
	sleep 1;
	_pagar_ladron = "si";



};
    		



	
		
};

if(_time < 1) then{

	//si a roabdo pagar al ladron

	if(_pagar_ladron == "si" and alive _ladron) then {

		//pagar al jugador

		//dar pasta
life_cash = life_cash + _dinero;



[]spawn{sleep 2;hint format["Has robado 1 caja de armas",_this select 0];sleep 3;hint ""};


//crear caja de armas 
_ammoBox = "Box_NATO_Wps_F" createVehicle position _vendedor;

 clearMagazineCargoGlobal _ammoBox;

clearItemCargoGlobal _ammoBox;

clearWeaponCargoGlobal _ammoBox;




//crear coche del jugadro que peude abrir y cerrar
_pagar_random = random 9;
_pagar_random = round _pagar_random;
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
_ammoBox addMagazineCargoGlobal ["20Rnd_762x51_Mag ",6]; 
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

	

    


	};



//terminar script
	
if(true) exitWith{[]spawn { sleep 1;hint "";} };

};