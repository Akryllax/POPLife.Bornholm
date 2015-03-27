
private["_val"];

if(isNil {life_ticket_unit}) exitWith {hint localize "STR_Cop_TicketNil"};
if(isNull life_ticket_unit) exitWith {hint localize "STR_Cop_TicketExist"};
_val = ctrlText 2652;
if(!([_val] call TON_fnc_isnumber)) exitWith {hint localize "STR_Cop_TicketNum"};
if ((parseNumber _val) > 200) exitWith {hint "Sólo puedes restarle 200 de exp en mafia"};

[[0, format ["La policía le ha quitado %1 de exp mafia a %2", _val, name life_ticket_unit]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
[[[life_ticket_unit, _val], "ica\policia\teQuitoExpMafia.sqf"],"BIS_fnc_execVM",true,true] call BIS_fnc_MP;
closeDialog 0;
