/*
	File: fn_startTrackAction.sqf
	Author: Akryllax
	Desc: Starts a race!
*/

private["_raceID"];

hint "Starting track";

_raceID = [_this select 3, 0, "", [""]] call BIS_fnc_param;

[_raceID] call AKR_fnc_loadTrack;
[_raceID, [_raceID] call AKR_fnc_loadVehicle] call AKR_fnc_startRace;