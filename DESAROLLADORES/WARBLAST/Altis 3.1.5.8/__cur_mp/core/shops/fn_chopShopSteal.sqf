/*
	File: fn_chopShopSteal.sqf
	Author: Ciaran Langton
	
	Description:
	Sends the vehicle to the player.
*/
disableSerialization;
private["_control","_price","_vehicle","_nearVehicles","_price2"];
_control = ((findDisplay 39400) displayCtrl 39402);
_price = _control lbValue (lbCurSel _control);
_vehicle = _control lbData (lbCurSel _control);
_vehicle = call compile format["%1", _vehicle];
_nearVehicles = nearestObjects [getMarkerPos life_chopShop,["Car","Truck","Air"],25];
_vehicle = _nearVehicles select _vehicle;
if(isNull _vehicle) exitWith {};

hint "Replating the car now...";
life_action_inUse = true;
_charge = ceil(_price / 3);
if(ALUK_bankedwonga < _charge) exitWith {hint "You do not have enough cash in your bank account!";};
ALUK_bankedwonga = ALUK_bankedwonga - _charge;

[[_vehicle,player,_charge],"TON_fnc_changeVehicleOwner",false,false] spawn life_fnc_MP;
closeDialog 0;