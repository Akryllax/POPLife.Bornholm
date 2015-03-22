/*
	File: fn_revived.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	THANK YOU JESUS I WAS SAVED!
*/
private["_medic","_dir"];
if(isDedicated) exitWith {};
_medic = [_this,0,"Unknown Medic",[""]] call BIS_fnc_param;
_oldGear = [life_corpse] call life_fnc_fetchDeadGear;
[_oldGear] spawn life_fnc_loadDeadGear;
life_corpse setVariable["realname",nil,true]; //Should correct the double name sinking into the ground.

//Add the revived to the log
_text = format["Revived by %1",_medic];
[life_corpse,_text] call life_fnc_medilogSubmit;
player setVariable["medilog",(life_corpse getVariable["medilog",[]]),true];

[[life_corpse],"life_fnc_corpse",nil,FALSE] spawn life_fnc_MP;
_dir = getDir life_corpse;
hint format[localize "STR_Medic_RevivePay",_medic,0];

closeDialog 0;
life_deathCamera cameraEffect ["TERMINATE","BACK"];
camDestroy life_deathCamera;

//Take fee for services.
/*if(ALUK_bankedwonga > (call life_revive_fee)) then {
	ALUK_bankedwonga = ALUK_bankedwonga - (call life_revive_fee);
} else {
	ALUK_bankedwonga = 0;
};
*/

//Retexturing of units clothing, vanilla files only retexture the EMS unit.
[player, true] call life_fnc_HandleUniforms; //NDJ 21Jul14 choose uniform retexture and send it to everyone.
{_x hideObjectGlobal false;} forEach life_containers;

//Bring me back to life.
player setDir _dir;
player setPosASL (visiblePositionASL life_corpse);
life_corpse setVariable["Revive",nil,TRUE];
life_corpse setVariable["name",nil,TRUE];
[[life_corpse],"life_fnc_corpse",true,false] spawn life_fnc_MP;
hideBody life_corpse;
player setVariable["Revive",nil,TRUE];
player setVariable["name",nil,TRUE];
player setVariable["Reviving",nil,TRUE];
player setVariable["medideadtime",nil,true];
player enableFatigue false;

if(life_nlrtimer_running) then {life_nlrtimer_stop = true};

[] call life_fnc_hudUpdate; //Request update of hud.
[25] call life_fnc_addXP;