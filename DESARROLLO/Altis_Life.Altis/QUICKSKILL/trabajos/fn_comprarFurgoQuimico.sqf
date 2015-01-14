///comprar camion pa hacer drogas!! by quickskill para plata o plomo
waitUntil {!isNull player};

_precio = 1000000;
_unit = [_this,1,Objnull,[Objnull]] call BIS_fnc_param;
_vendedor = [_this,1,Objnull,[Objnull]] call BIS_fnc_param;

if(isNull _unit) exitWith {}; //if not the thief get bent

//puede pagar?¿
 if(life_cash - _precio < 0) exitWith { hint "No tienes suficiente dinero";[] spawn { sleep 5;hint "";} };

life_cash = life_cash-_precio;

//crear coche
_coche = "O_Truck_02_covered_F" createVehicle position _vendedor;

//cargar skin globalmente
[[_coche,0,"QUICKSKILL\trabajos\badback.paa"],"life_fnc_setTexture",true,false] spawn life_fnc_MP;
//cargar skin globalmente
[[_coche,1,"QUICKSKILL\trabajos\badfront.paa"],"life_fnc_setTexture",true,false] spawn life_fnc_MP;

//deorar furgo
_carga =  "Land_runway_edgelight_blue_F" createVehicle position _vendedor;
_carga attachTo [_coche, [0, 1, 0] ];
_carga enableSimulation false;

_carga =  "Land_spp_Panel_F" createVehicle position _vendedor;
_carga attachTo [_coche, [0, 1, 0] ];
_carga enableSimulation false;
 
//añadir action de cocinar 
_furgo addAction["Coinar Meta", QUICK_fnc_cocinarMeta,_coche];


if(true) exitWith{hint "Has comprado un camion laboratorio!!";[] spawn { sleep 5;hint "";} };