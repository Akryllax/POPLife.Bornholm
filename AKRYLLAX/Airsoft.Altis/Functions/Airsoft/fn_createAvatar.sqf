/*
	File: fn_createAvatar.sqf
	Author: Akryllax
	Desc: Creates an avatar.
	
*/

_this spawn {
	
		missionNamespace setVariable["originalAvatar", player];
		player allowDamage false;
		player enableSimulation false;
	
		private["_side"];
		
		_side = [_this, 3, "error", [""]] call BIS_fnc_param;
		missionNamespace setVariable["airsoftNPC", _this select 0];
		
		if(_side isEqualTo "error") exitWith { hint "Error selecting side."; };
		
		if(_side == "red") then {
			
			hint "Spawning as red";
						
			_tempGroup = createGroup OPFOR;
			"O_Soldier_VR_F" createUnit [(getMarkerPos "airsoft_spawn_red") vectorAdd[0,0,10], _tempGroup];
			waitUntil{count (units _tempGroup) > 0};
			_unit = (units _tempGroup) select 0;
			
			if(isNull _unit) exitWith {hint "Error: No quedan grupos. Espera 30 segundos para volver a intentarlo." };
			
			[_unit] join airsoft_redGroup;
			_unit setPos ((getMarkerPos "airsoft_spawn_red") vectorAdd[0,0,10]);
			missionNamespace setVariable["remoteAvatar", _unit];
			deleteGroup _tempGroup;
			
			player allowDamage false;
			player enableSimulation false;
			player setPos (getMarkerPos "marker_airsoft_avatarSafe");

			_avatar = missionNamespace getVariable["remoteAvatar", objNull];
			selectPlayer _avatar;
			
			removeHeadgear _avatar;
			removeGoggles _avatar;
			
			_avatar addEventHandler ["killed", {hint "Avatar killed..."; [] call AKR_fnc_backtoPlayer;}];
			
			_avatar addBackpack "B_Carryall_Base";
			(unitBackpack _avatar) setObjectTextureGlobal[0,""];
			_avatar addWeapon (AirsoftWeapons select 0);
			for "_ammo" from 0 to 6 do {
				_avatar addMagazine (AirsoftWeapons select 1);
			};
			_avatar addItem "HandGrenade";
			_avatar addMagazine "HandGrenade";
			_avatar addItem "ItemMap";
			_avatar assignItem "ItemMap";
			_avatar addItem "ItemCompass";
			_avatar assignItem "ItemCompass";
			_avatar addItem "ItemGPS";
			_avatar assignItem "ItemGPS";
			
			_avatar addAction["Salir del airsoft", {[] call AKR_fnc_backtoPlayer}];
		};
		
		if(_side == "blue") then {
		
			hint "Spawning as blue";
							
			_tempGroup = createGroup OPFOR;
			"B_Soldier_VR_F" createUnit [(getMarkerPos "airsoft_spawn_red") vectorAdd[0,0,10], _tempGroup];
			waitUntil{count (units _tempGroup) > 0};
			_unit = (units _tempGroup) select 0;
			
			if(isNull _unit) exitWith {hint "Error: No quedan grupos. Espera 30 segundos para volver a intentarlo." };
						
			[_unit] join airsoft_blueGroup;
			_unit setPos ((getMarkerPos "airsoft_spawn_blue") vectorAdd[0,0,10]);
			missionNamespace setVariable["remoteAvatar", _unit];
			deleteGroup _tempGroup;
			
			player allowDamage false;
			player enableSimulation false;
			player setPos (getMarkerPos "marker_airsoft_avatarSafe");
			
			_avatar = missionNamespace getVariable["remoteAvatar", objNull];
			if(isNull _avatar) exitWith { hint "Ha habido un problema cargando el NPC" };
			selectPlayer _avatar;
			
			removeHeadgear _avatar;
			removeGoggles _avatar;
			
			_avatar addEventHandler ["killed", {hint "Avatar killed..."; [] call AKR_fnc_backtoPlayer;}];

			_avatar addBackpack "B_Carryall_Base";
			(unitBackpack _avatar) setObjectTextureGlobal[0,""];
			_avatar addWeapon (AirsoftWeapons select 0);
			for "_ammo" from 0 to 6 do {
				_avatar addMagazine (AirsoftWeapons select 1);
			};
			_avatar addItem "HandGrenade";
			_avatar addMagazine "HandGrenade";
			_avatar addItem "ItemMap";
			_avatar assignItem "ItemMap";
			_avatar addItem "ItemCompass";
			_avatar assignItem "ItemCompass";
			_avatar addItem "ItemGPS";
			_avatar assignItem "ItemGPS";
			
			_avatar addAction["Salir del airsoft", {[] call AKR_fnc_backtoPlayer}];
		};
	};