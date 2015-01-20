/*
	Whatever
*/

private["_raceID"];

_this spawn {
	_raceID = [_this, 0, "", [""]] call BIS_fnc_param;

	if(count _raceID == 0) exitWith {};

	_spawnPos = getMarkerPos (format["%1_spawn", _raceID]);

	if(count currentTrack == 0) exitWith { hint "Tack not loaded correctly"; };

	_temp = ((_spawnPos) vectorFromTo getMarkerPos (currentTrack select 0));
	_dir = (_temp select 0) atan2 (_temp select 1);

	_car = "C_Hatchback_01_sport_F" createVehicle _spawnPos;
	_car setDir _dir;

	_arr = "Sign_Arrow_Direction_F" createVehicleLocal (position _car);
	_arr attachTo [_car, [0,0,1.2]];

	while {inRace} do {
		_fromTo = ((position _car) vectorFromTo (position currentOrb));	
		_arr setDir ((_fromTo select 0) atan2 (_fromTo select 1)) - (getDir _car);
	
		sleep 0.05;
	};
	
	_car
};