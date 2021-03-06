/*
	File: fn_useHability.sqf
	Author: Akryllax
	
*/

private ["_hability", "_level"];

avatarMaxRadious = 30;
avatarEmissionRadious = 150;
transitionTime = 0.5;

if( isNil "avatarLoaded" ) then {
	avatarLoaded = "isLoaded";
};

transitIn = {
	PP_wetD = ppEffectCreate ["WetDistortion",300];
	PP_wetD ppEffectEnable true;
	PP_wetD ppEffectAdjust [1,0.1,0.1,-1.858,-1.707,0,0,0.216,-0.176,0.1,0.186,0.222,-0.532,1.76,-1.104];
	PP_wetD ppEffectCommit transitionTime;
	// Time: 8:32. Overcast: 0.612978. Fog: 0.361917 
	// GF PostProcess Editor parameters: Copy the following line to clipboard and click Import in the editor.
	//[[false,100,[0,0,0,0]],[false,200,[0,0,true]],[true,300,[1,0.1,0.1,-1.858,-1.707,0,0,0.216,-0.176,0.1,0.186,0.222,-0.532,1.76,-1.104]],[false,1500,[1,1,0,[0,0,0,0],[1,1,1,1],[0,0,0,0],[0,0,0,0,0,0,4]]],[false,500,[0]],[false,2000,[0,0,0,0,0,true]],[false,2500,[1,1,1]]]
};

