/*
	File: fn_spawnConfirm.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Spawns the player where he selected.
*/
private["_spCfg","_sp","_spawnPos"];
closeDialog 0;
if(count life_spawn_point == 0) then
{
	private["_sp","_spCfg"];
	_spCfg = getArray(missionConfigFile >> "spawnPoints" >> worldName >> str(playerSide));

	_sp = _spCfg select 0;
	
	if(playerSide == civilian) then
	{
		if(!isNil {life_spawn_point select 4} || isNil {(call compile format["%1", _sp select 1])}) then {
			if(!isNil {life_spawn_point select 4}) then {
					player setPos (getMarkerPos (call compile (life_spawn_point select 4)));
			} else {
				player setPos (getMarkerPos (_sp select 1));
			};
		} else {
			_spawnPos = (call compile format["%1", _sp select 1]) call BIS_fnc_selectRandom;
			_spawnPos = _spawnPos buildingPos 0;
			player setPos _spawnPos;
		};
	}
		else
	{
		player setPos (getMarkerPos (_sp select 1));
	};
	if(life_firstSpawn) then {
		life_firstSpawn = false;
		_script = [] spawn life_fnc_welcomeNotification;
		waitUntil {scriptDone _script};
	} else {
		cutText ["","BLACK IN"];
	};
	titleText[format["%2 %1",_sp select 0,localize "STR_Spawn_Spawned"],"PLAIN"];
}
	else
{
	if(playerSide == civilian) then
	{
		if(!isNil {life_spawn_point select 4} || isNil {(call compile format["%1",life_spawn_point select 1])}) then {
			if((["house",life_spawn_point select 1] call BIS_fnc_inString)) then {
				private["_bPos","_house","_pos"];
				_house = nearestObjects [getMarkerPos (life_spawn_point select 1),["House_F"],10] select 0;
				_bPos = [_house] call life_fnc_getBuildingPositions;

				if(count _bPos == 0) exitWith {
					player setPos (getMarkerPos (life_spawn_point select 1));
				};
				
				_pos = _bPos call BIS_fnc_selectRandom;
				player setPosATL _pos;
			} else {
				if(!isNil {life_spawn_point select 4}) then {
					player setPos (getMarkerPos (call compile (life_spawn_point select 4)));
				} else {
					player setPos (getMarkerPos (life_spawn_point select 1));
				};
			};
		} else {
			_spawnPos = (call compile format["%1", life_spawn_point select 1]) call BIS_fnc_selectRandom;
			_spawnPos = _spawnPos buildingPos 0;
			player setPos _spawnPos;
		};
	}
		else
	{
		player setPos (getMarkerPos (life_spawn_point select 1));
	};
	if(life_firstSpawn) then {
		life_firstSpawn = false;
		_script = [] spawn life_fnc_welcomeNotification;
		waitUntil {scriptDone _script};
	} else {
		cutText ["","BLACK IN"];
	};
	titleText[format["%2 %1",life_spawn_point select 0,localize "STR_Spawn_Spawned"],"PLAIN"];
};

[] call life_fnc_hudSetup;