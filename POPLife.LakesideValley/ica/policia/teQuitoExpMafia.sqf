/*
Quitaexp mafia por Icaruk

[[[jugador, 10], "ica\policia\teQuitoExpMafia.sqf"],"BIS_fnc_execVM",true,true] call BIS_fnc_MP;
[jugador, 10] execVM "ica\policia\teQuitoExpMafia.sqf";
*/

if ((_this select 0) != player) exitWith {};

_n = parseNumber (_this select 1);

if (_n <= 0) then {_n = 1};
if (_n > 1000) then {_n = 1000};

if (expMafia > 1100) then {expMafia = 1100; }; // cheto?
expMafia = expMafia - _n;
if (expMafia < 0) then {expMafia = 0; };

_str = format ["-%1 Mafia", _n];
[_str] call ica_masuno;