/*
Script de la misión Desolation creado por Icaruk & Nerk

Función: Añade acciones
*/


hab_Curar = {
	if !(("FirstAidKit" in (Items player))) exitWith {hint "No tienes ningún kit de primeros auxilios"; };
	_param = _this select 0;
	
	private ["_mirando", "_porcent", "miNivel"];
	if (_param == "otro") then {
		_mirando = cursorTarget;	
	};
	
	[5, "Aplicando primeros auxilos..."] call ica_barrita;
	player playMove "AinvPknlMstpSlayWrflDnon_medic";
	sleep 5;
	player switchMove "";
	
	_porcent = 0;
	_miNivel = [expPA] call ica_expToLevel;
	switch (_miNivel) do {
		case 2: {_porcent = 10;	};
		case 4: {_porcent = 20;	};
		case 6: {_porcent = 30;	};
		case 8: {_porcent = 40;	};
		case 10: {_porcent = 60;	};
	};
	
	if ((round (random 100)) <= _porcent) then { // no me quita kit
		if (_param == "otro") then {
			_mirando setDamage 0.25;
			hint "No has gastado kit de primeros auxilios";		
		} else {
			player setDamage 0.25;
			hint "No has gastado kit de primeros auxilios";
		};
	} else { // me quita kit
		if (_param == "otro") then {
			player removeItem "FirstAidKit";
			_mirando setDamage 0.25;
		} else {
			player removeItem "FirstAidKit";
			player setDamage 0.25;
		};	
	};
};

hab_Reparar = {
	[] spawn {
		if !(("ToolKit" in (Items player))) exitWith {hint "No tienes ningún kit de reparaciones"; };
		if (vehicle player != player) exitWith {};
		
		private ["_veh", "_porcent", "_t", "_miNivel"];
		_veh = cursorTarget;

		[25, "Reparando..."] call ica_barrita;
		player playMove "CL3_anim_RepairCrouch";
		[[player,"CL3_anim_RepairCrouch"],"life_fnc_animSync",nil,false] spawn life_fnc_MP;
		sleep 25;
		
		/*
		_t = 10;
		while {true} do {
			if (_t <= 0) exitWith {};
			player playActionNow "medicStartRightSide";
			_t = _t - 5;
			sleep 5;
		};
		*/


		_porcent = 0;
		_miNivel = [expConduccion] call ica_expToLevel;
		switch (_miNivel) do {
			case 2: {_porcent = 10;	};
			case 4: {_porcent = 20;	};
			case 6: {_porcent = 30;	};
			case 8: {_porcent = 40;	};
			case 9: {_porcent = 50;	};
		};
		
		if ((round (random 100)) <= _porcent) then {
			hint "No has gastado kit reparación";
		} else {
			player removeItem "ToolKit";
		};
		_veh setDamage ((damage _veh) - 0.9);
		
		_veh setDamage 0;
	};
};


// esto sirve para impedir dobles acciones
_accionMecanicoNoob = 0;


while {true} do {

	// Curarte a ti mismo
	if (
		((vehicle player) isKindOf "Man") AND (damage player > 0.25) AND ("FirstAidKit" in items player)
	) then {
		_accionCurar = player addAction ["<t color='#64FE2E'> Primeros auxilios a uno mismo </t>", 'call hab_Curar', "", 9,false,true,"",""];                                                  
		waitUntil {!(
			((vehicle player) isKindOf "Man") AND (damage player > 0.25) AND ("FirstAidKit" in items player)
		)};
		player removeAction _accionCurar;
		
	};

	// Curar a otros.
	if (
		((vehicle player) isKindOf "Man") AND (side cursorTarget == (side player)) AND ((cursorTarget distance player) < 3) AND (damage cursortarget > 0.25) AND (cursorTarget != player) AND (cursorTarget isKindOf "Man") AND
		("FirstAidKit" in items player)
	) then {
		_str = format ["<t color='#64FE2E'> Primeros auxilios a %1 </t>", name cursorTarget];
		_accionDoctor = player addAction [_str, ' ["otro"] call hab_Curar', "", 9,false,true,"",""];                                                 
		waitUntil {!(
			(side cursorTarget == (side player)) AND (damage cursortarget > 0.25) AND (cursorTarget != player) AND (cursorTarget isKindOf "Man") AND
			("FirstAidKit" in items player)
		)};
		player removeAction _accionDoctor;
		
	};	
	
	/*
	// Reparar
	if (
		(cursorTarget iskindof 'LandVehicle') OR (cursorTarget iskindof 'Air') OR (cursorTarget iskindof 'Ship')
	) then {

		if (
			((vehicle player) isKindOf "Man") AND
			((cursorTarget distance player) < 4) AND 
			!(cursorTarget isKindOf "Man") 
			AND	!(
				(getDammage cursorTarget == 0) AND
				(cursorTarget getHitPointDamage "HitEngine" == 0)
			)
		) then { 
			_accionMecanico = player addAction ["<t color='#64FE2E'> Reparar</t>", '[] call hab_Reparar', "", 9,false,true,"",""]; 
			waitUntil {
				!(
					((vehicle player) isKindOf "Man") AND
					((cursorTarget distance player) < 4) AND 
					!(cursorTarget isKindOf "Man") 
					AND	!(
						(getDammage cursorTarget == 0) AND
						(cursorTarget getHitPointDamage "HitEngine" == 0)
					)
				)
			};
			player removeAction _accionMecanico;
		};
	};
	*/

	
	sleep 1;
};