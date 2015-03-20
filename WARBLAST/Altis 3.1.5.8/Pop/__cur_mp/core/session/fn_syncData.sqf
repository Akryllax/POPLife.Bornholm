/*
	File: fn_syncData.sqf
	Author: Bryan "Tonic" Boardwine"
	
	Description:
	Used for player manual sync to the server.
*/
_fnc_scriptName = "Player Synchronization";
private["_exit"];
if(isNil "life_session_time") then {life_session_time = false;};
if(life_session_time) exitWith {[localize "STR_Session_SyncdAlready"] spawn life_fnc_showNotification;};

switch (typeName ciaran_fnc_MP_packet) do
{
	case "ARRAY":
	{
		if(count ciaran_fnc_MP_packet == 0) exitWith
		{
			_exit = true;
		};
	};
	
	default {_exit = true;};
};

if(!isNil "_exit") exitWith {[localize "STR_Session_SyncCheater"] spawn life_fnc_showNotification;};

[] call SOCK_fnc_updateRequest;
[localize "STR_Session_SyncData"] spawn life_fnc_showNotification;
[] spawn
{
	life_session_time = true;
	sleep (5 * 60);
	life_session_time = false;
};
	