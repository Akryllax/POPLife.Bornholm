/*
	File: fn_racingEnded.sqf
	Author: Akryllax
*/

[] spawn { //Clear stuff
	sleep 1;
	{ deleteVehicle _x; } forEach currentTrackOrbs;
	{ deleteVehicle _x } forEach currentTrackHelperOrbs;
	{ deleteMarker _x; } forEach currentTrack;
};

_this spawn {
	private["_raceID"];

	_trackID = [_this, 0, "",[""]] call BIS_fnc_param;
	
	inRace = false;
	player setVariable["raceFinished", true, true];
	player setVariable["inRace",inRace, true];
	
	_finishTime = time - raceStartTime;
	raceStartTime = 0;
	
	_raceConfig = [_trackID] call AKR_fnc_raceConf;
	
	_mode = _raceConfig select 0;
	_price = _raceConfig select 1;
	
	_firstCond = _raceConfig select 2;
	_secondCond = _raceConfig select 3;
	_thirdCond = _raceConfig select 4;

	if(_mode == 0) then {
		
		_medalla = "";
		_premio = 0;
		
		if(_finishTime < (_firstCond select 1)) then {
			_medalla = "Oro";
			_premio = _firstCond select 0;
		} else {
			if(_finishTime < (_secondCond select 1)) then {
				_medalla = "Plata";
				_premio = _secondCond select 0;
			} else {
				if(_finishTime < (_thirdCond select 1)) then {
					_medalla = "Bronce";
					_premio = _thirdCond select 0;
				};
			};
		};
		
		if(count _medalla == 0) then {
			hint parseText "<t color='#FF0000' size='1.5'>HAS PERDIDO</t>";
		} else {
		
			_color = switch (_medalla) do {
				case "Oro": {"#E6D525"};
				case "Plata": {"#C9C9C9"};
				case "Bronce": {"#965D0C"};
			};
		
			hint parseText format["<t color='#00FF00' size='1.5'>HAS GANADO</t><br/><t color='%3' size='1.5'>%1</t><br/><t align='left'>Has ganado %2€</t>", _medalla, _premio, _color];
			life_cash = life_cash + _premio;
		};
	};
};