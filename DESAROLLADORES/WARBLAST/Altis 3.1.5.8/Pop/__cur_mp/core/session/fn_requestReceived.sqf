#include <macro.h>
/*
	File: fn_requestReceived.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Called by the server saying that we have a response so let's 
	sort through the information, validate it and if all valid 
	set the client up.
*/
life_session_tries = life_session_tries + 1;
if(life_session_completed) exitWith {}; //Why did this get executed when the client already initialized? Fucking arma...
if(life_session_tries > 3) exitWith {cutText[localize "STR_Session_Error","BLACK FADED"]; 0 cutFadeOut 999999999;};

_doMsg = {
	[
		format[
		"<t size='1.3' color='#5600FF'>%1</t><br/>%2.",_this select 0, _this select 1],
		0,
		0.2,
		99999999999999,
		0,
		0,
		8
	] spawn BIS_fnc_dynamicText;
};

["Session received",localize "STR_Session_Received"] call _doMsg;

0 cutFadeOut 9999999;

//Error handling and  junk..
if(isNil "_this") exitWith {[] call SOCK_fnc_insertPlayerInfo;};
if(typeName _this == "STRING") exitWith {[] call SOCK_fnc_insertPlayerInfo;};
if(count _this == 0) exitWith {[] call SOCK_fnc_insertPlayerInfo;};
if((_this select 0) == "Error") exitWith {[] call SOCK_fnc_insertPlayerInfo;};
if((getPlayerUID player) != _this select 0) exitWith {[] call SOCK_fnc_dataQuery;};

//Lets make sure some vars are not set before hand.. If they are get rid of them, hopefully the engine purges past variables but meh who cares.
if(!isServer && (!isNil "life_wilcorank" OR !isNil "life_plodrank" OR !isNil "life_samaritan" OR !isNil "life_rebellevel" OR !isNil "life_nhsrank")) exitWith {
	[[profileName,getPlayerUID player,"VariablesAlreadySet"],"ALUKAC_fnc_stashReport",false,false] spawn life_fnc_MP;
	[[profileName,format["Variables set before client initialization...\nlife_wilcorank: %1\nlife_plodrank: %2\nlife_samaritan: %3\nlife_rebellevel: %4\nlife_nhsrank: %5",life_wilcorank,life_plodrank,life_samaritan,life_rebellevel,life_nhsrank]],"ALUKAC_fnc_broadcastAlert",true,false] spawn life_fnc_MP;
	sleep 0.9;
	["ALUKAC",false,false] call compile PreProcessFileLineNumbers "\a3\functions_f\Misc\fn_endMission.sqf";
};


//Parse basic player information.
ALUK_wonga = parseNumber (_this select 2);
ALUK_bankedwonga = parseNumber (_this select 3);
__CONST__(life_wilcorank,parseNumber(_this select 4));
__CONST__(life_samaritan,parseNumber(_this select 5));

//Loop through licenses
if(count (_this select 6) > 0) then {
	{
		missionNamespace setVariable [(_x select 0),(_x select 1)];
	} foreach (_this select 6);
};

life_gear = _this select 8;

//Parse side specific information.
switch(playerSide) do {
	case west: {
		__CONST__(life_plodrank,parseNumber(_this select 7));
		__CONST__(life_nhsrank,0);
		life_blacklisted = _this select 9;
		life_skills = _this select 10;
		__CONST__(life_rebellevel,0);

		//Loop through professions
		if(count (_this select 11) > 0) then {
			{
				missionNamespace setVariable [(_x select 0),(_x select 1)];
			} foreach (_this select 11);
		};
		
		__CONST__(life_npasrank,parseNumber(_this select 12));
		__CONST__(life_mpurank,parseNumber(_this select 13));
		__CONST__(life_arrank,parseNumber(_this select 14));
	};
	
	case civilian: {
		life_is_arrested = _this select 7;
		__CONST__(life_plodrank,0);
		__CONST__(life_nhsrank,0);
		__CONST__(life_rebellevel,parseNumber(_this select 9));

		if(call life_rebellevel > 0) then
		{
			[[player],"TON_fnc_rebelGroupHandle",false,false] spawn life_fnc_MP;
		};

		life_crimes = _this select 10; //Set the crimes up from last session.
		life_skills = _this select 11;

		//Loop through professions
		if(count (_this select 12) > 0) then {
			{
				missionNamespace setVariable [(_x select 0),(_x select 1)];
			} foreach (_this select 12);
		};

		life_my_gang_rank = _this select 13;

		life_houses = _this select 15;
		{
			_house = nearestBuilding (call compile format["%1", _x select 0]);
			life_vehicles pushBack _house;
		} foreach life_houses;
		
		life_gangData = _this select 16;
		if(count life_gangData != 0 && (call life_rebellevel) < 1) then {
			[] spawn life_fnc_initGang;
			life_gang_spawnpoint = life_gangData select 6;  //gang spawnpoint.
		};
		[] spawn life_fnc_initHouses;
	};
	
	case independent: {
		__CONST__(life_nhsrank,parseNumber(_this select 7));
		__CONST__(life_plodrank,0);
		__CONST__(life_rebellevel,0);
		life_skills = _this select 9;

		//Loop through professions
		if(count (_this select 10) > 0) then {
			{
				missionNamespace setVariable [(_x select 0),(_x select 1)];
			} foreach (_this select 10);
		};
	};
};
[] call life_fnc_loadGear;

life_session_completed = true;