/*
	File: fn_initDaemons.sqf
	Author: Akryllax
	Desc: Add here the permanent daemons for ingame.
 */

waitUntil {time > 0};

switch (side player) do {
	case civilian: {
		AKR_savePositionDaemon = {
			sleep 60;
			
			while {true} do {
				sleep 30;
				[23] call SOCK_fnc_updatePartial;
			};
		};

		AKR_saveAlive = {
			_oldValue = life_is_alive;
			sleep 60;
			while {true} do {
				waitUntil {!(life_is_alive isEqualTo _oldValue)};
				if(life_is_alive) then {
					[] call life_fnc_onIngameReborn;
				} else {
					[] call life_fnc_onIngameKilled;
				};
				_oldValue = life_is_alive;
				[24] call SOCK_fnc_updatePartial;
			};
		};

		[] spawn AKR_savePositionDaemon;
		[] spawn AKR_saveAlive;
	};
};