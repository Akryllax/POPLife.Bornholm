/*
	File: fn_showNotification.sqf
	Author: Ciaran Langton
	For: AltisLife.co.uk

	Description: New notification system.
*/
#define BASE_ID 3000
disableSerialization;
_text = [_this,0,"",[""]] call BIS_fnc_param;

_ui = uiNameSpace getVariable ["playerHUD",displayNull];
if(isNull _ui) then {[] call life_fnc_hudSetup;};
_ui = uiNameSpace getVariable ["playerHUD",displayNull];

life_msg_array pushBack _text;

for "_i" from 0 to 10 do {
	_id = BASE_ID + _i;
	_text = "";
	if((count life_msg_array - 1) >= _i) then
	{
		_text = life_msg_array select _i;
	};
	_ctrl = _ui displayCtrl _id;

	_ctrl ctrlSetStructuredText parseText _text;
	if(_text == "") then {
		_ctrl ctrlSetFade 1;
		_ctrl ctrlCommit 0.4;
	} else {
		_ctrl ctrlSetFade 0;
		_ctrl ctrlCommit 0.4;
	};
};

sleep 15;

_final = _ui displayCtrl BASE_ID;
_final ctrlSetFade 1;
_final ctrlCommit 0.4;

life_msg_array set[0,-1];
life_msg_array = life_msg_array - [-1];

for "_i" from 0 to 10 do {
	_id = BASE_ID + _i;
	_ctrl = _ui displayCtrl _id;
	_ctrl ctrlSetFade 1;
	_ctrl ctrlCommit 0.1;

	_text = "";
	if((count life_msg_array - 1) >= _i) then
	{
		_text = life_msg_array select _i;
	};

	_ctrl ctrlSetStructuredText parseText _text;
	if(_text == "") then {
		_ctrl ctrlSetFade 1;
		_ctrl ctrlCommit 0.4;
	} else {
		_ctrl ctrlSetFade 0;
		_ctrl ctrlCommit 0.4;
	};
};