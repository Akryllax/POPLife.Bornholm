waitUntil {!isNull player};
 private ["_c4", "_unit","_precio"];
_precio = 550000;
_unit = [_this,1,Objnull,[Objnull]] call BIS_fnc_param;
_vendedor = [_this,1,Objnull,[Objnull]] call BIS_fnc_param;

if(side player == west) exitWith { hint "Eres policia" };

if(isNull _unit) exitWith {}; //if not the thief get bent

//maximo comprar 1 coche bomba x persona
if(_unit getVariable["kamicaze_coche", false])exitWith {hint "Solo puedes comprar 1 coche bomba a la vez";[] spawn { sleep 5;hint "";}};

//si ha comrpado un chaleco bobma no peude llevar el coche
if(_unit getVariable["kamicaze", false])exitWith {hint "No puedes comprar un coche bomba hasta que no hayas explotado tu chaleco bomba ;)";[] spawn { sleep 5;hint "";}};

//puede pagar?¿
 if(life_cash - _precio < 0) exitWith { hint "No tienes suficiente dinero";[] spawn { sleep 5;hint "";} };

//equipar clase



life_cash = life_cash-_precio;

//crear coche
_coche = "C_Hatchback_01_sport_F" createVehicle position _vendedor;
_carga =  "Land_SatellitePhone_F" createVehicle position _vendedor;
_carga attachTo [_coche, [0, -0.7, -0.3] ];

_carga =  "Box_NATO_Grenades_F" createVehicle position _vendedor;
_carga attachTo [_coche, [-0.5, -1, -0.5] ];
clearMagazineCargoGlobal _carga;
clearItemCargoGlobal _carga;
clearWeaponCargoGlobal _carga;

_carga =  "Box_NATO_Grenades_F" createVehicle position _vendedor;
_carga attachTo [_coche, [0.5, -1, -0.5] ];
clearMagazineCargoGlobal _carga;
clearItemCargoGlobal _carga;
clearWeaponCargoGlobal _carga;


 
 



   //funcion detonar bombas
QUICK_detonate = {
        _this spawn{

                _unit = [_this, 1, objNull, [objNull]] call BIS_fnc_param; 
                _coche =   [_this, 3, objNull, [objNull]] call BIS_fnc_param; 

                //elimina objetos extra

                { detach _x; deleteVehicle _x; } forEach attachedObjects _coche;

                _c4 = "DemoCharge_Remote_Ammo_Scripted" createVehicle position _coche;
                _c4 setDamage 1;  
               
                removeAllActions _unit ; 
               
                _unit setVariable["kamicaze_coche", false];
        };
};
 
_unit setVariable["kamicaze_coche", true];
_unit addAction["Detonar Coche Bomba", QUICK_detonate, _coche, 1, false, true, "", "player getVariable[""kamicaze_coche"",false]"];






reload _unit;
if(true) exitWith{hint "Coche bomba comprado! a liarla!!";[] spawn { sleep 5;hint "";} };