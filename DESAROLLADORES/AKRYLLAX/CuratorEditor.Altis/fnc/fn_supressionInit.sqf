PP_radial = ppEffectCreate ["radialBlur",100];
PP_chrom = ppEffectCreate ["ChromAberration",200];
PP_colorC = ppEffectCreate ["ColorCorrections",1500];
PP_dynamic = ppEffectCreate ["DynamicBlur",500];

lastTick = diag_tickTime - 1;

AKR_fnc_addSupressionEffect = {

	deltaTime = diag_tickTime - lastTick;

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
	
	lastTick = _diag_tickTime;
	
	// Time: 7:4. Overcast: 0. Fog: 0 
	// GF PostProcess Editor parameters: Copy the following line to clipboard and click Import in the editor.
	//[[true,100,[0.042,0.052,0.263,0.3]],[true,200,[0.01,0.01,true]],[false,300,[2,0.4,0.4,2,1,-2,-1,0.1,0.01,0.1,0.01,0.02,0.05,1,1]],[true,1500,[0.253,0.856,0.262,[0,0,0,0.2],[5,3.419,1,1],[0,-3.814,-5.623,0],[0.547,0.751,0,0,0,0,0.83]]],[true,500,[0.25]],[false,2000,[0.3,5,5,2,2,true]],[false,2500,[0.118,0.096,0.126]]]
};

["supressEffect", "onEachFrame", AKR_fnc_addSupressionEffect, []] call BIS_fnc_addStackedEventHandler;

this addEventHandler["Fired", AKR_fnc_onFireHandler];