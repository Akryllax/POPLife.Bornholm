/*
	File: fn_gather.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Main functionality for gathering.
*/
closeDialog 0;
private["_gather","_itemWeight","_diff","_itemName","_val","_resourceZones","_zone"];
_resourceZones = [
	"apple_1","apple_2","apple_3","apple_4","peaches_1","peaches_2","peaches_3",
	"peaches_4","heroin_1","heroin_2","cocaine_1","cocaine_2","weed_1","weed_2",
	"frog_1","clams_1","clams_2"
];
_zone = "";

if(life_action_inUse) exitWith {}; //Action is in use, exit to prevent spamming.
life_action_inUse = true;

//Find out what zone we're near
{
	_dist = 30;
	if(_x in ["frog_1"]) then {_dist = 525;};
	if(_x in ["clams_1","clams_2"]) then {
		_dist = 1326;
		if(player distance (getMarkerPos _x) < _dist && ((getPosATL player) select 2) < 20 ) exitWith {_zone = _x;};
	};

	if(player distance (getMarkerPos _x) < _dist && !(_x in ["clams_1","clams_2"])) exitWith {_zone = _x;};
} foreach _resourceZones;

if(_zone == "") exitWith {
	/*hint localize "STR_NOTF_notNearResource";*/
	life_action_inUse = false;
};

//Get the resource that will be gathered from the zone name...
switch(true) do {
	case (_zone in ["apple_1","apple_2","apple_3","apple_4"]): {_gather = "apple"; _val = 3;};
	case (_zone in ["peaches_1","peaches_2","peaches_3","peaches_4"]): {_gather = "peach"; _val = 3;};
	case (_zone in ["heroin_1","heroin_2"]): {_gather = "heroinu"; _val = 1;};
	case (_zone in ["cocaine_1","cocaine_2"]): {_gather = "cocaine"; _val = 1;};
	case (_zone in ["weed_1","weed_2"]): {_gather = "cannabis"; _val = 1;};
	case (_zone in ["frog_1"]): {_gather = "frogleg"; _val = 2;};
	case (_zone in ["clams_1","clams_2"]): {_gather = "clam"; _val = 1;};
	default {""};
};
//gather check??
if(vehicle player != player) exitWith {/*hint localize "STR_NOTF_GatherVeh";*/};

_diff = [_gather,_val,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
if(_diff == 0) exitWith {hint localize "STR_NOTF_InvFull"};
life_action_inUse = true;
for "_i" from 0 to 2 do
{
	player playMoveNow "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
	waitUntil{animationState player != "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";};
	sleep 0.611;
};

if(random 100 > 75 && _gather == "clam") exitWith {hint "You pickup the clam, yet no rattle inside. You put it back.";};
if(([true,_gather,_diff] call life_fnc_handleInv)) then
{
	_itemName = [([_gather,0] call life_fnc_varHandle)] call life_fnc_varToStr;
	titleText[format[localize "STR_NOTF_Gather_Success",_itemName,_diff],"PLAIN"];
};

life_action_inUse = false;
