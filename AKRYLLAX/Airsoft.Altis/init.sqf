enableSaving[false,false];

life_serverIsFuckingReady = true;

[] spawn {
	waitUntil{time > 0};
	sleep 5;
	[] execVM "configuration.sqf";
	[50,50,30,500,"airsoft_scenaryOrigin"] call AKR_fnc_startAirsoft;
};