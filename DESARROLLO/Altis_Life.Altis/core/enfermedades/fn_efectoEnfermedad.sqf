#define CONTAG_COUNT 1
#define CONTAG_PERIOD 10
#define CONTAG_RADIOUS 20
/*
	File: fn_efectoEnfermedad.sqf
	Author: Akryllax
	Desc: Spawns the illness FX. Pretty easy to understand. Don't forget doble brackes ;)
*/
private ["_input"];

_input = [_this, 0, "", [""]] call BIS_fnc_param;

if(count _input < 1) exitWith {};

diag_log parseText format["#@ Effect request: %1. @#", _input];

[] spawn (switch (_input) do {

	case "Tos" : 
	{
		{
			[[player, "Cough"],"life_fnc_say3D",true, false] call life_fnc_MP;

			"dynamicBlur" ppEffectEnable true;
			"dynamicBlur" ppEffectAdjust [6]; "dynamicBlur" ppEffectCommit 1;
			sleep 1;
			"dynamicBlur" ppEffectAdjust [0.5]; "dynamicBlur" ppEffectCommit 1;
			sleep 1;
			"dynamicBlur" ppEffectAdjust [1]; "dynamicBlur" ppEffectCommit 1;
			sleep 1;
			"dynamicBlur" ppEffectAdjust [0]; "dynamicBlur" ppEffectCommit 1;
			sleep 1;
			"dynamicBlur" ppEffectAdjust [0.5]; "dynamicBlur" ppEffectCommit 1;
			sleep 1;
			"dynamicBlur" ppEffectAdjust [1]; "dynamicBlur" ppEffectCommit 1;
			sleep 1;
			"dynamicBlur" ppEffectAdjust [0]; "dynamicBlur" ppEffectCommit 1;
		}
	};
	case "Tos dolorosa" : 
	{
		{
			player setDamage (damage player + 0.02);

			[30] call BIS_fnc_bloodEffect; 
			[[player, "Cough"],"life_fnc_say3D",true, false] call life_fnc_MP;
			
			"dynamicBlur" ppEffectEnable true;
			"dynamicBlur" ppEffectAdjust [6]; "dynamicBlur" ppEffectCommit 1;
			sleep 1;
			"dynamicBlur" ppEffectAdjust [0.5]; "dynamicBlur" ppEffectCommit 1;
			sleep 1;
			"dynamicBlur" ppEffectAdjust [1]; "dynamicBlur" ppEffectCommit 1;
			sleep 1;
			"dynamicBlur" ppEffectAdjust [0]; "dynamicBlur" ppEffectCommit 1;
			sleep 1;
			"dynamicBlur" ppEffectAdjust [0.5]; "dynamicBlur" ppEffectCommit 1;
			[30] call BIS_fnc_bloodEffect; 
			sleep 1;
			"dynamicBlur" ppEffectAdjust [1]; "dynamicBlur" ppEffectCommit 1;
			sleep 1;
			"dynamicBlur" ppEffectAdjust [0]; "dynamicBlur" ppEffectCommit 1;
		}
	};
	case "Temblores" : 
	{
		{
			addCamShake [1,10,15];
		}
	};
	case "Fiebre" : 
	{
	
	};
	case "Hemorragias externas" : 
	{
	
	};
	case "Vista borrosa" : //PERMA
	{
		{
			while {"Vista borrosa" in ([player getVariable["enfermo", false], player getVariable["enfermoLevel", false]] call AKR_enf_getArraySintomas)} do {
				"dynamicBlur" ppEffectEnable true;
				"dynamicBlur" ppEffectAdjust [1]; "dynamicBlur" ppEffectCommit 0;
				sleep 1;
			};
		};
	};
	case "Fatiga" : //PERMA
	{
		{
			player enableFatigue true;
			player setFatigue 1;
			sleep 2;
		
			while {"Fatiga" in ([player getVariable["enfermo", false], player getVariable["enfermoLevel", false]] call AKR_enf_getArraySintomas)} do {
				player enableFatigue true;
				player setFatigue 1;
				sleep 1;
			};

			waitUntil{getFatigue player < 0.3};
			player setFatigue 0;
			player enableFatigue false;
		}
	};
	case "Muerte" : //PERMA ¿LO DUDABAS?
	{
		{
			player setDamage 1;
		}
	};
	case "Sordera" : //PERMA
	{
		{
			2 fadeSound 0.05;
			sleep 2;
		
			while {"Sordera" in ([player getVariable["enfermo", false], player getVariable["enfermoLevel", false]] call AKR_enf_getArraySintomas)} do {
				1 fadeSound 0.05;
				sleep 1;
			};
			
			sleep 3;
			3 fadeSound 1;
		}
	};
	case "Debilidad" : //PERMA
	{
		while {"Debilidad" in ([player getVariable["enfermo", false], player getVariable["enfermoLevel", false]] call AKR_enf_getArraySintomas)} do {
			if(vehicle player != player && driver (vehicle player) == player) then {
				moveOut player;
			};

			if(primaryWeapon player != "" || secondaryWeapon player != "" || handgunWeapon player != "") then {
			
				player unassignItem "NVGoggles";
				player removeItem "NVGoggles";
				player unassignItem "NVGoggles_OPFOR";
				player removeItem "NVGoggles_OPFOR";
				player unassignItem "NVGoggles_INDEP";
				player removeItem "NVGoggles_INDEP";
			
				[] call AKR_playerWeapons2Ground;
			};
			
			sleep 3;
		};
	};
	case "Daltonismo severo" : //PERMA
	{
		{
			"colorCorrections" ppEffectEnable true;
			"colorCorrections" ppEffectAdjust [1, 2, -0.3, [0.75,0.7,0.7,0.98], [0,1,1,-35], [1,-9,-9,-0.7]];
			"colorCorrections" ppEffectCommit 5;
		
			sleep 5;
			
			while {"Daltonismo severo" in ([player getVariable["enfermo", false], player getVariable["enfermoLevel", false]] call AKR_enf_getArraySintomas)} do {
				"colorCorrections" ppEffectEnable true;
				"colorCorrections" ppEffectAdjust [1, 2, -0.3, [0.75,0.7,0.7,0.98], [0,1,1,-35], [1,-9,-9,-0.7]];
				"colorCorrections" ppEffectCommit 0;
				
				sleep 1;
			};
			
			sleep 5;
			
			"colorCorrections" ppEffectEnable true;
			"colorCorrections" ppEffectAdjust [1, 1, 0, [0.5,0.5,0.5,0], [1,1,1,1], [1,1,1,1]];
			"colorCorrections" ppEffectCommit 5;
		}
	};
	
	case "Daltonismo leve" : //PERMA
	{
		{
			"colorCorrections" ppEffectEnable true;
			"colorCorrections" ppEffectAdjust [1, 2, -0.3, [0.75,0.7,0.7,0.98], [0,1,1,-35], [1,-9,-9,-0.7]];
			"colorCorrections" ppEffectCommit 5;
		
			sleep 5;
			
			while {"Daltonismo leve" in ([player getVariable["enfermo", false], player getVariable["enfermoLevel", false]] call AKR_enf_getArraySintomas)} do {
				"colorCorrections" ppEffectEnable true;
				"colorCorrections" ppEffectAdjust [1, 2, -0.3, [0.75,0.7,0.7,0.98], [0,1,1,-35], [1,-9,-9,-0.7]];
				"colorCorrections" ppEffectCommit 0;
				
				sleep 1;
			};
			
			sleep 5;
			
			"colorCorrections" ppEffectEnable true;
			"colorCorrections" ppEffectAdjust [1, 1, 0, [0.5,0.5,0.5,0], [1,1,1,1], [1,1,1,1]];
			"colorCorrections" ppEffectCommit 5;
		}
	};
	
	case "Ceguera" : //PERMA
	{
		{
			"colorCorrections" ppEffectEnable true;
			"colorCorrections" ppEffectAdjust [1.45, 1.5, -0.75, [-0.5,-0.5,-0.5,0.45], [-0.2,-0.2,-0.2,0.9], [2,2,2,1]];
			"colorCorrections" ppEffectCommit 5;
		
			sleep 5;
			
			while {"Ceguera" in ([player getVariable["enfermo", false], player getVariable["enfermoLevel", false]] call AKR_enf_getArraySintomas)} do {
				"colorCorrections" ppEffectEnable true;
				"colorCorrections" ppEffectAdjust [1.45, 1.5, -0.75, [-0.5,-0.5,-0.5,0.45], [-0.2,-0.2,-0.2,0.9], [2,2,2,1]];
				"colorCorrections" ppEffectCommit 0;
				
				sleep 1;
			};
			
			sleep 5;
			
			"colorCorrections" ppEffectEnable true;
			"colorCorrections" ppEffectAdjust [1, 1, 0, [0.5,0.5,0.5,0], [1,1,1,1], [1,1,1,1]];
			"colorCorrections" ppEffectCommit 5;
		}
	};
	case "Disociacion" : //PERMA
	{
		{
			[] spawn {
				while {"Disociacion" in ([player getVariable["enfermo", false], player getVariable["enfermoLevel", false]] call AKR_enf_getArraySintomas)} do {
					playSound "UnderDrugs";
					sleep 12.634;
				};
			};
			"ChromAberration" ppEffectEnable true;
			"ChromAberration" ppEffectAdjust[ 0.4 * cos(time * 11 * PI + 1), 0.3 * sin(time * 17 * PI), false];
			"ChromAberration" ppEffectCommit 3;
			sleep 3;
			
			while {"Disociacion" in ([player getVariable["enfermo", false], player getVariable["enfermoLevel", false]] call AKR_enf_getArraySintomas)} do {
				"ChromAberration" ppEffectEnable true;
				"ChromAberration" ppEffectAdjust[ 0.4 * cos(time * 11 * PI + 1), 0.3 * sin(time * 17 * PI), false];
				"ChromAberration" ppEffectCommit 0.5;
				sleep 0.5;
			};
			
			"ChromAberration" ppEffectAdjust[0, 0, false];
			"ChromAberration" ppEffectCommit 5;
			sleep 5;
			"ChromAberration" ppEffectEnable false;
		}
	};
	case "Disociacion_temporal" : //PERMA
	{
		{
			_timeStamp = time;
		
			"ChromAberration" ppEffectEnable true;
			"ChromAberration" ppEffectAdjust[ 0.4 * cos(time * 11 * PI + 1), 0.3 * sin(time * 17 * PI), false];
			"ChromAberration" ppEffectCommit 0.5;
			sleep 0.5;
			
			while {"Disociacion_temporal" in ([player getVariable["enfermo", false], player getVariable["enfermoLevel", false]] call AKR_enf_getArraySintomas)} do {
				"ChromAberration" ppEffectEnable true;
				"ChromAberration" ppEffectAdjust[ 0.4 * cos(time * 11 * PI + 1), 0.3 * sin(time * 17 * PI), false];
				"ChromAberration" ppEffectCommit 0.5;
				sleep 0.5;
				
				if(_timeStamp + 120 < time) then {
					player setVariable["enfermo","",true];
					player setVariable["enfermoLevel",-1,true];
				};
			};
			
			"ChromAberration" ppEffectAdjust[0, 0, false];
			"ChromAberration" ppEffectCommit 5;
			sleep 5;
			"ChromAberration" ppEffectEnable false;
		}
	};
	case "Curar" :
	{
		{
			player setVariable["enfermo", "", true];
			player setVariable["enfermoLevel", -1, true];
		}
	};
	case "Hipotermia" : //PERMA
	{
		{
			addCamShake [1.2,30,30];
			sleep 10;
			while {"Hipotermia" in ([player getVariable["enfermo", false], player getVariable["enfermoLevel", false]] call AKR_enf_getArraySintomas)} do {
				addCamShake [1.2,30,30];
				sleep 10;
			};
		}	
	};
	case "Contagiosa" : //PERMA
	{
		{
			private["_nearUnitsTracker","_tempNear"];
			
			sleep 15; //Let's desync this to the other functions, as it makes tons of checks...
			
			_nearUnitsTracker = []; // [ [jugador1, count1], [jugador2,count2], ... , [jugador N, count N] ]
						
			while {"Contagiosa" in ([player getVariable["enfermo", false], player getVariable["enfermoLevel", false]] call AKR_enf_getArraySintomas)} do {
				
				_tempNear = player nearEntities ["Man", CONTAG_RADIOUS];
				if(count _tempNear > 0) then {
					{ 
						if(!((_x select 0) in _tempNear)) then {_nearUnitsTracker deleteAt _forEachIndex};
					} forEach _nearUnitsTracker; //Let's clear the tracker from Out of Sight units :)
					
					{
						_found = false;
						_unit = _x;
						if((_unit getVariable["enfermo",""]) == "") then { //Launch check only if player is not already infected
							{
								if(_found) exitWith{true}; //The hell? Already found! Keep going with outhers mate...
								if(_unit in _x) then { //If is already in the scope, let's update value.
									(_nearUnitsTracker select _forEachIndex) set [1, (_x select 1) + 1];
									_found = true;
									if((_x select 1) >= CONTAG_COUNT) then { //Oh... So you have been too long near him?? Let's fuck you up a little bit...
										[_unit, player getVariable["enfermo", false]] call life_fnc_infectarTo;
									};
								};
							} forEach _nearUnitsTracker;
							if(!_found && (isPlayer _unit) && (_unit != player)) then {
								_nearUnitsTracker pushBack [_unit, 1];
							};
						};
					} forEach (_tempNear);
				};
				sleep CONTAG_PERIOD;
			};
		};
	};
	
	case "Incubando" : //PERMA
	{
		{
			//It just doesn't do anything... It's for the incubation period.
		}
	};
		case "Incubando_reducido" : //PERMA
	{
		{
			_enfermedad = player getVariable["enfermo", ""];
		}
	};
	default {};
});