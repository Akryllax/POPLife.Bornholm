/*
	File: fn_spawnVehicle.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Sends the query request to the database, if an array is returned then it creates
	the vehicle if it's not in use or dead.
*/
private["_vid","_sp","_pid","_query","_sql","_vehicle","_nearVehicles","_name","_side","_tickTime","_dir"];
_vid = [_this,0,-1,[0]] call BIS_fnc_param;
_pid = [_this,1,"",[""]] call BIS_fnc_param;
_sp = [_this,2,[],[[],""]] call BIS_fnc_param;
_unit = [_this,3,ObjNull,[ObjNull]] call BIS_fnc_param;
_price = [_this,4,0,[0]] call BIS_fnc_param;
_dir = [_this,5,0,[0]] call BIS_fnc_param;
_unit_return = _unit;
_name = name _unit;
_side = side _unit;
_unit = owner _unit;

if(_vid == -1 OR _pid == "") exitWith {};
if(_vid in serv_sv_use) exitWith {};
serv_sv_use pushBack _vid;

_query = format["SELECT id, side, classname, type, pid, alive, active, plate, color FROM vehicles WHERE id='%1' AND pid='%2'",_vid,_pid];

waitUntil{sleep (random 0.3); !DB_Async_Active};
_tickTime = diag_tickTime;
_queryResult = [_query,2] call DB_fnc_asyncCall;

diag_log "------------- Client Query Request -------------";
diag_log format["QUERY: %1",_query];
diag_log format["Time to complete: %1 (in seconds)",(diag_tickTime - _tickTime)];
diag_log format["Result: %1",_queryResult];
diag_log "------------------------------------------------";

if(typeName _queryResult == "STRING") exitWith {};

_vInfo = _queryResult;
if(isNil "_vInfo") exitWith {serv_sv_use = serv_sv_use - [_vid];};
if(count _vInfo == 0) exitWith {serv_sv_use = serv_sv_use - [_vid];};

if((_vInfo select 5) == 0) exitWith
{
	serv_sv_use = serv_sv_use - [_vid];
	[[1,format[(localize "STR_Garage_SQLError_Destroyed"),_vInfo select 2]],"life_fnc_broadcast",_unit,false] spawn life_fnc_MP;
};

if((_vInfo select 6) == 1) exitWith
{
	serv_sv_use = serv_sv_use - [_vid];
	[[1,format[(localize "STR_Garage_SQLError_Active"),_vInfo select 2]],"life_fnc_broadcast",_unit,false] spawn life_fnc_MP;
};
if(typeName _sp != "STRING") then {
	_nearVehicles = nearestObjects[_sp,["Car","Air","Ship"],10];
} else {
	_nearVehicles = [];
};
if(count _nearVehicles > 0) exitWith
{
	serv_sv_use = serv_sv_use - [_vid];
	[[_price,_unit_return],"life_fnc_garageRefund",_unit,false] spawn life_fnc_MP;
	[[1,(localize "STR_Garage_SpawnPointError")],"life_fnc_broadcast",_unit,false] spawn life_fnc_MP;
};

_query = format["UPDATE vehicles SET active='1' WHERE pid='%1' AND id='%2'",_pid,_vid];

waitUntil {!DB_Async_Active};
[_query,false] spawn DB_fnc_asyncCall;
if(typeName _sp == "STRING") then {
	_vehicle = createVehicle[(_vInfo select 2),[0,0,999],[],0,"NONE"];
	waitUntil {!isNil "_vehicle" && {!isNull _vehicle}};
	_vehicle allowDamage false;
	_hs = nearestObjects[getMarkerPos _sp,["Land_Hospital_side2_F"],50] select 0;
	_vehicle setPosATL (_hs modelToWorld [-0.4,-4,12.65]);
	sleep 0.6;
} else {
	_vehicle = createVehicle [(_vInfo select 2),_sp,[],0,"NONE"];
	waitUntil {!isNil "_vehicle" && {!isNull _vehicle}};
	_vehicle allowDamage false;
	_vehicle setPos _sp;
	_vehicle setVectorUp (surfaceNormal _sp);
	_vehicle setDir _dir;
};

