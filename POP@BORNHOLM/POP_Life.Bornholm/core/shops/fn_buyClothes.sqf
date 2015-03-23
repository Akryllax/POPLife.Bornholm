/*
	File: fn_buyClothes.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Buys the current set of clothes and closes out of the shop interface.
*/
private["_price"];
if((lbCurSel 3101) == -1) exitWith {titleText[localize "STR_Shop_NoClothes","PLAIN"];};

_price = 0;
{
	if(_x != -1) then
	{
		_price = _price + _x;
	};
} foreach life_clothing_purchase;

if(_price > pop_dinero) exitWith {titleText[localize "STR_Shop_NotEnoughClothes","PLAIN"];};
pop_dinero = pop_dinero - _price;

life_clothesPurchased = true;
closeDialog 0;
