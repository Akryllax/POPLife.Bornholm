/*
	File: fn_arrestAction.sqf
	
	Description:
	Arrests the targeted person.
*/
private["_unit","_id"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _unit) exitWith {}; //Not valid
if(isNil "_unit") exitwith {}; //Not Valid
if(!(_unit isKindOf "Man")) exitWith {}; //Not a unit
if(!isPlayer _unit) exitWith {}; //Not a human
if(!(_unit getVariable "restrained")) exitWith {}; //He's not restrained.
if(_unit getVariable ["civrestrained",false] && !license_civ_bounty) exitWith {if(playerSide == west) then {hint "This person is not restrained, but ziptied. Please unziptie him then restrain him.";};};
if(!((side _unit) in [civilian])) exitWith {}; //Not a civ
if(isNull _unit) exitWith {}; //Not valid


//_index = [getPlayerUID _unit,life_wanted_list] call TON_fnc_index;

if((_unit getVariable["life_crimes",[[],0]]) select 1 > 0 || playerSide == west) then
{
	if(playerSide == civilian) then {["bounty",50] call life_fnc_addProfessionPoints;};
	[[_unit,player,false],"life_fnc_wantedBounty",false,false] spawn life_fnc_MP;
	if(isNull _unit) exitWith {}; //Not valid
	detach _unit;
	[20] call life_fnc_addXP;
	[[_unit,false],"life_fnc_jail",_unit,false] spawn life_fnc_MP;
	[[0,format[localize "STR_NOTF_Arrested_1", _unit getVariable["realname",name _unit], profileName]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
} else {
	hint "This person is not wanted so you cannot arrest him.";	
};