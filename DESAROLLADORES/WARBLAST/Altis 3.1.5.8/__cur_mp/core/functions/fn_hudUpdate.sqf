/*
	File: fn_hudUpdate.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Updates the HUD when it needs to.
*/
private["_ui","_food","_water","_health"];
disableSerialization;

_ui = uiNameSpace getVariable ["playerHUD",displayNull];
if(isNull _ui) then {[] call life_fnc_hudSetup;};
_food = _ui displayCtrl 23500;
_water = _ui displayCtrl 23510;
_health = _ui displayCtrl 23515;
_misc = _ui displayCtrl 23520;
_miscImg = _ui displayCtrl 23521;
_wantedHUD = _ui displayCtrl 23525;
_foodIcon = _ui displayCtrl 23531;
_waterIcon = _ui displayCtrl 23532;
_healthIcon = _ui displayCtrl 23533;

//Medical icons
_boneIcon = _ui displayCtrl 23522;
_mutedIcon = _ui displayCtrl 23523;
_drunkIcon = _ui displayCtrl 23524;


if(!(life_disablehud)) then {
	_food ctrlShow true;
	_water ctrlShow true;
	_health ctrlShow true; 
	_misc ctrlShow true;
	_miscImg ctrlShow true;
	if(life_wantedhud && playerSide == west) then {_wantedHUD ctrlShow true;};
	_foodIcon ctrlShow true;
	_waterIcon ctrlShow true;
	_healthIcon ctrlShow true;
};

//Health status icons
if(life_medical_bonebreak && !(life_disablehud)) then {
	_boneIcon ctrlShow true;
} else {
	_boneIcon ctrlShow false;
};

if(soundVolume != 1 && !(life_disablehud)) then {
	_mutedIcon ctrlShow true;
} else {
	_mutedIcon ctrlShow false;	
};

if(life_drinkypoo > 0.11 && !(life_disablehud)) then {
	_drunkIcon ctrlShow true;
} else {
	_drunkIcon ctrlShow false;
};


//Update food
_food ctrlSetPosition [safeZoneX+safeZoneW-0.090,safeZoneY+safeZoneH-0.570];
_food ctrlSetText format["%1%2", life_hunger, "%"];
_food ctrlSetBackgroundColor [0, 0, 0, 0.5]; 
if(life_thirst < 0.3) then { 
	_food ctrlSetBackgroundColor [255, 0, 0, 0.5]; 
};
//Update Water
_water ctrlSetPosition [safeZoneX+safeZoneW-0.090,safeZoneY+safeZoneH-0.508];
_water ctrlSetText format["%1%2", life_thirst, "%"];
_water ctrlSetBackgroundColor [0, 0, 0, 0.5]; 
if(life_thirst < 0.3) then { 
	_water ctrlSetBackgroundColor [255, 0, 0, 0.5]; 
};

//Update Health
_health ctrlSetPosition [safeZoneX+safeZoneW-0.090,safeZoneY+safeZoneH-0.445];
_dam = round((1 - (damage player)) * 100);
_health ctrlSetText format["%1%2", _dam, "%"];
_health ctrlSetBackgroundColor [0, 0, 0, 0.5]; 
if(damage player > 0.5) then { 
	_health ctrlSetBackgroundColor [255, 0, 0, 0.5]; 	
};


_misc ctrlSetPosition [safeZoneX+safeZoneW-0.090,safeZoneY+safeZoneH-0.380];
_misc ctrlSetBackgroundColor [0, 0, 0, 0.5]; 