transitOut = {
	PP_wetD ppEffectEnable true;
	PP_wetD ppEffectAdjust [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
	PP_wetD ppEffectCommit transitionTime;
	// Time: 8:34. Overcast: 0.612978. Fog: 0.361917 
	// GF PostProcess Editor parameters: Copy the following line to clipboard and click Import in the editor.
	//[[false,100,[0,0,0,0]],[false,200,[0,0,true]],[true,300,[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]],[false,1500,[1,1,0,[0,0,0,0],[1,1,1,1],[0,0,0,0],[0,0,0,0,0,0,4]]],[false,500,[0]],[false,2000,[0,0,0,0,0,true]],[false,2500,[1,1,1]]]
};

inEffect = {
	PP_radial = ppEffectCreate ["radialBlur",100];
	PP_radial ppEffectEnable true;
	PP_radial ppEffectAdjust [0.15,0.15,0.251,0.266];
	PP_radial ppEffectCommit transitionTime;
	PP_chrom = ppEffectCreate ["ChromAberration",200];
	PP_chrom ppEffectEnable true;
	PP_chrom ppEffectAdjust [0.01,0,true];
	PP_chrom ppEffectCommit transitionTime;
	PP_colorC = ppEffectCreate ["ColorCorrections",1500];
	PP_colorC ppEffectEnable true;
	PP_colorC ppEffectAdjust [1.257,1.106,-0.15,[0.9,1,-1.632,-0.2],[2.288,0.554,-5,1],[0,0,0,0],[0.799,0.703,0,0,0,0,1.19]];
	PP_colorC ppEffectCommit transitionTime;
	PP_dynamic = ppEffectCreate ["DynamicBlur",500];
	PP_dynamic ppEffectEnable true;
	PP_dynamic ppEffectAdjust [0.35];
	PP_dynamic ppEffectCommit transitionTime;
	PP_film = ppEffectCreate ["FilmGrain",2000];
	[] spawn {
		sleep transitionTime;
		PP_film ppEffectEnable true;
		PP_film ppEffectAdjust [0.171,2.816,0,10,0,true];
		PP_film ppEffectCommit transitionTime;
	};
	PP_colorI = ppEffectCreate ["ColorInversion",2500];
	PP_colorI ppEffectEnable true;
	PP_colorI ppEffectAdjust [0,0,0];
	PP_colorI ppEffectCommit transitionTime;

	// Time: 8:29. Overcast: 0.612978. Fog: 0.361917 
	// GF PostProcess Editor parameters: Copy the following line to clipboard and click Import in the editor.
	//[[true,100,[0.15,0.15,0.251,0.266]],[true,200,[0.01,0,true]],[false,300,[2,0.4,0.4,2,1,-2,-1,0.1,0.01,0.1,0.01,0.02,0.05,1,1]],[true,1500,[1.257,1.106,-0.15,[0.9,1,-1.632,-0.2],[2.288,0.554,-5,1],[0,0,0,0],[0.799,0.703,0,0,0,0,1.19]]],[true,500,[0.35]],[true,2000,[0.171,2.816,0,10,0,true]],[true,2500,[0,0,0]]]
};

outEffect = {
	PP_radial ppEffectEnable true;
	PP_radial ppEffectAdjust [0,0,0,0];
	PP_radial ppEffectCommit transitionTime;
	PP_chrom ppEffectEnable true;
	PP_chrom ppEffectAdjust [0,0,true];
	PP_chrom ppEffectCommit transitionTime;
	PP_colorC ppEffectEnable true;
	PP_colorC ppEffectAdjust [1,1,0,[0,0,0,0],[1,1,1,1],[0,0,0,0],[0,0,0,0,0,0,4]];
	PP_colorC ppEffectCommit transitionTime;
	PP_dynamic ppEffectEnable true;
	PP_dynamic ppEffectAdjust [0];
	PP_dynamic ppEffectCommit transitionTime;
	PP_film ppEffectEnable true;
	PP_film ppEffectAdjust [0,0,0,0,0,true];
	PP_film ppEffectCommit transitionTime;
	PP_colorI ppEffectEnable true;
	PP_colorI ppEffectAdjust [0,0,0];
	PP_colorI ppEffectCommit transitionTime;
	// Time: 8:30. Overcast: 0.612978. Fog: 0.361917 
	// GF PostProcess Editor parameters: Copy the following line to clipboard and click Import in the editor.
	//[[true,100,[0,0,0,0]],[true,200,[0,0,true]],[false,300,[2,0.4,0.4,2,1,-2,-1,0.1,0.01,0.1,0.01,0.02,0.05,1,1]],[true,1500,[1,1,0,[0,0,0,0],[1,1,1,1],[0,0,0,0],[0,0,0,0,0,0,4]]],[true,500,[0]],[true,2000,[0,0,0,0,0,true]],[true,2500,[0,0,0]]]
};

cameraFromTo = {
	private["_from", "_to", "_time"];
	
	_from = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
	_to = [_this, 1, objNull, [objNull]] call BIS_fnc_param;
	_time = [_this, 2, -1, [-1]] call BIS_fnc_param;
	
	if(isNull _from || isNull _to) exitWith {};
	if(_time < 0) then { _time = 1 };
	
	[] call transitIn;
	
	showCinemaBorder false;
	camUseNVG false;

	_camera = "camera" camCreate [(position _from) select 0, (position _from) select 1,(position _from select 2) + 1];
	_camera cameraEffect ["internal","back"];

	_camera camSetFOV 2.000;
	_camera camCommit 0;
	waitUntil {camCommitted _camera};

	_camera camSetTarget (vehicle _to);
	_camera camSetRelPos [0,0,2];
	_camera camCommit _time;
	waitUntil {camCommitted _camera};
	_camera cameraEffect ["terminate","back"];
	[] call transitOut;
	camDestroy _camera;
};

backToPlayer = {
	_avatar   = missionNamespace getVariable["remoteAvatar", objNull];
	_original = missionNamespace getVariable["originalAvatar", objNull];
	
	[_avatar, _original, transitionTime] spawn cameraFromTo;
	selectPlayer _original;

	[] call transitOut;
	[] call outEffect;
	_avatar setDamage 1;
	missionNamespace setVariable["inAvatar", false];
};

onAvatarKilled = {
	_this spawn {
		[] call avatarClearGear;
		sleep 0.1;
		_i = 1;
		while{_i > 0} do {
			(_this select 0) setObjectTextureGlobal [0, format["#(argb,8,8,3)color(%1,%1,%1,1)", _i]];
			_i = _i - 0.05;
			sleep 0.5;
		};
		sleep 10;
		deleteVehicle (_this select 0);
	};
};

onPlayerKilled = {
	[] call backToPlayer;
};

avatarDistance = {
	_avatar   = missionNamespace getVariable["remoteAvatar", objNull];
	_original = missionNamespace getVariable["originalAvatar", objNull];
	
	while {alive _avatar} do {
		if((getPos _avatar) distance (getPos _original)) then {
			[] call backToPlayer;
		};
		
		sleep 2;
	};
};

toEntity = {

	//SPAWN POINT CALCULATION
	_cursorPoint = screenToWorld [0.5,0.5];
	_avatarSpawn = [0,0,0];
	if(count _cursorPoint == 3) then {
		if(((position player) distance (_cursorPoint)) < avatarMaxRadious) then {
			diag_log "Using cursorPos";
			_avatarSpawn = _cursorPoint;
		} else {
			diag_log "Using calculated pos";
			_vectorFront = [sin(getDir player), cos(getDir player), 0];
			_vectorFront = _vectorFront vectorMultiply avatarMaxRadious;
			_avatarSpawn = (getPos player);
			_avatarSpawn = _avatarSpawn vectorAdd _vectorFront;
			diag_log format["Calculated pos is: %1", _avatarSpawn];
		};
	} else {
		diag_log "Using calculated pos";
		_vectorFront = [sin(getDir player), cos(getDir player), 0];
		_vectorFront = _vectorFront vectorMultiply avatarMaxRadious;
		_avatarSpawn = (getPos player);
		_avatarSpawn = _avatarSpawn vectorAdd _vectorFront;
		diag_log format["Calculated pos is: %1", _avatarSpawn];
	};
	hint format["CursorPos:%1\nUsing:%2\nDistance:%3", _cursorPoint, _avatarSpawn, (position player) distance (_cursorPoint)];
	
	//ACTUAL SPAWN
	missionNamespace setVariable["originalAvatar", player];
	_tempGroup = createGroup OPFOR;
	"B_Soldier_VR_F" createUnit [_avatarSpawn, _tempGroup];
	waitUntil{count (units _tempGroup) > 0};
	_unit = (units _tempGroup) select 0;
	missionNamespace setVariable["remoteAvatar", _unit];
	deleteGroup _tempGroup;
	
	_playerDir = getDir player;
	_avatar = missionNamespace getVariable["remoteAvatar", objNull];
	_original = missionNamespace getVariable["originalAvatar", objNull];
	
	[] call inEffect;
	[_original, _avatar, transitionTime] spawn cameraFromTo;
	_avatar setDir _playerDir;
	selectPlayer _avatar;
	_original stop true;
	_avatar addEventHandler["Killed", {_this call onAvatarKilled;}];
	_original addEventHandler["Killed", {[] call onPlayerKilled;}];
	[] call avatarLoadGear;
	
	missionNamespace setVariable["inAvatar", true];
};

avatarLoadGear = {
	_avatar = missionNamespace getVariable["remoteAvatar", objNull];
	_original = missionNamespace getVariable["originalAvatar", objNull];
	
	removeGoggles _avatar;
	removeHeadgear _avatar;
	
	_avatar addBackpack "B_Carryall_Base";
	(unitBackpack _avatar) setObjectTextureGlobal[0,""];
	
	_avatar addMagazine "16Rnd_9x21_Mag";
	_avatar addMagazine "16Rnd_9x21_Mag";
	_avatar addWeaponGlobal "hgun_Rook40_snds_F";

};

avatarClearGear = {
	_avatar = missionNamespace getVariable["remoteAvatar", objNull];
	_original = missionNamespace getVariable["originalAvatar", objNull];
	//removeAllAssignedItems _avatar;
	removeAllContainers _avatar;
	removeAllItems _avatar;
	removeAllWeapons _avatar;
};

//////////////////////////////////////////////////////////
//							MAIN						//
//////////////////////////////////////////////////////////

if!(missionNamespace getVariable["inAvatar", false]) then {
	[] spawn toEntity;
} else {
	[] spawn backToPlayer;
};