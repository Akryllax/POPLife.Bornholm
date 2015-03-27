/*
Habilidades activas por Icaruk
*/

hab_pocionDeParkour = {
	if (!isNil {parkourUsado}) exitWith {hint "Necesitas descansar 20s"};
	[] spawn {
		parkourUsado = true;
		sleep 20;
		parkourUsado = nil;
	};
	titleText ["3...", "PLAIN"];
	sleep 1;
	titleText ["2...", "PLAIN"];
	sleep 1;
	titleText ["1...", "PLAIN"];
	sleep 1;
	
	[] spawn {
		player allowdamage false;
		waitUntil {isTouchingGround player};
		player allowdamage true;
	};

	_tio = player;
	_vel = velocity _tio;
	_dir = direction _tio;
	_potencia = 6;
	_altura = 10;
	_tio setVelocity [
		((_vel select 0) + (sin _dir * _potencia)),
		((_vel select 1) + (cos _dir * _potencia)),
		(_vel select 2) + _altura
	];
};

hab_molotov = {
	[] spawn {   
		if (!isNil {fuegoenlamano}) exitWith {hint "Tienes las manos ocupadas"};
		fuegoenlamano = true;
		
		[3, "Preparando bomba de fuego..."] call ica_barrita;
		
		_t = 3;
		while {true} do {
			if (_t <= 0) exitWith {};
			if (!alive player) exitWith {cancelar = true};
			
			_t = _t - 1;
			sleep 1;
		};		

		if (!isNil {cancelar}) exitWith {("icapa7" call BIS_fnc_rscLayer) cutText ["","PLAIN"]; fuegoenlamano = nil; }; // si cancelo no sigo
		
		flecha = "Sign_Arrow_F" createVehicleLocal getMarkerPos "";
		flecha attachTo [player, [0, 7, 0.5]];
		
		accioncancelar = player addAction ["Cancelar",{
			detach flecha;
			deleteVehicle flecha; 	
			player removeAction act_colocaFuego;
			player removeAction accioncancelar;
			fuegoenlamano = nil;
		}];  
		
		act_colocaFuego = player addAction ["Lanzar bomba de fuego", { 
			player removeAction act_colocaFuego;
			player removeAction accioncancelar;
			[1, ""] call ica_barrita;
			_t = 1;
			while {true} do {
				if (_t <= 0) exitWith {
					if (stance player == "STAND") exitWith {
						player playMove "AwopPercMstpSgthWrflDnon_start1";
						[[player,"AwopPercMstpSgthWrflDnon_start1"],"life_fnc_animSync",nil,false] spawn life_fnc_MP;
						sleep 1.5;
						waitUntil {animationState player != "AwopPercMstpSgthWrflDnon_start1"};
					};
					if (stance player == "CROUCH") exitWith {
						player playMove "AwopPknlMstpSgthWrflDnon_start";
						[[player,"AwopPknlMstpSgthWrflDnon_start"],"life_fnc_animSync",nil,false] spawn life_fnc_MP;
						sleep 1.5;
						waitUntil {animationState player != "AwopPknlMstpSgthWrflDnon_start"};
					};
					if (stance player == "PRONE") exitWith {
						player playMove "AwopPpneMstpSgthWrflDnon_start";
						[[player,"AwopPpneMstpSgthWrflDnon_start"],"life_fnc_animSync",nil,false] spawn life_fnc_MP;
						sleep 1.5;
						waitUntil {animationState player != "AwopPpneMstpSgthWrflDnon_start"};
					};
				};
				if (!alive player) exitWith {
					detach flecha;
					deleteVehicle flecha; 	
					player removeAction act_colocaFuego;
					player removeAction accioncancelar;
					fuegoenlamano = nil;
				};
				_t = _t - 1;
				sleep 1;
			};		
			
			_fuego = "#particlesource" createVehicle getpos flecha;
			_fuego setParticleClass "BigDestructionFire";
			_fuego setParticleFire [0.3,1.0,0.1];
			_humo = "#particlesource" createVehicle getpos flecha;
			_humo setParticleClass "BigDestructionSmoke";
			
			[_fuego, 60] call ica_borrame;
			[_humo, 60] call ica_borrame;

			detach flecha;
			deleteVehicle flecha; 
			fuegoenlamano = nil;
		}];
	};
};

hab_pocionDeInvis = {
	[] spawn {
		private "_source";
		_source = "#particlesource" createVehicle getpos player;  
		_source setParticleCircle [0, [0.1, 0.1, 0.1]]; 
		_source setParticleRandom [0, [0, 0.1, 1], [0.1, 0, 0.1], 0, 0.1, [0, 0, 0, 0.1], 0, 0]; 
		_source setDropInterval 0.1;  
		_source attachto [player, [0, 0, 0]]; 
		_source setParticleParams [["\A3\data_f\ParticleEffects\Universal\Refract", 1, 0, 1], "", "Billboard", 1, 4, [0, 0, 0], [0, 0, 0.5], 9, 10, 7.9, 0.1, [0.6, 1, 0.9, 0.8], [[0.1, 0.1, 0.1, 1], [0.25, 0.25, 0.25, 0.5], [0.5, 0.5, 0.5, 0]], [0, 0.1, 0.2, 0.5, 0.1, 0.1], 0, 0, "", "", player]; 
		sleep 1; 
		player hideObjectGlobal true;
		
		sleep 10;
		deleteVehicle _source; 
		sleep 1; 
		player hideObjectGlobal false;	
	};
};

hab_Golpe = {
	// ["pego"] call hab_Golpe;
	_param = _this select 0;

	if (_param isEqualTo "pego") exitWith {
		if (([expFortaleza] call ica_expToLevel) < 10) exitWith {};
		if (!isNil {golpeDado}) exitWith {hint "Tienes que descansar 6 segundos, dar puñetazos así de molones cansa mucho." };
		[] spawn {
			golpeDado = true;
			sleep 6;
			golpeDado = nil;
		};

		[cursorTarget] spawn {
			_victima = _this select 0;
			
			if (isNull cursorTarget) exitWith { // le pegas al vacío
				_animPegar = ["CL3_anim_Punch1", "CL3_anim_Punch2", "CL3_anim_Punch3", "CL3_anim_Punch4"] call BIS_fnc_selectRandom;
				player playActionNow _animPegar;
				[[player,_animPegar],"life_fnc_animSync",nil,false] spawn life_fnc_MP;	
			};
			
			if ((player distance _victima) > 4.5) exitWith {};
			_animPegar = ["CL3_anim_Punch1", "CL3_anim_Punch2", "CL3_anim_Punch3", "CL3_anim_Punch4"] call BIS_fnc_selectRandom;
			player playActionNow _animPegar;
			[[player,_animPegar],"life_fnc_animSync",nil,false] spawn life_fnc_MP;
			sleep 0.75;
			
			if ( !(_victima getVariable "restrained") AND ((animationState _victima) != "Incapacitated") AND (_victima isKindOf "Man") ) then {
				[["recibo", _victima], "hab_Golpe", true, false] call BIS_fnc_MP;
				_victima setDamage ((damage _victima) + 0.1);
			};
		};
	};
	
	if (_param isEqualTo "recibo") exitWith {
		
		[_this select 1] spawn {
			_victima = _this select 0;
			if (player != _victima) exitWith {};
			_animRecibir = ["CL3_anim_Receive1a", "CL3_anim_Receive2b", "CL3_anim_Receive3b"] call BIS_fnc_selectRandom;
			player playActionNow _animRecibir;
			[[player,_animRecibir],"life_fnc_animSync",nil,false] spawn life_fnc_MP;
			sleep 3;
		};
	};
};