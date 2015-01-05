private["_vehicle","_colorIndex"];

_vehicle = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_colorIndex = [_this, 1, 1, [0]] call BIS_fnc_param;

if(isNull _vehicle) exitWith {}; //Bad entry.

[[_vehicle, _colorIndex], "TON_fnc_updateVehicleColor", false, false] call life_fn_MP;