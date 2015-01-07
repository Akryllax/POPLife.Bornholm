waitUntil {!isNull player};

_precio = 55000;
_unit = [_this,1,Objnull,[Objnull]] call BIS_fnc_param;

if(isNull _unit) exitWith {}; //if not the thief get bent

//puede pagar?¿
 if(life_cash - _precio < 0) exitWith { hint "No tienes suficiente dinero";[] spawn { sleep 5;hint "";} };

//equipar clase



life_cash = life_cash-_precio;

removeAllWeapons _unit;
removeallassigneditems _unit;
removeallcontainers _unit;
removeuniform _unit;
removevest _unit;
removebackpack _unit;

//nv

_unit addGoggles "G_Spectacles_Tinted"; 
_unit addHeadgear "H_PilotHelmetHeli_O";
_unit  addVest "V_HarnessO_brn";
_unit  forceAddUniform "U_I_pilotCoveralls";

 
_unit addWeapon 'Binocular';

_unit additem 'ItemWatch';
_unit assignItem "ItemWatch"; 
_unit addItem "ItemRadio"; 
_unit assignItem "ItemRadio"; 
_unit addItem "ItemGPS";
_unit assignItem "ItemGPS";
_unit addItem "ItemMap";
_unit assignItem "ItemMap";
_unit addItem "ItemCompass"; 
_unit assignItem "ItemCompass"; 

_unit  addWeapon "hgun_Pistol_heavy_01_F";

_unit addMagazines ["11Rnd_45ACP_Mag", 5];
   


_unit  addItem "NVGoggles_OPFOR"; 
_unit  assignItem "NVGoggles_OPFOR";

_unit  addBackPack "B_AssaultPack_cbr"; 
mybackpack = unitBackpack _unit ;
mybackpack addItemCargoGlobal ["Toolkit", 1]; 
mybackpack addItemCargoGlobal ["FirstAidKit", 2];


//solo para altis
[true,"water",2] call life_fnc_handleInv;
[true,"tbacon",2] call life_fnc_handleInv;
[true,"redgull",2] call life_fnc_handleInv;

reload _unit;
if(true) exitWith{hint "Clase Piloto equipada";[] spawn { sleep 5;hint "";} };