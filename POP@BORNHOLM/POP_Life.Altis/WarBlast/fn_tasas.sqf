/*
   tasas.sqf
   Autor: WarBlast e Icaruk
   Descripcion: Paga cabron!
*/

while {true} do {
    _casas = life_houses;

    if (_casas > 0) then { // si tengo más de 0 casas pasan cosas malas, si no, nada
        _i = floor ((pop_banco * 0.001) * _casas);
        pop_banco = pop_banco - _i;
        systemChat format ["Se te han deducido %1€ de impuestos, hacienda somos todos.", _i];
    };
    sleep (60 * 15);
};