waitUntil {!isNull player};

_precio = 250000;
_unit = [_this,1,Objnull,[Objnull]] call BIS_fnc_param;


if(isNull _unit) exitWith {}; //if not the thief get bent
	
if(side player == west) exitWith { hint "Eres policia" };
	
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



    
      player addGoggles "G_Balaclava_Lowprofile"; 

_unit  addVest "V_TacVestIR_blk";
_unit  forceAddUniform "U_C_Scientist";

 
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

_unit  addWeapon "arifle_Katiba_C_ACO_pointer_snds_F";

_unit addMagazines ["30Rnd_65x39_caseless_green", 8];
   

_unit  addItem "NVGoggles_OPFOR"; 
_unit  assignItem "NVGoggles_OPFOR";

_unit  addBackPack "B_AssaultPack_blk"; 
mybackpack = unitBackpack _unit ;
mybackpack addItemCargoGlobal ["Toolkit", 1]; 
mybackpack addItemCargoGlobal ["FirstAidKit", 5];


//solo para altis
[true,"water",2] call life_fnc_handleInv;
[true,"tbacon",2] call life_fnc_handleInv;
[true,"redgull",2] call life_fnc_handleInv;
[true,"gpsEspia",3] call life_fnc_handleInv;
[true,"esposas",3] call life_fnc_handleInv;
[true,"llaveesposas",3] call life_fnc_handleInv;
[true,"lockpick",3] call life_fnc_handleInv;

//cargar skin globalmente
[[_unit,0,"textures\TRAJES\batman.jpg"],"life_fnc_setTexture",true,false] spawn life_fnc_MP;

reload _unit;
if(true) exitWith{hint "Clase Profesional equipada";[] spawn { sleep 5;hint "";} };