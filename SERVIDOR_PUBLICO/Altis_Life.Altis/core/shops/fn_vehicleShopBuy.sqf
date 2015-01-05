/*
	File: fn_vehicleShopBuy.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Does something with vehicle purchasing.
*/
#define __GETC__(var) (call var)

private["_mode","_spawnPoints","_className","_basePrice","_colorIndex","_spawnPoint","_vehicle"];
_mode = _this select 0;
if((lbCurSel 2302) == -1) exitWith {hint localize "STR_Shop_Veh_DidntPick"};
_className = lbData[2302,(lbCurSel 2302)];
_vIndex = lbValue[2302,(lbCurSel 2302)];
_vehicleList = [life_veh_shop select 0] call life_fnc_vehicleListCfg; _basePrice = (_vehicleList select _vIndex) select 1;
 if(_mode) then {_basePrice = round(_basePrice * 1.5)};
if(__GETC__(life_coplevel) > 0) then {
	_colorIndex = [__GETC__(life_coplevel), _className] call life_fnc_copVehicleColor;
} else {
	_colorIndex = lbValue[2304,(lbCurSel 2304)];
};

//Series of checks (YAY!)
if(_basePrice < 0) exitWith {}; //Bad price entry
if(life_cash < _basePrice) exitWith {hint format[localize "STR_Shop_Veh_NotEnough",[_basePrice - life_cash] call life_fnc_numberText];};
if(!([_className] call life_fnc_vehShopLicenses) && _className != "B_MRAP_01_hmg_F") exitWith {hint localize "STR_Shop_Veh_NoLicense"};

_spawnPoints = life_veh_shop select 1;
_spawnPoint = "";

if((life_veh_shop select 0) == "med_air_hs") then {
	if(count(nearestObjects[(getMarkerPos _spawnPoints),["Air"],35]) == 0) exitWith {_spawnPoint = _spawnPoints};
} else {
	//Check if there is multiple spawn points and find a suitable spawnpoint.
	if(typeName _spawnPoints == typeName []) then {
		//Find an available spawn point.
		{if(count(nearestObjects[(getMarkerPos _x),["Car","Ship","Air"],5]) == 0) exitWith {_spawnPoint = _x};} foreach _spawnPoints;
	} else {
		if(count(nearestObjects[(getMarkerPos _spawnPoints),["Car","Ship","Air"],5]) == 0) exitWith {_spawnPoint = _spawnPoints};
	};
};


if(_spawnPoint == "") exitWith {hint localize "STR_Shop_Veh_Block";};
life_cash = life_cash - _basePrice;
hint format[localize "STR_Shop_Veh_Bought",getText(configFile >> "CfgVehicles" >> _className >> "displayName"),[_basePrice] call life_fnc_numberText];

//Spawn the vehicle and prep it.
if((life_veh_shop select 0) == "med_air_hs") then {
	_vehicle = createVehicle [_className,[0,0,999],[], 0, "NONE"];
	waitUntil {!isNil "_vehicle"}; //Wait?
	_vehicle allowDamage false;
	_hs = nearestObjects[getMarkerPos _spawnPoint,["Land_Hospital_side2_F"],50] select 0;
	_vehicle setPosATL (_hs modelToWorld [-0.4,-4,12.65]);
	_vehicle lock 2;
	[[_vehicle,_colorIndex],"life_fnc_colorVehicle",true,false] spawn life_fnc_MP;
	[_vehicle] call life_fnc_clearVehicleAmmo;
	[[_vehicle,"trunk_in_use",false,true],"TON_fnc_setObjVar",false,false] spawn life_fnc_MP;
	[[_vehicle,"vehicle_info_owners",[[getPlayerUID player,profileName]],true],"TON_fnc_setObjVar",false,false] spawn life_fnc_MP;
	_vehicle disableTIEquipment true; //No Thermals.. They're cheap but addictive.
} else {
	_vehicle = createVehicle [_className, (getMarkerPos _spawnPoint), [], 0, "NONE"];
	waitUntil {!isNil "_vehicle"}; //Wait?
	_vehicle allowDamage false; //Temp disable damage handling..
	_vehicle lock 2;
	_vehicle setVectorUp (surfaceNormal (getMarkerPos _spawnPoint));
	_vehicle setDir (markerDir _spawnPoint);
	_vehicle setPos (getMarkerPos _spawnPoint);
	[[_vehicle,_colorIndex],"life_fnc_colorVehicle",true,false] spawn life_fnc_MP;
	[_vehicle] call life_fnc_clearVehicleAmmo;
	[[_vehicle,"trunk_in_use",false,true],"TON_fnc_setObjVar",false,false] spawn life_fnc_MP;
	[[_vehicle,"vehicle_info_owners",[[getPlayerUID player,profileName]],true],"TON_fnc_setObjVar",false,false] spawn life_fnc_MP;
	_vehicle disableTIEquipment true; //No Thermals.. They're cheap but addictive.
};

//Side Specific actions.
switch(playerSide) do {
	case west: {
		[_vehicle,"cop_offroad",true] spawn life_fnc_vehicleAnimate;
		if(_vehicle isKindOf "Car") then{ [_vehicle] spawn life_fnc_randomRadio;};
	};
	
	case civilian: {
		if((life_veh_shop select 2) == "civ" && {_className == "B_Heli_Light_01_F"}) then {
			[_vehicle,"civ_littlebird",true] spawn life_fnc_vehicleAnimate;
		};
		if(_className in ["B_Plane_CAS_01_F","I_Plane_Fighter_03_CAS_F","O_Plane_CAS_02_F"]) then {
			_vehicle setDir 224.523;
		};
	};
	
	case independent: {
		[_vehicle,"med_offroad",true] spawn life_fnc_vehicleAnimate;
	};
	
	case east: {
		if((life_veh_shop select 2) == "mer" && {_className == "B_Heli_Light_01_F"}) then {
			[_vehicle,"civ_littlebird",true] spawn life_fnc_vehicleAnimate;
		};
	};
};

//List of non-hookable vehicles.
if(_className in [
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
] && side player != west) then { [_vehicle] spawn life_fnc_RestrictSlingLoad;};

_vehicle allowDamage true;

//life_vehicles set[count life_vehicles,_vehicle]; //Add err to the chain.
life_vehicles pushBack _vehicle;
[[getPlayerUID player,playerSide,_vehicle,1],"TON_fnc_keyManagement",false,false] spawn life_fnc_MP;

if(_mode) then {
	if(!(_className in [""])) then {
		[[(getPlayerUID player),playerSide,_vehicle,_colorIndex],"TON_fnc_vehicleCreate",false,false] spawn life_fnc_MP;
	};
};

[0] call SOCK_fnc_updatePartial;
closeDialog 0; //Exit the menu.
true;