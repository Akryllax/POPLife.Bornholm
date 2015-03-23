/*
	File: fn_shopMenus.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Master config for a thing that will be gone eventually..
*/
private["_shop"];
_shop = [_this,0,"",[""]] call BIS_fnc_param;
if(_shop == "") exitWith {closeDialog 0;};

if(!dialog) then
{
	if(!(createDialog "shop_menu")) exitWith {};
};
disableSerialization;
ctrlSetText[601,format["Cash: $%1",[life_popeur] call life_fnc_numberText]];

switch (_shop) do
{
	case "reb":
	{
		ctrlSetText[2505,"Tienda de la mafia"];
		ctrlShow[2503,false];
		ctrlShow[2513,false];
		ctrlShow[2514,false];
	};

	case "cop":
	{
		ctrlSetText[2505,"Tienda general de policia"];
		ctrlShow[2503,false];
	};

	case "gun":
	{
		ctrlSetText[2505,"Armeria"];
		ctrlShow[2503,false];
		ctrlShow[2513,false];
		ctrlShow[2514,false];
	};

	case "gang":
	{
		ctrlSetText[2505,"Tienda de banda"];
		ctrlShow[2503,false];
		ctrlShow[2513,false];
		ctrlShow[2514,false];
	};

	case "dive":
	{
		ctrlSetText[2505,"Tienda de buceo"];
		ctrlShow[2503,false];
		ctrlShow[2510,false];
		ctrlShow[2511,false];
		ctrlShow[2513,false];
	};

	case "don":
	{
		ctrlSetText[2505,"Tienda de donadores"];
	};

	case "sergeant":
	{
		ctrlSetText[2505,"Tienda locales"];
		ctrlShow[2503,false];
	};

	case "gen":
	{
		ctrlSetText[2505,"Tienda de Altis"];
		ctrlShow[2503,false];
	};

	case "officer":
	{
		ctrlSetText[2505,"Tienda nacionales"];
		ctrlShow[2503,false];
	};

	case "admin":
	{
		ctrlSetText[2505,"Tienda admin"];
	};
	case "cazarrecompensas":
	{
		ctrlSetText[2505,"Cazarrecompensas"];
	};
};

["guns"] call life_fnc_shops_changeMenu;
