/*
   tasas.sqf
   Autor: WarBlast e Icaruk
   Descripcion: Paga cabron!
*/

while {true} do {
    _casas = life_houses;

    if (_casas > 0) then { // si tengo más de 0 casas pasan cosas malas, si no, nada
        _i = floor ((life_ATMcash * 0.005) * _casas);
        life_ATMcash = life_ATMcash - _i;
        systemChat format ["Se te han deducido %1€ de impuestos, hacienda somos todos.", _i];
    };
    sleep (60 * 10);
};