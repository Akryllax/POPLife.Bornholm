/*
File: fn_robarVehiculo
Author: WarBlast
*/
disableSerialization;
private["_control","_price","_vehicle","_nearVehicles","_color","_check"];
_control = ((findDisplay 39400) displayCtrl 39402);
_price = _control lbValue (lbCurSel _control);
_price = _price*0.65;
if(life_atmcash < _price) exitWith {hint format["Necesitas %1 para quedartelo",_price]; };
_vehicle = _control lbData (lbCurSel _control);
_vehicle = call compile format["%1", _vehicle];
_nearVehicles = nearestObjects [getMarkerPos life_chopShop,["Car","Truck"],25];
_vehicle = _nearVehicles select _vehicle;
if(isNull _vehicle) exitWith {};
_check = false;

//Miramos si ay polis cerca
{
	if(player distance _x < 200 && side _x == west)
	 then {
	 	 _check = true;
	};
} forEach playableUnits;
    if(_check) exitWith {
	hint "Tienes a los policias muy cerca!";
};


//O si es un coche no permitido
if(typeOf _vehicle == "B_MRAP_01_F") exitWith {
	hint "Lo siento pero no puedo darte este tipo de llaves";
};


//Le damos color y evitamos que salga de skin policial
//Offroad
_color = 0;
    if(typeOf _vehicle in["C_Offroad_01_F"]) then {
	_color = floor(random 11);
};
   while {
	typeOf _vehicle in["C_Offroad_01_F"] && _color in [6,7,8,9]
} do {
    _color = floor(random 11);
};


//Ranchera
    if(typeOf _vehicle in["C_Hatchback_01_F"]) then {
    _color = floor(random 7);
};


//Ranchera Deportiva
     if(typeOf _vehicle in["C_Hatchback_01_sport_F"]) then {
     _color = floor(random 20);
};
   while {
	typeOf _vehicle in["C_Hatchback_01_sport_F"] && _color in[18,19,20]
} do {
    _color = floor(random 20);
};


//SUV
    if(typeOf _vehicle in["C_SUV_01_F"]) then {
	_color = floor(random 16);
};
   while {
	typeOf _vehicle in["C_SUV_01_F"] && _color in[4,5]
} do {
   _color = floor(random 16);
};


//Quad
   if(typeOf _vehicle in["B_Quadbike_01_F"]) then {
   _color = floor(random 10);
};
   while {
	typeOf _vehicle in["B_Quadbike_01_F"] && _color in[9,10]
} do {
   _color = floor(random 10);
};


//Mandamos el mensaje con el precio
hint format["Se te cobro %1 para hacerte la copia de las llaves",_price];

//Le cobramos
life_atmcash = life_atmcash - _price; [1] call SOCK_fnc_updatePartial;

//Eliminamos el vehiculo de su antiguo dueño
[[_vehicle],"TON_fnc_muerteVehiculos",false,false] spawn life_fnc_MP;
sleep 0.05;

//Creamos el vehiculo en la base de datos
[[(getPlayerUID player),playerSide,_vehicle,_color],"TON_fnc_crearVehiculo",false,false] spawn life_fnc_MP;

//Lo añadimos a la WantedList
[[getPlayerUID player,profileName,"28"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
closeDialog 0;
sleep 0.5;

//Eliminamos el vehiculo
if(!isNil "_vehicle" && !isNull _vehicle) then { deleteVehicle _vehicle; };