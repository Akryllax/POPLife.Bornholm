/*
	File: fn_clearVehicleAmmo.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Clears the vehicle of ammo types that we don't want.
*/
private["_vehicle","_veh"];
_vehicle = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
if(isNull _vehicle) exitWith {}; //DAFUQ
_veh = typeOf _vehicle;

if(_veh in ["C_Heli_Light_01_civil_F", "B_Heli_Transport_03_F", "B_Heli_Transport_03_unarmed_F", "O_Heli_Transport_04_F", "O_Heli_Transport_04_ammo_F", "O_Heli_Transport_04_bench_F", "O_Heli_Transport_04_box_F", "O_Heli_Transport_04_covered_F", "O_Heli_Transport_04_fuel_F", "O_Heli_Transport_04_medevac_F", "O_Heli_Transport_04_repair_F","B_Heli_Attack_01_F","B_Heli_Attack_02_F"]) then {
	_vehicle setVehicleAmmo 0;
};

if(_veh == "B_Boat_Armed_01_minigun_F") then
{
	_vehicle removeMagazinesTurret ["200Rnd_40mm_G_belt",[0]];
};
if(_veh == "B_APC_Wheeled_01_cannon_F") then
{
	_vehicle removeMagazinesTurret ["60Rnd_40mm_GPR_Tracer_Red_shells",[0]];
	_vehicle removeMagazinesTurret ["40Rnd_40mm_APFSDS_Tracer_Red_shells",[0]];
};
if(_veh == "O_Heli_Attack_02_black_F") then
{
	_vehicle removeMagazinesTurret ["250Rnd_30mm_APDS_shells",[0]];
	_vehicle removeMagazinesTurret ["8Rnd_LG_scalpel",[0]];
	_vehicle removeMagazinesTurret ["38Rnd_80mm_rockets",[0]];
};


if(_veh == "B_Heli_Transport_01_F") then
{
	_vehicle removeMagazinesTurret ["2000Rnd_65x39_Belt_Tracer_Red",[1]];
	_vehicle removeMagazinesTurret ["2000Rnd_65x39_Belt_Tracer_Red",[2]];
};

if(_veh in ["B_Plane_CAS_01_F","I_Plane_Fighter_03_CAS_F","O_Plane_CAS_02_F","B_Heli_Attack_01_F","O_Heli_Attack_02_F"]) then {
	_vehicle setVehicleAmmo 0;
};


clearWeaponCargoGlobal _vehicle;
clearMagazineCargoGlobal _vehicle;
clearItemCargoGlobal _vehicle;