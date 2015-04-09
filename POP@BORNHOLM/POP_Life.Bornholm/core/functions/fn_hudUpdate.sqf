/*
	File: fn_hudUpdate.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Updates the HUD when it needs to.
*/
private["_ui","_food","_water","_health","_sed","_comida","_karma"];
disableSerialization;

_ui = uiNameSpace getVariable ["playerHUD",displayNull];
if(isNull _ui) then {[] call life_fnc_hudSetup;};
_food = _ui displayCtrl 23500;
_water = _ui displayCtrl 23510;
_health = _ui displayCtrl 23515;
_happy = _ui displayCtrl 23520;
_karma = life_karma;
_comida = profileNamespace getVariable "hambre";
_sed = profileNamespace getVariable "sed";

//Update food
_food ctrlSetPosition [safeZoneX+safeZoneW-0.10,safeZoneY+safeZoneH-0.400];
_food ctrlSetText format["%1%2", _comida, "%"];
_food ctrlSetBackgroundColor [0, 0, 0, 0.5];
if(_comida < 0.3) then {
	_food ctrlSetBackgroundColor [255, 0, 0, 0.5];
};
_food ctrlCommit 0;

//Update Water
_water ctrlSetPosition [safeZoneX+safeZoneW-0.10,safeZoneY+safeZoneH-0.353];
_water ctrlSetText format["%1%2", _sed, "%"];
_water ctrlSetBackgroundColor [0, 0, 0, 0.5];
if(_sed < 0.3) then {
	_water ctrlSetBackgroundColor [255, 0, 0, 0.5];
};
_water ctrlCommit 0;


//Update Health
_health ctrlSetPosition [safeZoneX+safeZoneW-0.10,safeZoneY+safeZoneH-0.306];
_dam = round((1 - (damage player)) * 100);
_health ctrlSetText format["%1%2", _dam, "%"];
_health ctrlSetBackgroundColor [0, 0, 0, 0.5];
if(damage player > 0.5) then {
	_health ctrlSetBackgroundColor [255, 0, 0, 0.5];
};
_health ctrlCommit 0;

_happy ctrlSetPosition [safeZoneX+safeZoneW-0.10,safeZoneY+safeZoneH-0.259];
_happy ctrlSetText format["%1%2", _karma, "%"];
_happy ctrlSetBackgroundColor [0,0,0,0.5];
if ((_karma < 0) or (_karma > 2500)) then {
	if (_karma < -2500) then {
		_happy ctrlSetBackgroundColor [255, 0, 0, 0.5];
	} else {
		_happy ctrlSetBackgroundColor [0, 0, 255, 0.5]
    };

};
_happy ctrlCommit 0;
