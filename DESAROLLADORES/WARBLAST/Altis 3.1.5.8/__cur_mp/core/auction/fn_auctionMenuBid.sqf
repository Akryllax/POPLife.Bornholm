/* 
	File: fn_auctionMenuBid.sqf
	
	Author: Ciaran Langton
	Date: 2015-03-07 14:11:39
	Last Modified by: Ciaran Langton
	Last Modified time: 2015-03-08 18:34:23
*/
disableSerialization;
_display = findDisplay 13750;
if(isNull _display) exitWith {};
_list = _display displayCtrl 1500;
_data = _list lbData (lbCurSel _list);
_data = call compile format["%1",_data];

_bid = ctrlText (_display displayCtrl 1400);  
if(!([_bid] call TON_fnc_isnumber)) exitWith {hint "Please enter a number for the minimum bid.";};
_bid = parseNumber _bid; //To number.

if(_bid < _data select 7) exitWith {hint format["The minimum bid is £%1, you only bidded £%2.",([_data select 7] call life_fnc_numberText),([_bid] call life_fnc_numberText)]};
if(_bid <= _data select 10) exitWith {hint format["The current bid is £%1, you only bidded £%2.",([_data select 10] call life_fnc_numberText),([_bid] call life_fnc_numberText)]};
[[player,_data select 0,_data select 2,_bid],"AUCTION_fnc_auctionBid",false,false] spawn life_fnc_MP;
closeDialog 0;
hint "Auction Bid Request Sent.";