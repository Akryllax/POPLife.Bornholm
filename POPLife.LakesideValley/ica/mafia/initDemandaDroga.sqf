/*
Demanda de droga por Icaruk
*/

_minimo = 15;
_maximo = 15;
_minimoP = 8;
_maximoP = 8;
_aumento = 20 + floor (random 10);
_aumentoP = 6 + floor (random 10);

demCan = _minimo + floor (random _maximo);
demMar = _minimoP + floor (random _maximoP);
demOpi = _minimo + floor (random _maximo);
demHer = _minimoP + floor (random _maximoP);
demHC = _minimo + floor (random _maximo);
demCoc = _minimoP + floor (random _maximoP);

while {true} do {
	if !(demCan >= 100) then {demCan = demCan + _aumento; };
	if !(demMar >= 100) then {demMar = demMar + _aumentoP; };
	if !(demOpi >= 100) then {demOpi = demOpi + _aumento; };
	if !(demHer >= 100) then {demHer = demHer + _aumentoP; };
	if !(demHC >= 100) then {demHC = demHC + _aumento; };
	if !(demCoc >= 100) then {demCoc = demCoc + _aumentoP; };
	
	sleep (60 * 20);
};


