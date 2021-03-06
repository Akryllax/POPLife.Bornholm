/*
	File: fn_drugsEffects.sqf
	Author: Telo

	Description: Efectos de las drogas
*/


private["_drug"];
_drug = [_this,0,"",[""]] call BIS_fnc_param;
if (_drug == "") exitWith{};

switch(_drug) do {
	case "marijuana": {
		closeDialog 0;

		sleep 3;

		"chromAberration" ppEffectEnable true;
		"radialBlur" ppEffectEnable true;
		enableCamShake true;
		_smoke = "SmokeShell" createVehicle position player;
		if (vehicle player != player) then { _smoke attachTo [vehicle player, [-0.6,-1,0]]; }
		else { _smoke attachTo [player, [0,-0.1,1.0]]; };

		for "_i" from 0 to 120 do
		{
		    "chromAberration" ppEffectAdjust [random 0.25,random 0.25,true];
		    "chromAberration" ppEffectCommit 1;
		    "radialBlur" ppEffectAdjust  [random 0.02,random 0.02,0.15,0.15];
		    "radialBlur" ppEffectCommit 1;
		    addcamShake[random 3, 1, random 3];
		    sleep 1;
		};

		//Paramos los efectos
		"chromAberration" ppEffectAdjust [0,0,true];
		"chromAberration" ppEffectCommit 5;
		"radialBlur" ppEffectAdjust  [0,0,0,0];
		"radialBlur" ppEffectCommit 5;
		sleep 6;

		//Desactivamos los efectos
		"chromAberration" ppEffectEnable false;
		"radialBlur" ppEffectEnable false;
		resetCamShake;
	};
	case "cocainep": {
		closeDialog 0;

		sleep 3;

		"chromAberration" ppEffectEnable true;
		"radialBlur" ppEffectEnable true;
		enableCamShake true;

		for "_i" from 0 to 44 do
		{
		    "chromAberration" ppEffectAdjust [random 0.25,random 0.25,true];
		    "chromAberration" ppEffectCommit 1;
		    "radialBlur" ppEffectAdjust  [random 0.02,random 0.02,0.15,0.15];
		    "radialBlur" ppEffectCommit 1;
		    addcamShake[random 3, 1, random 3];
		    sleep 1;
		};

		"chromAberration" ppEffectAdjust [0,0,true];
		"chromAberration" ppEffectCommit 5;
		"radialBlur" ppEffectAdjust  [0,0,0,0];
		"radialBlur" ppEffectCommit 5;
		sleep 6;

		"chromAberration" ppEffectEnable false;
		"radialBlur" ppEffectEnable false;
		resetCamShake;
	};
	
		case "heroinp": {
		
		/*
	@Version: 1.0
	@Author: Tonic, [BWG] Joe
	@Edited: 28.08.2013
*/
"dynamicBlur" ppEffectEnable true; // enables ppeffect
"dynamicBlur" ppEffectAdjust [0]; // enables normal vision
"dynamicBlur" ppEffectCommit 15; // time it takes to normal
resetCamShake; // resets the shake
20 fadeSound 1;	 //fades the sound back to normal





"dynamicBlur" ppEffectEnable true; // enables ppeffect
"dynamicBlur" ppEffectAdjust [20]; // intensity of blur
"dynamicBlur" ppEffectCommit 3; // time till vision is fully blurred
enableCamShake true;	 // enables camera shake
addCamShake [10, 45, 10];	// sets shakevalues

5 fadeSound 0.1;	 // fades the sound to 10% in 5 seconds


sleep 35;

"dynamicBlur" ppEffectEnable true; // enables ppeffect
"dynamicBlur" ppEffectAdjust [0]; // enables normal vision
"dynamicBlur" ppEffectCommit 15; // time it takes to normal
resetCamShake; // resets the shake
20 fadeSound 1;	 //fades the sound back to normal
	
	};
};