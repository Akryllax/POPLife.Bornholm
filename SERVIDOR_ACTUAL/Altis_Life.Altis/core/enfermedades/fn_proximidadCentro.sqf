[] spawn {

	while {true} do {
	
		while {alive player} do {
			if((getMarkerPos "centro_enfermedades") distance (position player) < 250 && (vehicle player == player)) then {

				if(uniform player == "U_C_Scientist") then
				{
					hintSilent parseText format["Zona de peligro biologico.<br/><t color='#FF0000'>No te quites tu traje NBQ</t>"];
					sleep 5;
				} else {
					hintSilent "Hay un fuerte holor a químicos. Te estás empezando a encontrar mal...";
					
					player setDamage (damage player + 0.12);
					
					[[player, "Cough"],"life_fnc_say3D",true, false] call life_fnc_MP;
					
					"dynamicBlur" ppEffectEnable true; "dynamicBlur" ppEffectAdjust [6]; "dynamicBlur" ppEffectCommit 1;
					sleep 1;
					"dynamicBlur" ppEffectAdjust [0.5]; "dynamicBlur" ppEffectCommit 1;
					sleep 1;
					"dynamicBlur" ppEffectAdjust [1]; "dynamicBlur" ppEffectCommit 1;
					sleep 1;
					"dynamicBlur" ppEffectAdjust [0]; "dynamicBlur" ppEffectCommit 1;
					
					if((getMarkerPos "centro_enfermedades") distance (position player) < 45 && (vehicle player == player)) then {
						[[player, "Agony"],"life_fnc_say3D",true, false] call life_fnc_MP;
						player setDamage 1;
					};
				};
			};
			
			sleep 9;
		};
	};
};