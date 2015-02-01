#include <macro.h>
/*
	File: fn_wantedMenu.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Opens the Wanted menu and connects to the APD.
*/
private["_display","_list","_name","_crimes","_bounty","_units"];
disableSerialization;

createDialog "life_wanted_menu";

_display = findDisplay 2400;
_list = _display displayCtrl 2401;
_players = _display displayCtrl 2406;
lbClear _list;
_units = [];

lbClear _players;

{
    _side = switch(side _x) do {case west: {"Cop"}; case civilian : {"Civ"}; case independent : {"Med"}; case east : {"Merc"}; default {"Unknown"};};
    _players lbAdd format["%1 - %2", name _x,_side];
    _players lbSetdata [(lbSize _players)-1,str(_x)];
} foreach playableUnits;

_list2 = getControl(2400,2407);
lbClear _list2; //Purge the list

_crimes = [["Atropello","25000","1"],["Asesinato","50000","2"],["Fuga","50000","3"],
["Violacion","15000","4"],["Robo","20000","5"],["Uso ilegal de explosivos","60000","6"],
["Hurto menor","10000","7"],["Secuestro","40000","8"],["Posesion de drogas","30000","9"],
["Trafico de drogas","50000","10"],["Asalto armado","40000","11"],["Conducir sin licencia","1500","12"],
["Conducir sin luces","200","13"],["Exceso de velocidad","500","14"],["Violacion zona de exclusion aerea","50000","15"],
["Conduccion temeraria","2000","16"],["Desorden civil","5000","17"],["Falta de respeto a la autoridad","500","18"],
["Entrar en zona restringida","1000","19"],["Posesion de armas sin licencia","20000","20"],["Secuestro con asesinato","40000","21"],
["Comercio ilegal","20000","22"],["Enemigo publico","500000","23"],["Vuelo sin licencia","10000","24"],
["Destrozar vehiculos/propiedades/mobiliario","15000","25"],["Atentar contra la autoridad","20000","26"],["Posesion de armas ilegales","60000","27"]];

{
	_list2 lbAdd format["%1 - $%2 (%3)",(_x select 0),(_x select 1),(_x select 2)];
	_list2 lbSetData [(lbSize _list2)-1,(_x select 2)];
} foreach _crimes;

ctrlSetText[2404,"Estableciendo conexion..."];


if(__GETC__(life_coplevel) < 3 && __GETC__(life_adminlevel) == 0) then
{
	ctrlShow[2405,false];
};

[[player],"life_fnc_wantedFetch",false,false] spawn life_fnc_MP;