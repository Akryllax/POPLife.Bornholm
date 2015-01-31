#define ctrlSelData(ctrl) (lbData[##ctrl,(lbCurSel ##ctrl)])
/*
	File: fn_vehStoreItem.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Used in the vehicle trunk menu, stores the selected item and puts it in the vehicles virtual inventory
	if the vehicle has room for the item.
*/
private["_ctrl","_num","_totalWeight","_itemWeight","_veh_data","_inv","_index","_val","_Truck","_FuelTrucks","_FuelStuff","_RadioactiveTrucks","_RadioactiveStuff"];
disableSerialization;

_ctrl = ctrlSelData(3503);
_num = ctrlText 3506;
if(!([_num] call TON_fnc_isnumber)) exitWith {hint "Invalid Number format";};
_num = parseNumber(_num);
if(_num < 1) exitWith {hint "You can't enter anything below 1!";};

if(life_trunk_vehicle isKindOf "House_F") then {
	_mWeight = 0;
	{_mWeight = _mWeight + ([(typeOf _x)] call life_fnc_vehicleWeightCfg);} foreach (life_trunk_vehicle getVariable["containers",[]]);
	_totalWeight = [_mWeight,(life_trunk_vehicle getVariable["Trunk",[[],0]]) select 1];
} else {
	_totalWeight = [life_trunk_vehicle] call life_fnc_vehicleWeight;
};
_itemWeight = ([_ctrl] call life_fnc_itemWeight) * _num;
_veh_data = life_trunk_vehicle getVariable ["Trunk",[[],0]];
_inv = _veh_data select 0;

if(_ctrl == "goldbar" && {!(life_trunk_vehicle isKindOf "LandVehicle" OR life_trunk_vehicle isKindOf "House_F")}) exitWith {hint "Solo puedes cargarlo en un vehiculo terrestre!"};

if(_ctrl == "heroinu" && {!(life_trunk_vehicle isKindOf "LandVehicle" OR life_trunk_vehicle isKindOf "House_F")}) exitWith {hint "Solo puedes cargarlo en un vehiculo terrestre!"};
if(_ctrl == "cocaine" && {!(life_trunk_vehicle isKindOf "LandVehicle" OR life_trunk_vehicle isKindOf "House_F")}) exitWith {hint "Solo puedes cargarlo en un vehiculo terrestre!"};
if(_ctrl == "cannabis" && {!(life_trunk_vehicle isKindOf "LandVehicle" OR life_trunk_vehicle isKindOf "House_F")}) exitWith {hint "Solo puedes cargarlo en un vehiculo terrestre!"};

if(_ctrl == "u234" && {!(life_trunk_vehicle isKindOf "LandVehicle" OR life_trunk_vehicle isKindOf "House_F")}) exitWith {hint "Solo puedes cargarlo en un vehiculo terrestre!"};
if(_ctrl == "u235" && {!(life_trunk_vehicle isKindOf "LandVehicle" OR life_trunk_vehicle isKindOf "House_F")}) exitWith {hint "Solo puedes cargarlo en un vehiculo terrestre!"};
if(_ctrl == "u236" && {!(life_trunk_vehicle isKindOf "LandVehicle" OR life_trunk_vehicle isKindOf "House_F")}) exitWith {hint "Solo puedes cargarlo en un vehiculo terrestre!"};

if(_ctrl == "bu234" && {!(life_trunk_vehicle isKindOf "LandVehicle" OR life_trunk_vehicle isKindOf "House_F")}) exitWith {hint "Solo puedes cargarlo en un vehiculo terrestre!"};
if(_ctrl == "bu235" && {!(life_trunk_vehicle isKindOf "LandVehicle" OR life_trunk_vehicle isKindOf "House_F")}) exitWith {hint "Solo puedes cargarlo en un vehiculo terrestre!"};
if(_ctrl == "bu236" && {!(life_trunk_vehicle isKindOf "LandVehicle" OR life_trunk_vehicle isKindOf "House_F")}) exitWith {hint "Solo puedes cargarlo en un vehiculo terrestre!"};

if(_ctrl == "uenriquecido" && {!(life_trunk_vehicle isKindOf "LandVehicle" OR life_trunk_vehicle isKindOf "House_F")}) exitWith {hint "Solo puedes cargarlo en un vehiculo terrestre!"};

_Truck = TypeOf life_trunk_vehicle;

