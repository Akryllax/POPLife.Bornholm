enableSaving [false, false];

[] spawn {
	waitUntil { time > 0 };
		
	life_cash = 0;
	raceStartTime = 0;
		
	[] call AKR_fnc_initRacing;
};