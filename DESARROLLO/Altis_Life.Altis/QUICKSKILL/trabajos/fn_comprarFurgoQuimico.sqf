///comprar camion pa hacer drogas!! by quickskill para plata o plomo
waitUntil {!isNull player};

_precio = 350000;
_unit = [_this,1,Objnull,[Objnull]] call BIS_fnc_param;
_vendedor = [_this,1,Objnull,[Objnull]] call BIS_fnc_param;

if(isNull _unit) exitWith {}; //if not the thief get bent

//puede pagar?¿
 if(life_cash - _precio < 0) exitWith { hint "No tienes suficiente dinero";[] spawn { sleep 5;hint "";} };

life_cash = life_cash-_precio;

//crear coche
_vendedor = player;
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

[] spawn { 

sleep 5;
hint "";
//pa que se lo goze
sleep 300;
[[_coche,1,"QUICKSKILL\trabajos\badback.paa"],"life_fnc_setTexture",true,false] spawn life_fnc_MP;
[[_coche,0,"QUICKSKILL\trabajos\badfront.paa"],"life_fnc_setTexture",true,false] spawn life_fnc_MP;
sleep 300;
//pa que se lo goze
[[_coche,1,"QUICKSKILL\trabajos\badback.paa"],"life_fnc_setTexture",true,false] spawn life_fnc_MP;
[[_coche,0,"QUICKSKILL\trabajos\badfront.paa"],"life_fnc_setTexture",true,false] spawn life_fnc_MP;
//eliminar decoraciones pk me sale del nabo
deleteVehicle _carga1;
deleteVehicle _carga2;
deleteVehicle _carga3;

}



//cargar skin globalmente

//cargar skin globalmente


//deorar furgo



//añadir action de cocinar 


if(true) exitWith{};