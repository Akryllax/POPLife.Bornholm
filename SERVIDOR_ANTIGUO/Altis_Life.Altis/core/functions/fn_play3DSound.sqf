/*
	File: fn_play3DSounds.sqf
	
	Author: Akryllax
	Desc: So... Take a guess. *Tip: Soundfile MUST be in Description.ext.
*/

private["_soundName", "_speaker"];

_soundName = [_this, 0, "",[""]] call BIS_fnc_param;
_speaker =	 [_this, 1, objNull,[objNull]] call BIS_fnc_param;

if(_soundName == "") exitWith {}; //Bad param.
if(isNull _speaker) exitWith {}; //Bad speaker.

_speaker say3D _soundName;