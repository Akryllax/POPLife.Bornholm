waitUntil {!isNull player};

_precio = 100000;
_unit = [_this,1,Objnull,[Objnull]] call BIS_fnc_param;


if(isNull _unit) exitWith {}; //if not the thief get bent
	
//puede pagar?¿
 if(life_cash - _precio < 0) exitWith { hint "No tienes suficiente dinero";[] spawn { sleep 5;hint "";} };


 //nivel de poli
 if(__GETC__(life_coplevel) < 1) exitWith { hint "No eres poli";[] spawn { sleep 5;hint "";} };


//equipar clase poli
life_cash = life_cash-_precio;

_unit  addWeapon "SMG_02_ARCO_pointg_F";

_unit addMagazines ["30Rnd_9x21_Mag", 8];
   
//solo para altis
[true,"water",2] call life_fnc_handleInv;
[true,"tbacon",2] call life_fnc_handleInv;
[true,"redgull",2] call life_fnc_handleInv;

reload _unit;
if(true) exitWith{hint "Clase Policia Sting equipada";[] spawn { sleep 5;hint "";} };