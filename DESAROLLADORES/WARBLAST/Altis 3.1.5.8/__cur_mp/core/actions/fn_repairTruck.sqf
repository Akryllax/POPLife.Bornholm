/*
	File: fn_repairTruck.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Main functionality for toolkits, to be revised in later version.
*/
private["_veh","_upp","_ui","_progress","_pgText","_cP","_displayName"];
_veh = cursorTarget;
life_interrupted = false;
if(isNull _veh) exitwith {};
if(life_action_inUse) exitWith {};
if((_veh isKindOf "Car") OR (_veh isKindOf "Ship") OR (_veh isKindOf "Air")) then
{
	if("ToolKit" in (items player)) then
	{
		life_action_inUse = true;
		_displayName = getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "displayName");
		_upp = format[localize "STR_NOTF_Repairing",_displayName];
		//Setup our progress bar.
		disableSerialization;
		5 cutRsc ["life_progress","PLAIN"];
		_ui = uiNameSpace getVariable "life_progress";
		_progress = _ui displayCtrl 38201;
		_pgText = _ui displayCtrl 38202;
		_pgText ctrlSetText format["%1",_upp];
		_progress progressSetPosition 0.01;
		_cP = 0.01;
		
		_delay = 0.27; //Default delay.
		_talent1 = [10] call life_fnc_hasTalent; //Check if they have the talent.
		if(_talent1) then {_delay = 0.10;}; //Lower the time.

		while{true} do
		{
			if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
				sleep 0.4;
				player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
			};
			sleep _delay;
			_cP = _cP + 0.01;
			_progress progressSetPosition _cP;
			_pgText ctrlSetText format["%1",_upp];
			if(_cP >= 1) exitWith {};
			if(!alive player) exitWith {};
			if(player != vehicle player) exitWith {};
			if(life_interrupted) exitWith {};
		};
		
		life_action_inUse = false;
		5 cutText ["","PLAIN"];
		player playActionNow "stop";
		if(life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; life_action_inUse = false;};
		if(player != vehicle player) exitWith {titleText[localize "STR_NOTF_RepairingInVehicle","PLAIN"];};
		_talent1 = [11] call life_fnc_hasTalent;
		_talent2 = [12] call life_fnc_hasTalent;
		_chance = 0;
		if(_talent1) then {_chance = 25;};
		if(_talent2) then {_chance = 50;};

		if(random 100 > _chance) then {player removeItem "ToolKit"; titleText[localize "STR_NOTF_RepairedVehicle","PLAIN"];} else {titleText[localize "STR_NOTF_RepairedVehicleKeep","PLAIN"]; };
		_veh setDamage 0;
		[20] call life_fnc_addXP;
	};
};