/*
role mode, idea de chacal alias txipas desarrollado por quickskill para plataoplomo
*/
private["_roleador","_roleado"];
_roleador = player;
_roleado = cursorTarget;
life_action_inUse = true;
if (isNull _roleador) exitWith{hint "No eres un jugador¿?";life_action_inUse = false;};
if (isNull _roleado) exitWith{[]spawn{hint "Apunta a una persona";sleep 3;hint "";life_action_inUse = false;};};


if(_roleado isKindOf "Man")then{


_metros =  _roleador distance _roleado;
if (_metros > 100) exitWith{hint "Maximo 100 metros para poder rolear";life_action_inUse = false;};
//enviar hint al roleado 
[[1,format["Rindete (shift+3) o seras abatido %1, avisado por %2",name _roleado,name _roleador]],"life_fnc_broadcast",_roleado,false] spawn life_fnc_MP; 
[]spawn{hint "Has avisado al jugador";sleep 3;hint "";life_action_inUse = false;};

};



