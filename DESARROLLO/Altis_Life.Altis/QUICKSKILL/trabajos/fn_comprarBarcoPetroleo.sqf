///comprar barco para petroleo!! by quickskill para plata o plomo
waitUntil {!isNull player};
private["_coche"];
_precio = 50000;
_unit = [_this,1,Objnull,[Objnull]] call BIS_fnc_param;
_vendedor = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;

if(isNull _unit) exitWith {}; //if not the thief get bent

//puede pagar?¿
 if(life_cash - _precio < 0) exitWith { hint "No tienes suficiente dinero";[] spawn { sleep 5;hint "";} };

life_cash = life_cash-_precio;

//crear coche
[_vendedor] spawn { 

_vendedor = _this select 0;

_coche = "C_Boat_Civil_01_rescue_F" createVehicle position _vendedor;
life_vehicles pushBack _coche;
[[_coche,"vehicle_info_owners",[[getPlayerUID _unit,profileName]],true],"TON_fnc_setObjVar",false,false] spawn life_fnc_MP;

_coche addAction["Extraer Petroleo", QUICK_fnc_extraerPetroleo,_coche];

};