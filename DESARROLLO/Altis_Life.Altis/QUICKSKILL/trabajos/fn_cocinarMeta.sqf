///////////////////////////////////////////////////////////////////////
//para cocinar meta necesitas 5 de metilamina quicskill para plata o plomo
/////////////////////////////////////////////////////////////////////////
private["_furgo"];
_gen = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
_caller =[_this,1,Objnull,[Objnull]] call BIS_fnc_param;
 _id = _this select 2; 

_furgo =[_this,3,Objnull,[Objnull]] call BIS_fnc_param;
if(isNull _furgo) exitWith {hint "Furgo is null :("}; //if not the thief get bent
//tiene que llevar el traje de cientifico
 if(uniform _caller!= "U_C_Scientist") exitWith {hint "No llevas la proteccion adecuada para manipular la meta, equipate el traje de cientifico"};
 _gen removeAction _id;

//vamos a cocinar
[_furgo] spawn {

_furgo = _this select 0;

hint "Has empezado a cocinar meta,  se cocinara en 10 minutos";


_humo = "SmokeShellYellow" createVehicle position _furgo;
_humo attachTo [_furgo, [0, 1, 1] ];

_furgo say3D "drugcooking";

_time = 20;
sleep _time;


_humo = "SmokeShellRed" createVehicle position _furgo;
_humo attachTo [_furgo, [0, 1, 1] ];

_furgo say3D "drugcooking";

_time = 20;
sleep _time;

_humo = "SmokeShellBlue" createVehicle position _furgo;
_humo attachTo [_furgo, [0, 1, 1] ];

_furgo say3D "drugcooking";

hint "La meta estara lista en 1 minuto"; 
sleep 6;
_furgo say3D "drugcooking";

_furgo addAction["Recoger la meta",QUICK_recogerMeta];
_furgo addAction["Cocinar Meta", QUICK_fnc_cocinarMeta,_coche];


};

QUICK_recogerMeta = {

_gen = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
_caller =[_this,1,Objnull,[Objnull]] call BIS_fnc_param;
 _id = _this select 2; 


//tiene que llevar el traje de cientifico
 if(uniform _caller!= "U_C_Scientist") exitWith {hint "No llevas la proteccion adecuada para manipular la meta, equipate el traje de cientifico"};

//quitar accion de recoger
 _gen removeAction _id;
 _frutos = 10;

[true,"cocainep",_frutos] call life_fnc_handleInv;

hint format["Has recogido %1 de meta",_frutos]; 

sleep 2;

hint "";


};