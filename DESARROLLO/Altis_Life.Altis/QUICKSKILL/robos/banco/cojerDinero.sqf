/*
Script hecho por Icaruk, si quieres usarlo sólo tienes que pedirme permiso en adri-rk@hotmail.com.
Script done by Icaruk, if you want to use it, you just have to ask me permission on adri-rk@hotmail.com.
*/


if (isNil {robo}) exitWith {hint "Que raro, la caja fuerte que guarda los ahorros de todos los ciudadanos de Altis esta cerrada...";};
if (!isNil {robo}) then {
	if (robo == 1) then {
		robo = 2;
		publicVariable "robo";

		
		
		
		
		life_cash = life_cash + deposito;
		
	
		hint format ["Has robado %1$ del banco central", deposito];
		cajaFuerte setPos (getMarkerPos "");
		sleep 3;
		
		[] execVM "QUICKSKILL\robos\banco\reset.sqf";
		
		deposito = 0;
		publicVariable "deposito";
		

	};
};


