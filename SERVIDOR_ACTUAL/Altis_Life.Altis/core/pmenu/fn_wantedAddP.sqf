private["_unit","_amount"];
if(playerSide != west) exitWith {hint "No eres policia."};
if((lbCurSel 2406) == -1) exitWith {hint "Tienes que seleccionar al criminal."};
if((lbCurSel 2407) == -1) exitWith {hint "Tienes que seleccionar el crimen."};
_unit = lbData [2406,lbCurSel 2406];
_unit = call compile format["%1",_unit];
_amount = lbData [2407,lbCurSel 2407];
if(isNil "_unit") exitWith {};
if(side _unit == west) exitWith {hint "No se aplican crimenes a policias." };
if(_unit == player) exitWith {hint "No puedes ponerte crimenes.";};
if(isNull _unit) exitWith {};

[[1,format["%1 ha sido añadido a la lista de criminales.",_unit getVariable["realname",name _unit],_amount,getPlayerUID _unit]],"life_fnc_broadcast",west,false] spawn life_fnc_MP;

[[getPlayerUID _unit,_unit getVariable["realname",name _unit],_amount],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP; 