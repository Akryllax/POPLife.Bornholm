/*
	File: fn_vehicleShopBuy.sqf
	Author: mis cojones gordos
	
	Description:
	crear veiculo para jugador como si lo hubiera comprado
*/
private["_className","_colorIndex","_spawnAt","_vehicle"];

//params
_vehicleClass = _this select 0;
_colorIndex = _this select 1;
_spawnAt = _this select 2;
_spawnAt = position _this select 2;

//Spawn the vehicle and prep it.


	_vehicle = createVehicle [_className, (_spawnAt), [], 0, "NONE"];
	
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


//Side Specific actions.
switch(playerSide) do {

	case civilian: {
		if(_className == "B_Heli_Light_01_F") then {
			[_vehicle,"civ_littlebird",true] spawn life_fnc_vehicleAnimate;
		};
	};
	
	
};

_vehicle allowDamage true;

//life_vehicles set[count life_vehicles,_vehicle]; //Add err to the chain.
life_vehicles pushBack _vehicle;
[[getPlayerUID player,playerSide,_vehicle,1],"TON_fnc_keyManagement",false,false] spawn life_fnc_MP;
//guardar en db¿?
[[(getPlayerUID player),playerSide,_vehicle,_colorIndex],"TON_fnc_vehicleCreate",false,false] spawn life_fnc_MP;
	
	};
};

[0] call SOCK_fnc_updatePartial;