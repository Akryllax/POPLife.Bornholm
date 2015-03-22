/*
	File: fn_spawnMenu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Initializes the spawn point selection menu.
*/
private["_spCfg","_sp","_ctrl"];
disableSerialization;

if(life_is_arrested) exitWith {
	[] call life_fnc_respawned;
};

if(life_respawned) then {
	[] call life_fnc_respawned;
};
cutText["","BLACK FADED"];
0 cutFadeOut 9999999;

if(!(createDialog "life_spawn_selection")) exitWith {[] call life_fnc_spawnMenu;};
(findDisplay 38500) displaySetEventHandler ["keyDown","_this call life_fnc_displayHandler"];

_spCfg = getArray(missionConfigFile >> "spawnPoints" >> worldName >> str(playerSide));

if(count life_houses > 0) then {
	{
		_pos = call compile format["%1",_x select 0];
		_house = nearestBuilding _pos;
		_houseName = getText(configFile >> "CfgVehicles" >> (typeOf _house) >> "displayName");
		
		_spCfg pushBack [_houseName,format["house_%1",_house getVariable "uid"],"\a3\ui_f\data\map\MapControl\lighthouse_ca.paa","true"];
	} foreach life_houses;
};

_defaultSp = [];

_ctrl = ((findDisplay 38500) displayCtrl 38510);
{	
	if(call compile (_x select 3)) then {
		if(!isNil {_x select 4}) then {
			_sp = call compile (_x select 4);
			if(count _defaultSp < 1) then {_defaultSp = _x; _defaultSp set[1,_sp];};
			_ctrl lnbAddRow[_x select 0,_sp,""];
			_ctrl lnbSetPicture[[(lnbSize _ctrl select 0) - 1,0],_x select 2];
			_ctrl lnbSetData[[(lnbSize _ctrl select 0) - 1,0],_sp];
			_ctrl lnbSetValue[[(lnbSize _ctrl select 0) - 1,0],_forEachIndex];
		} else {
			if(count _defaultSp < 1) then {_defaultSp = _x};
			_ctrl lnbAddRow[_x select 0,_x select 1,""];
			_ctrl lnbSetPicture[[(lnbSize _ctrl select 0) - 1,0],_x select 2];
			_ctrl lnbSetData[[(lnbSize _ctrl select 0) - 1,0],_x select 1];
			_ctrl lnbSetValue[[(lnbSize _ctrl select 0) - 1,0],_forEachIndex];
		};
	};
} foreach _spCfg;

_sp = _spCfg select 0; //First option is set by default

[((findDisplay 38500) displayCtrl 38502),1,0.05,getMarkerPos (_sp select 1)] call life_fnc_setMapPosition;
((findDisplay 38500) displayCtrl 38502) ctrlEnable false;
life_spawn_point = _sp;

ctrlSetText[38501,format["%2: %1",_sp select 0,localize "STR_Spawn_CSP"]];