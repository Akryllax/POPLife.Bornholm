#include <macro.h>
/*
	File: fn_virt_sell.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Sell a virtual item to the store / shop
*/
private["_type","_index","_price","_var","_amount","_name"];
if((lbCurSel 2402) == -1) exitWith {};
_type = lbData[2402,(lbCurSel 2402)];
_index = [_type,dynamic_sell_array] call TON_fnc_index;
if(_index == -1) exitWith {};
//_price = (dynamic_sell_array select _index) select 1;
_price = round((dynamic_sell_array select _index) select 1);

//NDJ 28May14 - Make other heroin dealers pay less or more!
if(life_shop_type == "heroin2") then {_price = _price * 0.25;}; //quarter of normal price!
if(life_shop_type == "heroin3") then {_price = _price * 1.50;}; //1.5 times normal price!

//Skills to get more cash from jobs.
if(life_shop_type == "gold" && [17] call life_fnc_hasTalent) then {_price = _price * 1.25;}; //25% more for gold with the perk.
if(life_shop_type in ["heroin","heroin2","heroin3"] && [18] call life_fnc_hasTalent) then {_price = _price * 1.25;};
if(life_shop_type in ["meth"] && [19] call life_fnc_hasTalent) then {_price = _price * 1.25;};

_var = [_type,0] call life_fnc_varHandle;

_amount = ctrlText 2405;
if(!([_amount] call TON_fnc_isnumber)) exitWith {hint localize "STR_Shop_Virt_NoNum";};
_amount = parseNumber (_amount);
if(_amount > (missionNameSpace getVariable _var)) exitWith {hint localize "STR_Shop_Virt_NotEnough"};

_price = (_price * _amount);
_name = [_var] call life_fnc_vartostr;
if(([false,_type,_amount] call life_fnc_handleInv)) then
{
	hint format[localize "STR_Shop_Virt_SellItem",_amount,_name,[_price] call life_fnc_numberText];
	ALUK_wonga = ALUK_wonga + _price;
	[[_type,_amount],"TON_fnc_sellItem",false,false] spawn life_fnc_MP;
	[] call life_fnc_virt_update;
	//Handle PP.
	switch (_type) do {
		case "apple": {["apple",_amount] call life_fnc_addProfessionPoints;};
		case "peach": {["peach",_amount] call life_fnc_addProfessionPoints;};
		case "frogleg": {["frogleg",(_amount * 3)] call life_fnc_addProfessionPoints;};
		case "lsd": {["lsd",(_amount * 2)] call life_fnc_addProfessionPoints;};
		case "marijuana": {["marijuana",(_amount * 2)] call life_fnc_addProfessionPoints;};
		case "oilp": {["oil",(_amount * 3)] call life_fnc_addProfessionPoints;};
		case "cocainep": {["coke",(_amount * 2)] call life_fnc_addProfessionPoints;};
		case "crystalmeth": {["meth",(_amount * 2)] call life_fnc_addProfessionPoints;};
		case "lsd": {["lsd",(_amount * 2)] call life_fnc_addProfessionPoints;};
		case "glass": {["sand",(_amount * 2)] call life_fnc_addProfessionPoints;};
		case "iron_r": {["iron",(_amount * 2)] call life_fnc_addProfessionPoints;};
		case "copper_r": {["copper",(_amount * 2)] call life_fnc_addProfessionPoints;};
		case "diamondc": {["diamond",(_amount * 2)] call life_fnc_addProfessionPoints;};
		case "diamond": {["diamond",_amount] call life_fnc_addProfessionPoints;};
		case "salt_r": {["salt",(_amount * 2)] call life_fnc_addProfessionPoints;};
		case "cement": {["cement",(_amount * 2)] call life_fnc_addProfessionPoints;};
		case "cider": {["cider",(_amount * 2)] call life_fnc_addProfessionPoints;};
	};
	if(_type in ["roundobject","squareobject","brokenstatue","oldpottery","stonetablet","brokenbell","emptybottle","strangeobject","rustediron","foolsgold","oldgoldbar"]) then {
		["boatwreck",_amount] call life_fnc_addProfessionPoints;
	};
};

//NDJ REMEMBER to add any heroin shop variations in here too!
//CL Add meth store here.
if(life_shop_type in ["heroin","heroin2","heroin3","meth"]) then
{
	private["_array","_ind","_val"];
	_array = life_shop_npc getVariable["sellers",[]];
	_ind = [getPlayerUID player,_array] call TON_fnc_index;
	if(_ind != -1) then
	{
		_val = (_array select _ind) select 2;
		_val = _val + _price;
		_array set[_ind,[getPlayerUID player,profileName,_val]];
		life_shop_npc setVariable["sellers",_array,true];
	}
		else
	{
		_array pushBack [getPlayerUID player,profileName,_price];
		life_shop_npc setVariable["sellers",_array,true];
	};
};
[0] call SOCK_fnc_updatePartial;