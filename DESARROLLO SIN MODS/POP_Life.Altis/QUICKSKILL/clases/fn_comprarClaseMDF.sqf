waitUntil {!isNull player};
_listaMDF = [76561198020910545,76561198051671161,76561198061075269,76561198131927453,76561198132364470,76561198102538451,76561198096995213,76561198040480128,76561198147074169,76561197987947084,76561197991209058,76561198110565897,76561197960590442,76561197960701693,76561197967296882,76561198002003872,76561198011237244,76561198012863609,76561198012897075,76561198045586900,76561198123460176,76561198153325390,76561198004202201];
_precio = 160000;
_unit = [_this,1,Objnull,[Objnull]] call BIS_fnc_param;

if(side player == west) exitWith { hint "Eres policia" };

if(isNull _unit) exitWith {}; 

if(_bando == civilian) then {
	switch(_uni) do {	  

           case "U_I_CombatUniform": {
           	
           	if (!((getPlayerUID player) in _listaMDF)) exitWith { hint "No eres MDF habla con Mare";[] spawn { sleep 5;hint "";} };

        };
    };
};


 if(life_cash - _precio < 0) exitWith { hint "No tienes suficiente dinero";[] spawn { sleep 5;hint "";} };



life_cash = life_cash-_precio;


removeAllWeapons _unit;
removeallassigneditems _unit;
removeallcontainers _unit;
removeuniform _unit;
removevest _unit;
removebackpack _unit;




_unit addHeadgear "H_PilotHelmetHeli_B";
_unit addGoggles "G_Balaclava_Lowprofile";

_unit  addVest "V_TacVest_blk";
_unit  forceAddUniform "U_I_CombatUniform";
_unit setObjectTextureGlobal [0, "textures\TRAJES\MDF.jpg"];
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

_unit  addItem "NVGoggles_OPFOR";
_unit  assignItem "NVGoggles_OPFOR";
reload _unit;

_unit  addBackPack "B_Carryall_mcamo"; 
mybackpack = unitBackpack _unit ;
[[mybackpack,0,"#(rgb,8,8,3)color(0,0,0,1)"],"life_fnc_setTexture",true,false] spawn life_fnc_MP;
mybackpack addItemCargoGlobal ["Toolkit", 1]; 
mybackpack addItemCargoGlobal ["FirstAidKit", 3];

 player setObjectTextureGlobal [0, "textures\TRAJES\MDF.jpg"];


_unit  addItem "optic_DMS";
_unit  addItem "optic_NVS";
_unit  addItem "optic_Hamr";

_unit addMagazines ["20Rnd_762x51_Mag", 12];


[true,"tbacon",2] call life_fnc_handleInv;
[true,"redgull",2] call life_fnc_handleInv;

[true,"esposas",4] call life_fnc_handleInv;
[true,"llaveesposas",4] call life_fnc_handleInv;
[true,"lockpick",6] call life_fnc_handleInv;
[true,"murallaSacosPequeña",1] call life_fnc_handleInv;

if(true) exitWith{hint "Clase MDF equipada";[] spawn { sleep 5;hint "";} };