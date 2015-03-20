/*
	File: fn_spawnPointSelected.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Sorts out the spawn point selected and does a map zoom.
*/
disableSerialization;
private["_control","_selection","_spCfg","_sp"];
_control = [_this,0,controlNull,[controlNull]] call BIS_fnc_param;
_selection = [_this,1,0,[0]] call BIS_fnc_param;

_spCfg = getArray(missionConfigFile >> "spawnPoints" >> worldName >> str(playerSide));

if(count life_houses > 0) then {
	{
		_pos = call compile format["%1",_x select 0];
		_house = nearestBuilding _pos;
		_houseName = getText(configFile >> "CfgVehicles" >> (typeOf _house) >> "displayName");
		
		_spCfg pushBack [_houseName,format["house_%1",_house getVariable "uid"],"\a3\ui_f\data\map\MapControl\lighthouse_ca.paa","true"];
	} foreach life_houses;
};

_sp = _spCfg select (_control lnbValue[_selection,0]);
_spawnMarker = _sp select 1;

if(!isNil {_sp select 4}) then {
	_spawnMarker = call compile (_sp select 4);
};

[((findDisplay 38500) displayCtrl 38502),1,0.05,getMarkerPos _spawnMarker] call life_fnc_setMapPosition;
((findDisplay 38500) displayCtrl 38502) ctrlEnable false;
life_spawn_point = _sp;

ctrlSetText[38501,format["%2: %1",_sp select 0,localize "STR_Spawn_CSP"]];