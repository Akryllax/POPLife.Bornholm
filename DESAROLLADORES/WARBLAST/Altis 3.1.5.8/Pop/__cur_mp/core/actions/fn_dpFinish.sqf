/*
	File: fn_dpFinish.sqf
	Author: Bryan "Tonic" Boardwine, Ciaran Langton
	
	Description:
	Finishes the DP Mission and calculates the money earned based
	on distance between A->B
*/
private["_dp","_dis","_price"];
_dp = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
life_delivery_in_progress = false;
life_dp_point = nil;
_dis = round((getPos life_dp_start) distance (getPos _dp));

//Edits for the talents.
_mod = 1.7;
_talent = [4] call life_fnc_hasTalent;
if(_talent) then {_mod = 2;}; //If they have our DP mission talent, throw the modifier up.
_price = round(_mod * _dis);

[20] call life_fnc_addXP;
["DeliverySucceeded",[format[(localize "STR_NOTF_Earned_1"),[_price] call life_fnc_numberText]]] call bis_fnc_showNotification;
life_cur_task setTaskState "Succeeded";
player removeSimpleTask life_cur_task;
ALUK_wonga = ALUK_wonga + _price;