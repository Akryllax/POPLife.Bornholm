
aliCen = 0;
aguCen = 0;
comCen = 0;
medCen = 0;

_inicial = 0;

aguExt = _inicial; // Pine Creek (1)
aliExt = _inicial; // Diablos (2)
medExt = _inicial; // Old Bedford (3)
comExt = _inicial; // San Cristóbal (4)

_minimo = 10;
_maximo = 10; // se añade 0-10 al mínimo

while {true} do {
	aguExt = aguExt - (_minimo + floor (random _maximo));
	aliExt = aliExt - (_minimo + floor (random _maximo));
	medExt = medExt - (_minimo + floor (random _maximo));
	comExt = comExt - (_minimo + floor (random _maximo));
	
	aliCen = aliCen - (_minimo + floor (random _maximo));
	aguCen = aguCen - (_minimo + floor (random _maximo));
	comCen = comCen - (_minimo + floor (random _maximo));
	medCen = medCen - (_minimo + floor (random _maximo));
	
	if (aguExt > 1000) then {aguExt = 1000};
	if (aguExt < 0) then {aguExt = 0};
	if (aliExt > 1000) then {aliExt = 1000};
	if (aliExt < 0) then {aliExt = 0};
	if (medExt > 1000) then {medExt = 1000};
	if (medExt < 0) then {medExt = 0};
	if (comExt > 1000) then {comExt = 1000};
	if (comExt < 0) then {comExt = 0};
	
	if (aliCen > 1000) then {aliCen = 1000};
	if (aliCen < 0) then {aliCen = 0};
	if (aguCen > 1000) then {aguCen = 1000};
	if (aguCen < 0) then {aguCen = 0};
	if (comCen > 1000) then {comCen = 1000};
	if (comCen < 0) then {comCen = 0};
	if (medCen > 1000) then {medCen = 1000};
	if (medCen < 0) then {medCen = 0};
	
	sleep (60 * 30); // 80-160 de cada recurso por sleep // 160-320 de cada recurso por hora
};