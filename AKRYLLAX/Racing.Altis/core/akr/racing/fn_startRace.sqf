/*
	Author: Akryllax
	Blablabla...
*/

private["_raceID", "_car"];

_raceID = [_this, 0, "", [""]] call BIS_fnc_param;
_car = [_this, 1, objNull, [objNull]] call BIS_fnc_param;

inRace = true;

//LOGICA de la carrera
[] spawn {
	_count = count currentTrackOrbs;
	waypointIndex = 0;
	player setVariable["waypointIndex", waypointIndex, true];
	while {inRace} do {
		waitUntil { ((position player) vectorDistance (position currentOrb) < 7) || !alive Player};
		if(!alive player) exitWith { inRace = false; };
		
		waypointIndex = waypointIndex + 1;
		player setVariable["waypointIndex", waypointIndex, true];
		
		if(waypointIndex < _count) then {
			currentOrb = currentTrackOrbs select waypointIndex;
		};
		if(waypointIndex == _count) then {
			hint "HAS GANADO";
		};
	};
};

//TEXTURAS
[] spawn {
	while {inRace} do{
		_cur = currentOrb;
		_found = false;
		
		waitUntil {!isNil "waypointIndex"};

		{
			if(waypointIndex < count currentTrackOrbs) then {
				if(_x == _cur) then {
					_found = true;
					_x setObjectTextureGlobal [0, "#(argb,8,8,3)color(0.098,0.369,0.812,1)"];
				} else {
					if(!_found) then {
						_x setObjectTextureGlobal [0, "#(argb,8,8,3)color(0.2,0.812,0.2,1)"];
					} else {
						_x setObjectTextureGlobal [0, "#(argb,8,8,3)color(0.812,0.2,0.2,1)"];
					};
				};
			} else {
				_x setObjectTextureGlobal [0, "#(argb,8,8,3)color(0.2,0.812,0.2,1)"];
			};
			
		} forEach (currentTrackOrbs);
		
		sleep 1;
	};
};