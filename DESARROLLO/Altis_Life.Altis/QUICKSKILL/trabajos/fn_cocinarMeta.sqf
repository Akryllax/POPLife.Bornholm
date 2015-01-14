///////////////////////////////////////////////////////////////////////
//para cocinar meta necesitas 5 de metilamina quicskill para plata o plomo
/////////////////////////////////////////////////////////////////////////
private["_furgo"];
_furgo = _this select 0;

//vamos a cocinar
[] spawn {


hint "Has empezado a cocinar meta,  se cocinara en 10 minutos";


// poner humo en furgo
_humo = "SmokeShellYellow" createVehicle position _furgo;
_humo attachTo [_furgo, [0, 1, 0] ];
_humo enableSimulation false;
_furgo say3D "drugcooking";

_time = 200;
sleep _time;

//poner otro humo de otro color
_humo = "SmokeShellRed" createVehicle position _furgo;
_humo attachTo [_furgo, [0, 1, 0] ];
_humo enableSimulation false;
_furgo say3D "drugcooking";

_time = 200;
sleep _time;

_humo = "SmokeShellBlue" createVehicle position _furgo;
_humo attachTo [_furgo, [0, 1, 0] ];
_humo enableSimulation false;
_furgo say3D "drugcooking";

hint "La meta estara lista en 1 minuto"; 
sleep 60;

_furgo addAction["Recoger la meta",QUICK_recogerMeta];


};

QUICK_recogerMeta = {

_gen = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
_caller =[_this,1,Objnull,[Objnull]] call BIS_fnc_param;
 _id = _this select 2; 


//tiene que llevar el traje de cientifico
 if(vest _caller != "U_C_Scientist") exitWith {hint "No llevas la proteccion adecuada para manipular la meta, equipate el traje de cientifico"};

//quitar accion de recoger
 _gen removeAction _id;
 _frutos = 5 + round random 4;

[true,"meta",_frutos] call life_fnc_handleInv;

hint format["Has recogido %1 de meta",_frutos]; 

sleep 2;

hint "";


};