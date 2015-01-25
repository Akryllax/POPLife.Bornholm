/*
Script hecho por Icaruk, si quieres usarlo sólo tienes que pedirme permiso en adri-rk@hotmail.com.
Script done by Icaruk, if you want to use it, you just have to ask me permission on adri-rk@hotmail.com.
*/

_caller = _this select 0;
_tiempo = (60 * 5);


while {true} do {
	_tiempo = _tiempo - 1;
	if (_tiempo <= 0) exitWith {
		if (isNil {cancelado}) then {	
			robo = 1;
			publicVariable "robo";
		};
		if (!isNil {cancelado}) then {
			if (cancelado == 1) exitWith {hint "El robo al banco central ha sido interrumpido."};
			[] execVM "QUICKSKILL\robos\banco\reset.sqf";
		};
	};
	sleep 1;
};

this enablesimulation false; 
this addAction ["Archivos secretos",'null = [] execVM "QUICKSKILL\robos\banco\docMenu.sqf";', "", 9,false,true,"",""];


this allowdamage false;
this addAction ["Introducir codigo",'null = [] execVM "QUICKSKILL\robos\banco\introCodigoCaja.sqf";', "", 9,false,true,"",""]; 
this addAction ["Cojer el dinero",'null = [] execVM "QUICKSKILL\robos\banco\cojerDinero.sqf";', "", 8,false,true,"","robo == 1"];
this addAction ["Interrumpir robo",'cancelado = 1; publicVariable "cancelado";', "robo == 1", 8,false,true,"","(side player == WEST) AND (porcentaje > 0)"];

this enablesimulation false;
this addAction ["Acceder al sistema",'null = [] execVM "QUICKSKILL\robos\banco\menuInicial.sqf";', "", 9,false,true,"",""];

   