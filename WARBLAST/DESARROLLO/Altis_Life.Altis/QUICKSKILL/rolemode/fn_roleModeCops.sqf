/*
role mode, idea de chacal alias txipas desarrollado por quickskill para plataoplomo
*/
private["_roleador","_roleado"];
_roleador = player;
_roleado = cursorTarget;
life_action_inUse = true;
if (isNull _roleador) exitWith{hint "No eres un jugador¿?";};
if (isNull _roleado) exitWith{[]spawn{hint "Apunta a una persona";sleep 3;hint "";};};
_metros =  _roleador distance _roleado;
if (_metros > 500) exitWith{hint "Maximo 500 metros para poder rolear";};
//enviar hint al roleado 
[[1,format["Atención este es un aviso de la policia, ponga las manos arriba (shift +3) %1, avisado por el policia %2",name _roleado,name _roleador]],"life_fnc_broadcast",_roleado,false] spawn life_fnc_MP; 
[]spawn{hint "Has avisado al jugador";sleep 3;hint "";};

