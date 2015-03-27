/*
	File: fn_startTrackAction.sqf
	Author: Akryllax
	Desc: Starts a race!
*/

private["_raceID"];

hint "Starting track";

_raceID = [_this select 3, 0, "", [""]] call BIS_fnc_param;
_conf   = [_raceID] call life_fnc_raceConf;
_mode 	= _conf select 0;
_price = [_conf, 1, -1, [-1]] call BIS_fnc_param;

if(inRace || (count currentTrackOrbs) > 0) exitWith {
	hint "Ya estas compitiendo";
};

if(_price < 0) exitWith {
	hint "The hell??? Call Akry!!!!!!! ""-1""";
};

if(_mode == 1) then {
	if(missionNamespace getVariable[("license_civ_driver"),false]) exitWith {
		hint "Ya tienes el permiso de conducir!";
	};
};

if(_price > life_cash) exitWith {
	hint "No tienes suficiente dinero";
};

life_cash = life_cash - _price;

[_raceID] call life_fnc_loadTrack;
[_raceID, [_raceID] call life_fnc_loadVehicle] call life_fnc_startRace;