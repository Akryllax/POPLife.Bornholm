_distance = [_this, 0, -1, [-1]] call BIS_fnc_param;

diag_log "Supression requested";

supress_ammount = supress_ammount + (_distance / supress_minDistance) * supress_factor;
if(supress_ammount > supress_maxAmmount) then {
	supress_ammount = supress_maxAmmount;
};

[player, 0.5] call BIS_fnc_dirtEffect;
addCamShake [1 * (supress_ammount / supress_maxAmmount), 0.7, 1000];

supress_delay = supress_maxDelay;