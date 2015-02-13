#include <macro.h>
waitUntil {!isNull player};

if(side player != west) exitWith { hint "Eres policia" };

_precio = 29000;
_unit = [_this,1,Objnull,[Objnull]] call BIS_fnc_param;


if(isNull _unit) exitWith {}; //if not the thief get bent

//puede pagar?¿
 if(life_atmcash - _precio < 0) exitWith { hint "No tienes suficiente dinero";[] spawn { sleep 5;hint "";} };


 //nivel de poli
  if(playerSide != west) exitWith { hint "No eres poli!"; []spawn { sleep 5;hint "";} };
 if(__GETC__(life_coplevel) < 5) exitWith { hint "No tienes rango suficiente";[] spawn { sleep 5;hint "";}; };


//equipar clase poli
life_atmcash = life_atmcash-_precio;

_unit  addWeapon "srifle_EBR_F";
_unit  addItem "optic_Hamr";
_unit  addItem "optic_MRCO";
_unit  addItem "optic_SOS";

_unit addMagazines ["20Rnd_762x51_Mag", 12];

//solo para altis


reload _unit;
if(true) exitWith{hint "Clase Policia mk18 equipada";[] spawn { sleep 5;hint "";} };