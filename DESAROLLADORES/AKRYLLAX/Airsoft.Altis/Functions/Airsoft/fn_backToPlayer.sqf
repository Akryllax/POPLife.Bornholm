/*
	File: fn_backToPlayer.sqf
	Author: Akryllax
	Desc: Bitch please...
*/

[] spawn {
	selectPlayer (missionNamespace getVariable["originalAvatar", objNull]);
	_npc = missionNamespace getVariable["airsoftNPC", objNull];
	if!(isNull _npc) then {
		player setPos (getPos _npc);
	} else {
		player setPos (getMarkerPos "marker_airsoft_avatarExitpoint");
	};
	sleep 1;
	
	player allowDamage true;
	player enableSimulation true;

	sleep 1;
	deleteVehicle (missionNamespace getVariable["remoteAvatar", objNull]);
	missionNamespace setVariable["remoteAvatar", objNull];
	
	removeAllActions player;
};