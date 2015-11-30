QUICK_batHumo = {
  
  _this spawn{

_humo = "SmokeShellRed" createVehicle position _furgo;
_humo attachTo [_furgo, [0, 0, 1] ];

};



};

QUICK_batInvisible{
    

      _this spawn{
  
_humo = "SmokeShellRed" createVehicle position _furgo;
_humo attachTo [_furgo, [0, 0, 1] ];

};
};

QUICK_batReparacion{
    
      _this spawn{
  
_humo = "SmokeShellRed" createVehicle position _furgo;
_humo attachTo [_furgo, [0, 0, 1] ];

};
};

QUICK_batCuracion{
    
      _this spawn{
  
_humo = "SmokeShellRed" createVehicle position _furgo;
_humo attachTo [_furgo, [0, 0, 1] ];

};

};


QUICK_batAutodestrucion = {
        _this spawn{

                _unit = [_this, 1, objNull, [objNull]] call BIS_fnc_param; 
                _coche =   [_this, 2, objNull, [objNull]] call BIS_fnc_param; 

                //elimina objetos extra

                { detach _x; deleteVehicle _x; } forEach attachedObjects _coche;

                _c4 = "DemoCharge_Remote_Ammo_Scripted" createVehicle position _coche;
                _c4 setDamage 1;  
               
                
        };
};


///batmovil by quick!!! empieza aqui lo otro son funciones chacho!

waitUntil {!isNull player};
 private ["_c4", "_unit","_precio"];
_precio = 550000;
_unit = [_this,1,Objnull,[Objnull]] call BIS_fnc_param;
_vendedor = [_this,1,Objnull,[Objnull]] call BIS_fnc_param;


if(isNull _unit) exitWith {}; //if not the thief get bent


//puede pagar?¿
 if(life_cash - _precio < 0) exitWith { hint "No tienes suficiente dinero";[] spawn { sleep 5;hint "";} };

//equipar clase
life_cash = life_cash-_precio;

//crear coche
_coche = "C_Hatchback_01_sport_F" createVehicle position _vendedor;

//cargar skin globalmente
[[_coche,0,"textures\IV\batman_suv.jpg"],"life_fnc_setTexture",true,false] spawn life_fnc_MP;

//agregar bathumo!!!!

//agregar batinvisible!!

//agregar batreparacion!!

//agregar batcuracion!!

//agregar autodestrucion!!

 
 



if(true) exitWith{hint "Batmovil Comprado! Nanananananananananananan!!";[] spawn { sleep 5;hint "";} };