//Decide what to show
switch(playerSide) do
{
	case civilian:
	{
		_misc ctrlSetText format["£%1", ([(life_crimes select 1)] call life_fnc_numberText)];
		_miscImg ctrlSetText "icons\bounty.paa";
		if((life_crimes select 1) > 100000) then { 
			_misc ctrlSetBackgroundColor [255, 0, 0, 0.5]; 	
		};
		_wantedHUD ctrlShow false;
	};

	case independent:
	{
		_count = 0;
		{
			_name = _x getVariable "name";
			_down = _x getVariable ["Revive",false];
			if(!isNil "_name" && !_down) then {
				_count = _count + 1;
			};
		} foreach allDeadMen;
		
		_miscImg ctrlSetText "icons\dead.paa";
		_misc ctrlSetText format["%1", _count];
		_wantedHUD ctrlShow false;
	};

	/*case west:
	{
		_miscImg ctrlSetText "icons\criminal.paa";
		_wanted = 0;
		_text = "";
		_text = _text + "<t color='#2E2EFE'><t size='1.5'>Wanted List</t></t><br/><br/>";

		{
			if(side _x == civilian) then
			{
				_status = _x getVariable ["life_crimes",[[],0]];
				if((_status select 1) > 0) then {
					_text = _text + format["%1 [£%2]<br/>",_x getVariable["realname",name _X],[_status select 1] call life_fnc_numberText];
					_wanted = _wanted + 1;
				};
			}; 
		} forEach playableUnits;

		if(_wanted == 0) then {_text = _text + "No Criminals<br/>"};
		
		_misc ctrlSetText format["%1", _wanted];

		if(life_wantedhud) then {
			_wantedHUD ctrlShow true;
			_wantedHUD ctrlSetStructuredText parseText _text;
		} else {
			_wantedHUD ctrlShow false;
		};
	};*/

	case west:
	{
		_miscImg ctrlSetText "icons\criminal.paa";
		_wanted = 0;
		_text = "";
		_text = _text + "<t color='#2E2EFE'><t size='1.5'>Wanted List</t></t><br/><br/>";

		_wantedListOutput = [];
		
		{
			if(side _x == civilian) then
			{
				_status = _x getVariable ["life_crimes",[[],0]];
				if((_status select 1) > 0) then {
					_wantedListOutput pushBack [_x,_status];
					_wanted = _wanted + 1;
				};
			}; 
		} forEach playableUnits;

		if(_wanted == 0) then {_text = _text + "No Criminals<br/>"};

//_text = _text + format["%1 [£%2]<br/>",_x getVariable["realname",name _X],[_status select 1] call life_fnc_numberText];

		
		_misc ctrlSetText format["%1", _wanted];

		if(life_wantedhud) then {

			for "_i" from 0 to count _wantedListOutput -1 do {
				_maxIndex = 0;
				_maxCash = 0;
				_unit = objNull;
				_data = [[],0];
				{
					_unit = _x select 0;
					_data = _x select 1;
					if(_data select 1 > _maxCash) then {
						_maxIndex = _forEachIndex;
						_maxCash = _data select 1;
					};
				} forEach _wantedListOutput;
				if(isNull _unit) exitWith {};
				_text = _text + format["%1 [£%2]<br/>",_unit getVariable["realname",name _unit],[_data select 1] call life_fnc_numberText];
			};

			_wantedHUD ctrlShow true;
			_wantedHUD ctrlSetStructuredText parseText _text;
		} else {
			_wantedHUD ctrlShow false;
		};
	};

};

if(life_disablehud) then {
	_food ctrlShow false;
	_water ctrlShow false;
	_health ctrlShow false; 
	_misc ctrlShow false;
	_miscImg ctrlShow false;
	_wantedHUD ctrlShow false;
	_foodIcon ctrlShow false;
	_waterIcon ctrlShow false;
	_healthIcon ctrlShow false;
};

_misc ctrlCommit 0;
_miscImg ctrlCommit 0;
_wantedHUD ctrlCommit 0;
_food ctrlCommit 0;
_water ctrlCommit 0;
_health ctrlCommit 0;

_boneIcon ctrlCommit 2;
_mutedIcon ctrlCommit 2;
_drunkIcon ctrlCommit 2;