//Mod para los camiones cisterna
_FuelStuff = ["oilu","oilp","biofruta","water"]; //Wich Items can be stored in?
_FuelTrucks = ["I_G_Van_01_fuel_F","B_Truck_01_fuel_F","O_Truck_02_fuel_F","O_Truck_03_fuel_F"]; //Fuel Trucks, who are allowed to carry fuel

switch (true) do
{
case ((_ctrl in _FuelStuff) && (_Truck in _FuelTrucks)): {life_TankLaster = 1}; //Fuel in FuelTruck -> Allowed
case (!(_ctrl in _FuelStuff) && !(_Truck in _FuelTrucks)): {life_TankLaster = 2}; //NonFuel in NonFuelTruck -> Allowed
case (!(_ctrl in _FuelStuff) && (_Truck in _FuelTrucks)): {life_TankLaster = 3}; //NonFuel in FuelTruck -> Nope
case ((_ctrl in _FuelStuff) && !(_Truck in _FuelTrucks)): {life_TankLaster = 4}; //Fuel in NonFuelTruck -> Nope!
};

if (life_TankLaster == 3) exitWith {hint "Los camiones cisterna solo pueden transportar liquidos!"};
if (life_TankLaster == 4) exitWith {hint "Solo los camiones cisterna pueden transportar liquidos!"};

//Mod para los camiones antiradiacion
//_RadioactiveStuff = ["u234","u235","u238","bu234","bu235","bu238","uenriquecido"]; //Que objetos podran llevar los camiones antiradiacion
//_RadioactiveTrucks = ["B_Truck_01_medical_F","O_Truck_03_medical_F","O_Truck_02_medical_F"]; //Camiones antiradiacion, que seran los que puedan llevar carga radioactiva

//switch (true) do
//{
//case ((_ctrl in _RadioactiveStuff) && (_Truck in _RadioactiveTrucks)): {life_CargaUranio = 1}; //Objetos radioactivos en camiones antiradiacion -> Permitido
//case (!(_ctrl in _RadioactiveStuff) && !(_Truck in _RadioactiveTrucks)): {life_CargaUranio = 2}; //Objetos NO radioactivos en camiones NO antiradiacion  -> Permitido
//case (!(_ctrl in _RadioactiveStuff) && (_Truck in _RadioactiveTrucks)): {life_CargaUranio = 3}; //Objetos NO radioactivos en camiones antiradiacion  -> No
//case ((_ctrl in _RadioactiveStuff) && !(_Truck in _RadioactiveTrucks)): {life_CargaUranio = 4}; //Objetos radioactivos en camiones NO antiradiacion  -> No
//};

//if (life_CargaUranio == 3) exitWith {hint "Los camiones antiradiacion solo pueden transportar material radioactivo!"};
//if (life_CargaUranio == 4) exitWith {hint "Solo los camiones antiradiacion pueden transportar material radioactivo!"};

if(_ctrl == "money") then
{
	_index = [_ctrl,_inv] call TON_fnc_index;
	if(life_cash < _num) exitWith {hint "You don't have that much cash on you to store in the vehicle!"};
	if(_index == -1) then
	{
		_inv pushBack [_ctrl,_num];
	}
		else
	{
		_val = _inv select _index select 1;
		_inv set[_index,[_ctrl,_val + _num]];
	};
	
	life_cash = life_cash - _num;
	life_trunk_vehicle setVariable["Trunk",[_inv,(_veh_data select 1) + _itemWeight],true];
	[life_trunk_vehicle] call life_fnc_vehInventory;
}
	else
{
	if(((_totalWeight select 1) + _itemWeight) > (_totalWeight select 0)) exitWith {hint "The vehicle is either full or cannot hold that much."};

	if(!([false,_ctrl,_num] call life_fnc_handleInv)) exitWith {hint "Couldn't remove the items from your inventory to put in the vehicle.";};
	_index = [_ctrl,_inv] call TON_fnc_index;
	if(_index == -1) then
	{
		_inv pushBack [_ctrl,_num];
	}
		else
	{
		_val = _inv select _index select 1;
		_inv set[_index,[_ctrl,_val + _num]];
	};
	
	life_trunk_vehicle setVariable["Trunk",[_inv,(_veh_data select 1) + _itemWeight],true];
	[life_trunk_vehicle] call life_fnc_vehInventory;
};
