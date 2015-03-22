/*
	File: fn_updateRequest.sqf
	Author: Tonic, Ciaran
*/
private["_packet","_array","_flag"];
_packet = [getPlayerUID player,(profileName),playerSide,ALUK_wonga,ALUK_bankedwonga];
if(isNull player) exitWith {};
if(getPlayerUID player == "") exitWith {};
if(!(life_session_completed)) exitWith {};

_array = []; 
_flag = switch(playerSide) do {case west: {"cop"}; case civilian: {"civ"}; case independent: {"med"};};
{
	if(_x select 1 == _flag) then
	{
		_array pushBack [_x select 0,(missionNamespace getVariable (_x select 0))];
	};
} foreach life_licenses;
_packet pushBack _array;

[] call life_fnc_saveGear;
_packet pushBack life_gear;
_packet pushBack life_skills; //Set the skills onto the array.

_array = []; 
{
	if(_x select 1 == _flag) then
	{
		_array pushBack [_x select 0,(missionNamespace getVariable (_x select 0))];
	};
} foreach life_professions;
_packet pushBack _array;


switch (playerSide) do {
	case civilian: {
		_packet pushBack life_is_arrested;
		_packet pushBack life_crimes; //Set the crimes onto the array.
		_packet pushBack life_my_gang_rank; //Set the crimes onto the array.
	};
};

[_packet,"DB_fnc_updateRequest",false,false] spawn life_fnc_MP;