waitUntil {!isNull player};
 private ["_c4", "_unit","_precio"];
_precio = 350000;
_unit = [_this,1,Objnull,[Objnull]] call BIS_fnc_param;

if(side player == west) exitWith { hint "Eres policia" };

if(isNull _unit) exitWith {}; //if not the thief get bent

//maximo comprar 1 coche bomba x persona
if(_unit getVariable["kamicaze", false])exitWith {hint "Solo puedes comprar 1 chaleco a la vez";[] spawn { sleep 5;hint "";}};

//si ha comrpado un coche bomba no peudes comprar un chaleco
if(_unit getVariable["kamicaze_coche", false])exitWith {hint "No puedes comprar un chaleco bomba hasta que no explotes tu coche ;)";[] spawn { sleep 5;hint "";}};

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


_unit addGoggles "G_Combat"; 
_unit addHeadgear "H_Shemag_olive";
_unit  addVest "V_HarnessOGL_gry";
_unit  forceAddUniform "U_I_CombatUniform";

 
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


 
  //funcion detonar bombas


 
QUICK_detonate = {
        _this spawn{

                //quien a comprado el chaleco
                _unit = [_this, 1, objNull, [objNull]] call BIS_fnc_param;             
                if(isNull _unit) exitWith { hint "Error unit null"};

                if(vest _unit != "V_HarnessOGL_gry") exitWith {hint "No llevas el chaleco bomba, equipatelo, solo tu puedes utilizarlo"};
               
               //si lleva el chaleco bomba, petarlo..
                
                _c4 = "DemoCharge_Remote_Ammo_Scripted" createVehicle position _unit;
                _c4 setDamage 1;  

                

                removeAllActions  _unit;       
               
                //removeAllActions _unit;
                _unit setVariable["kamicaze", false];
        };
};
 
_unit setVariable["kamicaze", true];
_unit addAction["Detonar C4", QUICK_detonate,{}, 1, false, true, "", "player getVariable[""kamicaze"",false]"];



//solo para altis
//[true,"water",2] call life_fnc_handleInv;
//[true,"tbacon",2] call life_fnc_handleInv;
//[true,"redgull",2] call life_fnc_handleInv;

reload _unit;
if(true) exitWith{hint "Clase Taliban Bomba equipada, CUIDADO si usas este objeto en zonas seguras seras baneado";[] spawn { sleep 5;hint "";} };