enableSaving [false, false];

[] spawn {
	waitUntil { time > 0 };
	
	funcAddObjects = {
		private ["_pos"];
	};

	(findDisplay 46) displayAddEventHandler["onMouseButtonDblClick", "hint str _this; false"];
	curModule addEventHandler["CuratorGroupDoubleClicked", "hint str _this; false"];
};

waitUntil{time > 0};

/*
AKR_fnc_onFireHandler 		= compileFinal preprocessFileLineNumbers "/fnc/fn_onFireHandler.sqf";
AKR_fnc_recieveSupression	= compileFinal preprocessFileLineNumbers "/fnc/fn_recieveSupression.sqf";
AKR_fnc_supressionConfig 	= compileFinal preprocessFileLineNumbers "/fnc/fn_supressionConfig.sqf";
AKR_fnc_supressionInit		= compileFinal preprocessFileLineNumbers "/fnc/fn_supressionInit.sqf";
*/

[] call AKR_fnc_supressionConfig;
[] call AKR_fnc_supressionInit;

player addEventHandler["Fired", AKR_fnc_onFireHandler];

/*
// Config emulation
supress_minDistance = 10;

supress_ammount = 0;
supress_maxAmmount = 10;
supress_factor = 7;

supress_delay = 0;
supress_maxDelay = 5;

supress_recoveryFactor = 3;


PP_radial = ppEffectCreate ["radialBlur",100];
PP_chrom = ppEffectCreate ["ChromAberration",200];
PP_colorC = ppEffectCreate ["ColorCorrections",1500];
PP_dynamic = ppEffectCreate ["DynamicBlur",500];

lastTick = diag_tickTime - 1;

AKR_fnc_addSupressionEffect = {

	deltaTime = lastTick - diag_tickTime;

	_factor = supress_ammount / supress_maxAmmount;

	PP_radial ppEffectEnable true;
	PP_radial ppEffectAdjust [0.042 * (_factor),0.052  * (_factor),0.263  * (_factor),0.3 * (_factor)];
	PP_radial ppEffectCommit 0;

	PP_chrom ppEffectEnable true;
	PP_chrom ppEffectAdjust [0.03 * (_factor),0.03  * (_factor),true];
	PP_chrom ppEffectCommit 0;
	
	PP_colorC ppEffectEnable true;
	PP_colorC ppEffectAdjust [((1 - _factor) + 0.1 * _factor),((1 - _factor) + 0.856 * _factor),(0.262 * _factor),[0,0,0,0],[4 * _factor + 1,2.419 * _factor + 1,1,1],[0,-3.814,-5.623,0],[0.547,0.751,0,0,0,0,(4 * (1.0 - _factor) + 0.83 * _factor)]];
	PP_colorC ppEffectCommit 0;
		
	PP_dynamic ppEffectEnable true;
	PP_dynamic ppEffectAdjust [0.25 * _factor];
	PP_dynamic ppEffectCommit 0;
		
	if(supress_delay > 0) then {
		supress_delay = supress_delay - 0.025;
	} else {
		if(supress_ammount > 0) then {
			supress_ammount = supress_ammount - (supress_recoveryFactor * 0.025);
		};
	};
	
	lastTick = _deltaTime;
	
	// Time: 7:4. Overcast: 0. Fog: 0 
	// GF PostProcess Editor parameters: Copy the following line to clipboard and click Import in the editor.
	//[[true,100,[0.042,0.052,0.263,0.3]],[true,200,[0.01,0.01,true]],[false,300,[2,0.4,0.4,2,1,-2,-1,0.1,0.01,0.1,0.01,0.02,0.05,1,1]],[true,1500,[0.253,0.856,0.262,[0,0,0,0.2],[5,3.419,1,1],[0,-3.814,-5.623,0],[0.547,0.751,0,0,0,0,0.83]]],[true,500,[0.25]],[false,2000,[0.3,5,5,2,2,true]],[false,2500,[0.118,0.096,0.126]]]
};

["supressEffect", "onEachFrame", AKR_fnc_addSupressionEffect, []] call BIS_fnc_addStackedEventHandler;

//Fired EventHandler

bulletCount = 1;

AKR_onFireHandler = {
	_unit = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
	_weap = [_this, 1, "", [""]] call BIS_fnc_param;
	_muzz = [_this, 2, "", [""]] call BIS_fnc_param;
	_mode = [_this, 3, "", [""]] call BIS_fnc_param;
	_ammo = [_this, 4, "", [""]] call BIS_fnc_param;
	_maga = [_this, 5, "", [""]] call BIS_fnc_param;
	_proj = [_this, 6, objNull, [objNull]] call BIS_fnc_param;
	
	_initialSpeed = vectorMagnitude (velocity _proj);
	
	waitUntil{!alive _proj || (vectorMagnitude (velocity _proj) < _initialSpeed * 0.8)};
	_manArray = nearestObjects [getPos _proj, ["Man"], supress_minDistance];
	
	{
		[_proj distance _x, "AKR_recieveSupression", _x] call BIS_fnc_MP;
	} forEach (_manArray);
};

AKR_recieveSupression = {
	_distance = [_this, 0, -1, [-1]] call BIS_fnc_param;

	supress_ammount = supress_ammount + (_distance / supress_minDistance) * supress_factor;
	if(supress_ammount > supress_maxAmmount) then {
		supress_ammount = supress_maxAmmount;
	};
	
	[player, 0.5] call BIS_fnc_dirtEffect;
	addCamShake [1 * (supress_ammount / supress_maxAmmount), 0.7, 1000];
	
	supress_delay = supress_maxDelay;
};

publicVariable "AKR_onFireHandler";
publicVariable "AKR_recieveSupression";
*/