//List of non-hookable vehicles.
if((_vInfo select 2) in [
	 "C_Van_01_transport_F",
	 "I_G_Van_01_fuel_F",
	 "C_Van_01_box_F",
	 "I_Truck_02_transport_F",
	 "I_Truck_02_covered_F",
	 "O_Truck_02_fuel_F",
	 "O_Truck_02_medical_F",
	 "B_Truck_01_transport_F",
	 "B_Truck_01_box_F",
	 "B_Truck_01_medical_F",
	 "B_Truck_01_fuel_F",
	 "O_Truck_02_transport_F",
	 "O_Truck_02_covered_F",
	 "O_Truck_03_transport_F",
	 "O_Truck_03_covered_F",
	 "O_Truck_03_transport_F",
	 "O_Truck_03_covered_F",
	 "O_Truck_03_medical_F",
	 "O_Truck_03_fuel_F",
	 "O_Truck_03_device_F",
	 "O_MRAP_02_F",
	 "B_G_Offroad_01_armed_F",
	 "O_MRAP_02_hmg_F" 
]) then { [_vehicle] spawn life_fnc_RestrictSlingLoad;};

if((typeOf _vehicle) in ["B_Plane_CAS_01_F","I_Plane_Fighter_03_CAS_F","O_Plane_CAS_02_F"]) then {
			_vehicle setDir 224.523;
};

_vehicle allowDamage true;
//Send keys over the network.
[[_vehicle],"life_fnc_addVehicle2Chain",_unit,false] spawn life_fnc_MP;
[_pid,_side,_vehicle,1] call TON_fnc_keyManagement;
_vehicle lock 2;
//Reskin the vehicle 
[[_vehicle,_vInfo select 8],"life_fnc_colorVehicle",nil,false] spawn life_fnc_MP;
_vehicle setVariable["vehicle_info_owners",[[_pid,_name]],true];
_vehicle setVariable["dbInfo",[(_vInfo select 4),_vInfo select 7]];
//_vehicle addEventHandler["Killed","_this spawn TON_fnc_vehicleDead"]; //Obsolete function?
[_vehicle] call life_fnc_clearVehicleAmmo;

//Sets of animations
if((_vInfo select 1) == "civ" && (_vInfo select 2) == "B_Heli_Light_01_F" && _vInfo select 8 != 13) then
{
	[[_vehicle,"civ_littlebird",true],"life_fnc_vehicleAnimate",_unit,false] spawn life_fnc_MP;
};

if((_vInfo select 1) == "cop" && (_vInfo select 2) in ["C_Offroad_01_F","B_MRAP_01_F","C_SUV_01_F","C_SUV_01_F","C_Hatchback_01_sport_F","B_Heli_Light_01_F2","B_Heli_Transport_01_F","I_Heli_light_03_unarmed_F","I_MRAP_03_hmg_F2","I_MRAP_03_F","B_APC_Wheeled_01_cannon_F","B_MRAP_01_hmg_F"]) then
{
	[[_vehicle,"cop_offroad",true],"life_fnc_vehicleAnimate",_unit,false] spawn life_fnc_MP;
};

if((_vInfo select 1) == "med" && (_vInfo select 2) == "C_Offroad_01_F") then
{
	[[_vehicle,"med_offroad",true],"life_fnc_vehicleAnimate",_unit,false] spawn life_fnc_MP;
};
[[1,"Your vehicle is ready!"],"life_fnc_broadcast",_unit,false] spawn life_fnc_MP;
serv_sv_use = serv_sv_use - [_vid];

if(_vehicle isKindOf "Car") then {[[_vehicle], "life_fnc_startRandomRadio", _unit,false] spawn life_fnc_MP;};