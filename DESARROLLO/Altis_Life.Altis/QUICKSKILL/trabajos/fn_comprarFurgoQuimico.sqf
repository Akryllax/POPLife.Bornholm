///comprar camion pa hacer drogas!! by quickskill para plata o plomo
waitUntil {!isNull player};
private["_coche"]
_precio = 350000;
_unit = [_this,1,Objnull,[Objnull]] call BIS_fnc_param;
_vendedor = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;

if(isNull _unit) exitWith {}; //if not the thief get bent

//puede pagar?¿
 if(life_cash - _precio < 0) exitWith { hint "No tienes suficiente dinero";[] spawn { sleep 5;hint "";} };

life_cash = life_cash-_precio;

//crear coche
[] spawn { 

_coche = "O_Truck_02_box_F" createVehicle position _vendedor;
[[_coche,1,"QUICKSKILL\trabajos\badback.paa"],"life_fnc_setTexture",true,false] spawn life_fnc_MP;
[[_coche,0,"QUICKSKILL\trabajos\badfront.paa"],"life_fnc_setTexture",true,false] spawn life_fnc_MP;
_carga1 =  "Land_runway_edgelight_blue_F" createVehicle position _vendedor;
_carga1 attachTo [_coche, [0, 2, 0.6] ];
_carga1 enableSimulation false;
_carga2 =  "Land_runway_edgelight_blue_F" createVehicle position _vendedor;
_carga2 attachTo [_coche, [0.7, 2, 0.6] ];
_carga2 enableSimulation false;
_carga3 =  "Land_runway_edgelight_blue_F" createVehicle position _vendedor;
_carga3 attachTo [_coche, [-0.7, 2, 0.6] ];
_carga3 enableSimulation false;

_coche addAction["Cocinar Meta", QUICK_fnc_cocinarMeta,_coche];

hint "Has comprado un camion laboratorio!!";
sleep 3;
hint "";

sleep 300;
[[_coche,1,"QUICKSKILL\trabajos\badback.paa"],"life_fnc_setTexture",true,false] spawn life_fnc_MP;
[[_coche,0,"QUICKSKILL\trabajos\badfront.paa"],"life_fnc_setTexture",true,false] spawn life_fnc_MP;

sleep 300;

[[_coche,1,"QUICKSKILL\trabajos\badback.paa"],"life_fnc_setTexture",true,false] spawn life_fnc_MP;
[[_coche,0,"QUICKSKILL\trabajos\badfront.paa"],"life_fnc_setTexture",true,false] spawn life_fnc_MP;


deleteVehicle _carga1;
deleteVehicle _carga2;
deleteVehicle _carga3;

};