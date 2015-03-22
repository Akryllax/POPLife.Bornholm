/*
	File: fn_dropFishingNet.sqf
	Author: Bryan "Tonic" Boardwine
	Recoded to work without physical objects by Ciaran

	Description:
	Drops a virtual fishing net from the boat.
*/
private["_fish","_type","_typeName"];
if(!(vehicle player isKindOf "Ship")) exitWith {};
if((getPosATL vehicle player) select 2 < 40) exitWith {hint "You need to be further out from shore to collect fish!";};
life_net_dropped = true;
titleText[localize "STR_NOTF_NetDrop","PLAIN"];
sleep 5;
if(random 100 < 15) exitWith {titleText[localize "STR_NOTF_NetDropFail","PLAIN"]; life_net_dropped = false;};
_random = (ceil(random 7) + 1);

for "_i" from 0 to _random do {
	_rand = [
		"Salema_F","Salema_F","Ornate_random_F",
		"Mackerel_F","Mackerel_F","Tuna_F",
		"Mullet_F","Mullet_F","CatShark_F"
	] call BIS_fnc_selectRandom;
	
	switch(_rand) do
	{
		case "Salema_F": {_typeName = localize "STR_ANIM_Salema"; _type = "salema";};
		case "Ornate_random_F": {_typeName = localize "STR_ANIM_Ornate"; _type = "ornate";};
		case "Mackerel_F": {_typeName = localize "STR_ANIM_Mackerel"; _type = "mackerel";};
		case "Tuna_F": {_typeName = localize "STR_ANIM_Tuna"; _type = "tuna";};
		case "Mullet_F": {_typeName = localize "STR_ANIM_Mullet"; _type = "mullet";};
		case "CatShark_F": {_typeName = localize "STR_ANIM_Catshark"; _type = "catshark";};
		default {_type = "";};
	};

	sleep 3;

	if(([true,_type,1] call life_fnc_handleInv)) then
	{
		[5] call life_fnc_addXP;
		titleText[format[(localize "STR_NOTF_Fishing"),_typeName],"PLAIN"];
	};
};

sleep 1.5;
titleText[localize "STR_NOTF_NetUp","PLAIN"];
life_net_dropped = false;