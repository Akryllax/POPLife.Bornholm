enableSaving [false, false];

[] spawn {
	waitUntil { time > 0 };
		
	[] call AKR_fnc_initRacing;
};