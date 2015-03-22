/*
	File: fn_goodbye.sqf
	Author: Ciaran Langton
	
	Description:
	Goodbye my lover... :(
*/
[] call SOCK_fnc_updateRequest;
//Make it so nothing goes wrong with the player.
disableSerialization;
player allowDamage false;
disableUserInput true;
showChat false;
hintSilent "";
//Turn off the player tags.
life_tagson = false;
[LIFE_ID_PlayerTags,"onEachFrame"] call BIS_fnc_removeStackedEventHandler;
1 fadeSound 0;
1 fadeMusic 0;
1 fadeRadio 0;
1 fadeSpeech 0;
life_disablehud = true; //Tell our hud to clear.
[] spawn life_fnc_hudUpdate;

_ui = uiNamespace getVariable ["Life_HUD_nameTags",displayNull];
if(!isNull _ui) then {
	{
		_idc = _ui displayCtrl _x;
		_idc ctrlShow false;
	} forEach life_nametags;
};

_introCam = "camera" camCreate (player modelToWorldVisual [-5,0,1.85]);
_introCam cameraEffect ["internal","back"];
_introCam camSetFov 2.000;
_introCam camSetTarget vehicle player;
_introCam camSetRelPos [0,-1,1.85];

_introCam camCommit 0;
waitUntil {camCommitted _introCam};

_introCam camSetFov 2;
_introCam camSetRelPos [0,-5,1.85];
_introCam camCommit 1;
8 cutFadeOut 3;
waitUntil {camCommitted _introCam};

_introCam camSetFov 9;
_introCam camSetRelPos [0,-5,1050.85];
_introCam camCommit 1.5;
waitUntil {camCommitted _introCam};

cutText ["","BLACK",1]; //Fade the screen to black, in prep for the outro.
sleep 1; //Wait for the fade.
["videos\outro.ogv"] spawn BIS_fnc_playVideo;
sleep 0.25;

_name = name player;

[
	format[
	"<t size='1.3' color='#5600FF'>Goodbye!</t><br/>We hope you visit us again soon %1. <br/><t size='1.1'>SYNCING DATA TO ALTISLIFE.CO.UK</t>",_name],
	0,
	0.2,
	10,
	0,
	0,
	8
] spawn BIS_fnc_dynamicText;


if(!life_is_arrested) then {
	player setPos (getMarkerPos "respawn_civilian");
};
sleep 4;
0 fadeSound 1;
0 fadeMusic 1;
0 fadeRadio 1;
0 fadeSpeech 1;
[[player],"TON_fnc_cleanupRequest",false,false] spawn life_fnc_MP;
showChat true;
disableUserInput false;
["",0,0.2,10,0,0,8] spawn BIS_fnc_dynamicText;
["Aborted",true,false] spawn BIS_fnc_endMission;
_introCam cameraEffect ["terminate","back"];
camDestroy _introCam;