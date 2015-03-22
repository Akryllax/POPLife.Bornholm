/*
	File: fn_onPlayerKilled.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	When the player dies collect various information about that player
	and pull up the death dialog / camera functionality.
*/
private["_unit","_killer"];
disableSerialization;
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_killer = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;

//Set some vars
_unit setVariable["Revive",FALSE,TRUE]; //Set the corpse to a revivable state.
_unit setVariable["name",profileName,TRUE]; //Set my name so they can say my name.
_unit setVariable["restrained",FALSE,TRUE];
_unit setVariable["Escorting",FALSE,TRUE];
_unit setVariable["transporting",FALSE,TRUE]; //Why the fuck do I have this? Is it used?
_unit setVariable["steam64id",(getPlayerUID player),true]; //Set the UID.
_unit setVariable["medideadtime",serverTime,true];

//Medilog stuff
_text = "";
if(!isNull _killer) then {
	if(isPlayer _killer) then {
		if(_killer == player) then {
			_text = "Unconscious due to self induced damage.";
		} else {
			_text = format["Unconscious because of %1",name _killer];
		};
	} else {
		_text = "Unconscious due to unknown cause.";
	};
} else {
	_text = "Unconscious due to self induced damage.";
};
[_unit,_text] call life_fnc_medilogSubmit;

//Setup our camera view
life_deathCamera  = "CAMERA" camCreate (getPosATL _unit);
showCinemaBorder TRUE;
life_deathCamera cameraEffect ["Internal","Back"];
createDialog "DeathScreen";
life_deathCamera camSetTarget _unit;
life_deathCamera camSetRelPos [0,3.5,4.5];
life_deathCamera camSetFOV .5;
life_deathCamera camSetFocus [50,0];
life_deathCamera camCommit 0;

(findDisplay 7300) displaySetEventHandler ["KeyDown","if((_this select 1) == 1) then {true}"]; //Block the ESC menu

//Create a thread for something?
_unit spawn
{
	private["_maxTime","_RespawnBtn","_Timer"];
	disableSerialization;
	_RespawnBtn = ((findDisplay 7300) displayCtrl 7302);
	_Timer = ((findDisplay 7300) displayCtrl 7301);
	
	_maxTime = time + (life_respawn_timer * 60);
	_RespawnBtn ctrlEnable false;
	waitUntil {_Timer ctrlSetText format[localize "STR_Medic_Respawn",[(_maxTime - time),"MM:SS.MS"] call BIS_fnc_secondsToString]; 
	round(_maxTime - time) <= 0 OR isNull _this OR life_request_timer};

	if (life_request_timer) then {
		_maxTime = time + (life_respawn_timer * 220);
		waitUntil {_Timer ctrlSetText format[localize "STR_Medic_Respawn",[(_maxTime - time),"MM:SS.MS"] call BIS_fnc_secondsToString]; 
		round(_maxTime - time) <= 0 || isNull _this};
	};
	life_request_timer = false; //resets increased respawn timer
	
	_RespawnBtn ctrlEnable true;
	_Timer ctrlSetText localize "STR_Medic_Respawn_2";
};

[] spawn life_fnc_deathScreen;

if(life_nlrtimer_running) then
{
	life_nlrtimer_stop = true;
	waitUntil {!life_nlrtimer_running};
};
[] spawn life_fnc_newLifeRule;

//Create a thread to follow with some what precision view of the corpse.
[_unit] spawn
{
	private["_unit"];
	_unit = _this select 0;
	waitUntil {if(speed _unit == 0) exitWith {true}; life_deathCamera camSetTarget _unit; life_deathCamera camSetPos (getPosATL player); life_deathCamera camSetRelPos [0,3.5,4.5]; life_deathCamera camCommit 0;};
};

//Make the killer wanted
if(!isNull _killer && {_killer != _unit} && {side _killer != west} && {alive _killer}) then {

	if (playerSide != west) then {
		//victim was not a cop...
		if(vehicle _killer isKindOf "LandVehicle") then {
			[[getPlayerUID _killer,_killer getVariable["realname",name _killer],"187V"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
		} else {
			[[getPlayerUID _killer,_killer getVariable["realname",name _killer],"187"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
		};
	}
	else {
		//victim was a cop - use cop-killer penalties instead!
		if(vehicle _killer isKindOf "LandVehicle") then {
			[[getPlayerUID _killer,_killer getVariable["realname",name _killer],"187VP"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
		} else {
			[[getPlayerUID _killer,_killer getVariable["realname",name _killer],"187P"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
		};
	};
};

//Killed by cop stuff...
if(side _killer == west && playerSide != west) then {
	
	//don't give bounty if cop killed me with vehicle!
	if (vehicle _killer == _killer) then {
		life_copRecieve = _killer;
	};
	//Did I rob the federal reserve?
	if(!life_use_atm && {ALUK_wonga > 0}) then {
		[format[localize "STR_Cop_RobberDead",[ALUK_wonga] call life_fnc_numberText],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
		ALUK_wonga = 0;
	};
};

if(!isNull _killer && {_killer != _unit}) then {
	life_removeWanted = true;
};

_handle = [_unit] spawn life_fnc_dropItems;
waitUntil {scriptDone _handle};

life_hunger = 100;
life_thirst = 100;
life_carryWeight = 0;
ALUK_wonga = 0;
[false] spawn life_fnc_breakLeg;
[] call life_fnc_hudUpdate; //Get our HUD updated.
[[player,life_sidechat,playerSide],"TON_fnc_managesc",false,false] spawn life_fnc_MP;
if(call life_wilcorank > 0) then {[[player],"TON_fnc_adminChatJoin",false,false] spawn life_fnc_MP;}; //If admin then send a request to join adminchat channel.

[0] call SOCK_fnc_updatePartial;
[3] call SOCK_fnc_updatePartial;