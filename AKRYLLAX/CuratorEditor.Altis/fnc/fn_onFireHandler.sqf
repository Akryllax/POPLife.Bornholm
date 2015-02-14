_unit = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_weap = [_this, 1, "", [""]] call BIS_fnc_param;
_muzz = [_this, 2, "", [""]] call BIS_fnc_param;
_mode = [_this, 3, "", [""]] call BIS_fnc_param;
_ammo = [_this, 4, "", [""]] call BIS_fnc_param;
_maga = [_this, 5, "", [""]] call BIS_fnc_param;
_proj = [_this, 6, objNull, [objNull]] call BIS_fnc_param;

_initialSpeed = vectorMagnitude (velocity _proj);

waitUntil{(!alive _proj) || (vectorMagnitude (velocity _proj) < _initialSpeed * 0.8)};
_manArray = nearestObjects [getPos _proj, ["Man"], supress_minDistance];

diag_log "Triggered FiredEH. Asking recieveSupression";

{
	[_proj distance _x, "AKR_fnc_recieveSupression", _x] call BIS_fnc_MP;
} forEach (_manArray);