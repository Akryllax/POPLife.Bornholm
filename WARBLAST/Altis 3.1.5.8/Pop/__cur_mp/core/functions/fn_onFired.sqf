/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Handles various different ammo types being fired.
*/
private["_ammoType","_projectile"];
_ammoType = _this select 4; 
_projectile = _this select 6;
_weapon = _this select 2;

//Anti-Taze Spam
if(_weapon == "hgun_P07_snds_F" && playerSide == west) then {
	[] spawn {
		_time = time;
		while {time - _time < .75} do {
			player setWeaponReloadingTime [player, currentWeapon player, 2];
		};
	};
};

//Anti-Taze Spam for Black Tazer
if(_weapon == "hgun_Rook40_snds_F" && playerSide == west) then {
	[] spawn {
		_time = time;
		while {time - _time < .50} do {
			player setWeaponReloadingTime [player, currentWeapon player, 2];
		};
	};
};