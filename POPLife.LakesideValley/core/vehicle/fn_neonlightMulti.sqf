#include <macro.h>
/*
	Filename: fn_neonlightMulti.sqf
	author: tenshi
*/
private["_nearVehicles","_vehicle","_price","_lightArea","_lightRed","_lightBlue"];

if(vehicle player != player) then
{
	_vehicle = vehicle player;
}
	else
{
	_nearVehicles = nearestObjects[getPos player,["Car","Air","Ship"],10];
	if(count _nearVehicles > 0) then
	{
		{
			if(!isNil "_vehicle") exitWith {}; //Kill the loop.
			_vehData = _x getVariable["vehicle_info_owners",[]];
			if(count _vehData  > 0) then
			{
				_vehOwner = (_vehData select 0) select 0;
				if((getPlayerUID player) == _vehOwner) exitWith
				{
					_vehicle = _x;
				};
			};
		} foreach _nearVehicles;
	};
};

if(isNil "_vehicle") exitWith {hint "Esta demasiado lejos el vehiculo";};
if(isNull _vehicle) exitWith {};
if(playerSide != civilian) exitWith {hint "No eres civil"};
_price = 2000;
if(life_atmcash < _price) exitWith { hint format["No tienes  $%1 para pagar la modificacion",_price]; };
hint format["Pagastes %1$ por modificar tu coche",_price];
life_atmcash = life_atmcash - _price;

	[[_vehicle],"life_fnc_neonMulti",true,false] call life_fnc_MP;