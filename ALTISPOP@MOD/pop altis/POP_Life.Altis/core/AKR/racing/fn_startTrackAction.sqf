/*
	File: fn_startTrackAction.sqf
	Author: Akryllax
	Desc: Starts a race!
*/

private["_raceID"];

hint "Starting track";

_raceID = [_this select 3, 0, "", [""]] call BIS_fnc_param;

if(_raceID in racing_current) exitWith {
	hint "Esta carrera ya esta en curso! Espera a que termine.";
};

if(inRace || (count currentTrackOrbs) > 0) exitWith {
	hint "Ya estas compitiendo";
};

_price = [[_raceID] call life_fnc_raceConf, 1, -1, [-1]] call BIS_fnc_param;

if(_price < 0) exitWith {
	hint "The hell??? Call Akry!!!!!!! ""-1""";
};

if(_price > life_cash) exitWith {
	hint "No tienes suficiente dinero";
};

life_cash = life_cash - _price;

[_raceID] call life_fnc_loadTrack;
[_raceID, [_raceID] call life_fnc_loadVehicle] call life_fnc_startRace;