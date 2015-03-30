
/*
Demanda de minería por Icaruk
*/

_minimo = 10;
_maximo = 40;
_aumento = 15 + floor (random 15);

demAre = _minimo + floor (random _maximo);
demCar = _minimo + floor (random _maximo);
demHie = _minimo + floor (random _maximo);
demPol = _minimo + floor (random _maximo);
demOro = _minimo + floor (random _maximo);
demDia = _minimo + floor (random _maximo);

while {true} do {
	if !(demAre >= 100) then {demAre = demAre + _aumento; };
	if !(demCar >= 100) then {demCar = demCar + _aumento; };
	if !(demHie >= 100) then {demHie = demHie + _aumento; };
	if !(demPol >= 100) then {demPol = demPol + _aumento; };
	if !(demOro >= 100) then {demOro = demOro + _aumento; };
	if !(demDia >= 100) then {demDia = demDia + _aumento; };
	
	sleep (60 * 20);
};