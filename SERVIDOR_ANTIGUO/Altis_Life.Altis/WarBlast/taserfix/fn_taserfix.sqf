
_player = _this select 0;
_weap = currentWeapon _player;
_ammo = _player ammo _weap;

if(side _player != west) exitWith {};

if (_weap == "hgun_P07_snds_F") then {
if (_ammo > 3) then {
_player setAmmo ["hgun_P07_snds_F",0];
};
};