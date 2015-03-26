/*
        File: fn_gather.sqf
        Author: Bryan "Tonic" Boardwine

        Description:
        Main functionality for gathering.
*/
if (isNil "life_action_gathering") then {life_action_gathering = false;
	};
private ["_gather", "_itemWeight", "_diff", "_itemName", "_val", "_resourceZones", "_zone"];
_resourceZones = ["maiz_1", "maiz_2", "maiz_3", "maiz_4", "trigo_1", "trigo_2", "trigo_3", "trigo_4", "heroin_1", "cocaine_1", "weed_1"];
_zone	       = "";

if (life_action_gathering) exitWith {};	// Action is in use, exit to prevent spamming.
life_action_gathering = true;
// Find out what zone we're near
{
	if (player distance (getMarkerPos _x) < 30) exitWith {_zone = _x;
		};
} foreach _resourceZones;

if (_zone == "") exitWith {
		// WarBlast:Helicrash
		_handle = [] spawn War_fnc_dynamicMapHeliCrash;
		waitUntil {scriptDone _handle};
		life_action_inUse = false;
	};

// Get the resource that will be gathered from the zone name...
switch (true) do {
	case (_zone in ["maiz_1", "maiz_2", "maiz_3", "maiz_4"]): {_gather = "maiz";
								       _val    = 3;
	};
	case (_zone in ["trigo_1", "trigo_2", "trigo_3", "trigo_4"]): {_gather = "peach";
									       _val    = 3;
	};
	case (_zone in ["heroin_1"]): {_gather = "heroinu";
				       _val    = 1;
	};
	case (_zone in ["cocaine_1"]): {_gather = "cocaine";
					_val	= 1;
	};
	case (_zone in ["weed_1"]): {_gather = "cannabis";
				     _val    = 1;
	};
		default {""};
	};
// gather check??
if (vehicle player != player) exitWith {};

_diff = [_gather, _val, life_carryWeight, life_maxWeight] call life_fnc_calWeightDiff;
if (_diff == 0) exitWith {hint localize "STR_NOTF_InvFull"};
life_action_inUse = true;

_time	  = 0;
_profName = [_gather] call life_fnc_profType;

if (_profName != "") then
	{
		_data = missionNamespace getVariable (_profName);
		_time = (3 - (0.25 * (_data select 0)));
	};

for "_i" from 0 to 2 do {
	player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
	waitUntil {animationState player != "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
	};
	sleep _time;
};

if (( [true, _gather, _diff] call life_fnc_handleInv)) then
	{
		_itemName = [( [_gather, 0] call life_fnc_varHandle)] call life_fnc_varToStr;
		titleText [format [localize "STR_NOTF_Gather_Success", _itemName, _diff], "PLAIN"];
		if (_profName != "") then
			{
				[_profName, 25] call life_fnc_addExp;
			};
	};

life_action_inUse = false;