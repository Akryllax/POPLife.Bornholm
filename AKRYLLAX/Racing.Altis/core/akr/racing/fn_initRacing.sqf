/*
	File: fn_initRacing.sqf
	Author: Akryllax
	Desc: Loads tracks to array and sets up some stuff.
*/

[] spawn {

	waitUntil {time > 0};

	if(isServer) then {	
		/*
			Emulate life_server
		*/
		
		racing_tracks = [];
		racing_current = [];

		_i = 1;
		_name = format["race_%1%2_001", if(_i > 9) then [{""}, {"0"}], _i];

		while {!(getMarkerPos _name isEqualTo [0,0,0])} do {
			_name = format["race_%1%2", if(_i > 9) then [{""}, {"0"}], _i];
			racing_tracks pushBack [_name, false];

			_i = _i + 1;
			_name = format["race_%1%2_001", if(_i > 9) then [{""}, {"0"}], _i];
		};
		
		publicVariable "racing_tracks";
		publicVariable "racing_current";
	} else {
		currentTrack = [];
		currentTrackOrbs = [];
	};
};