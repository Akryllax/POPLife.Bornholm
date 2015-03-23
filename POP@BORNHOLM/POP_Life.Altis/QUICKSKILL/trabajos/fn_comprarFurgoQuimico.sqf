///comprar camion pa hacer drogas!! by quickskill para plata o plomo
waitUntil {!isNull player};
private["_coche"];
_precio = 50000;
_unit = [_this,1,Objnull,[Objnull]] call BIS_fnc_param;
_vendedor = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;

if(isNull _unit) exitWith {}; //if not the thief get bent

//puede pagar?¿
 if(life_popeur - _precio < 0) exitWith { hint "No tienes suficiente dinero";[] spawn { sleep 5;hint "";} };

life_popeur = life_popeur-_precio;

//crear coche
[_vendedor] spawn {

_vendedor = _this select 0;

_coche = "O_Truck_02_box_F" createVehicle position _vendedor;
life_vehicles pushBack _coche;
[[_coche,"vehicle_info_owners",[[getPlayerUID _unit,profileName]],true],"TON_fnc_setObjVar",false,false] spawn life_fnc_MP;

[[_coche,1,"QUICKSKILL\trabajos\badback.paa"],"life_fnc_setTexture",true,false] spawn life_fnc_MP;
[[_coche,0,"QUICKSKILL\trabajos\badfront.paa"],"life_fnc_setTexture",true,false] spawn life_fnc_MP;

_coche addAction["Cocinar Meta", QUICK_fnc_cocinarMeta,_coche];

hint "Has comprado un camion laboratorio!!";
sleep 3;
hint "";

sleep 60;
[[_coche,1,"QUICKSKILL\trabajos\badback.paa"],"life_fnc_setTexture",true,false] spawn life_fnc_MP;
[[_coche,0,"QUICKSKILL\trabajos\badfront.paa"],"life_fnc_setTexture",true,false] spawn life_fnc_MP;

sleep 120;

[[_coche,1,"QUICKSKILL\trabajos\badback.paa"],"life_fnc_setTexture",true,false] spawn life_fnc_MP;
[[_coche,0,"QUICKSKILL\trabajos\badfront.paa"],"life_fnc_setTexture",true,false] spawn life_fnc_MP;

sleep 180;

[[_coche,1,"QUICKSKILL\trabajos\badback.paa"],"life_fnc_setTexture",true,false] spawn life_fnc_MP;
[[_coche,0,"QUICKSKILL\trabajos\badfront.paa"],"life_fnc_setTexture",true,false] spawn life_fnc_MP;


};