#include <macro.h>
waitUntil {!isNull player};

_precio = 8000;
_unit = [_this,1,Objnull,[Objnull]] call BIS_fnc_param;


if(isNull _unit) exitWith {}; //if not the thief get bent

//puede pagar?¿
 if(life_atmcash - _precio < 0) exitWith { hint "No tienes suficiente dinero";[] spawn { sleep 5;hint "";} };


 //nivel de poli
  if(playerSide != west) exitWith { hint "No eres poli!"; []spawn { sleep 5;hint "";} };
 if(__GETC__(life_coplevel) < 1) exitWith { hint "No tienes rango suficiente";[] spawn { sleep 5;hint "";} };


//equipar clase poli
life_atmcash = life_atmcash-_precio;

_unit  addWeapon "SMG_02_ACO_F";

_unit addMagazines ["30Rnd_9x21_Mag", 12];

//solo para altis


reload _unit;
if(true) exitWith{hint "Clase Policia Sting equipada";[] spawn { sleep 5;hint "";} };