/*
	File: fn_wantedFetch.sqf
	Author: Bryan "Tonic" Boardwine"
	
	Description:
	Displays wanted list information sent from the server.
*/
private["_ret","_list","_jailedUnits"];
_ret = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _ret) exitWith {};

diag_log "------- WANTED LIST DUMP -------";
diag_log parseText format["%1", life_wanted_list];
diag_log "--------------------------------";

_ret = owner _ret;
_jailedUnits = [];
if(count life_wanted_list < 1) exitWith {};
{if(_x distance (getMarkerPos "jail_marker") < 120) then {_jailedUnits pushBack getPlayerUID _x}} forEach playableUnits;

_list = [];
{
	if(!((typeName _x != "ARRAY") || count _x < 1)) then {
		_uid = _x select 1;
		if([_uid] call life_fnc_isUIDActive) then
		{
			if(!(_uid in _jailedUnits)) then {
				_list pushBack _x;
			};
		};
	};
} forEach life_wanted_list;
[[_list],"life_fnc_wantedList",_ret,false] spawn life_fnc_MP;