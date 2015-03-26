/*
	File: fn_itemIcon.sqf
	Author: EdgeKiller

	Description:
	Return the icon for each altis life item.
*/
private["_var"];
_var = [_this,0,"",[""]] call BIS_fnc_param;
if(_var == "") exitWith {""};

switch (_var) do
{
	//Virtual Inventory Items
	case "life_inv_oilu": {("textures\icons\items\oil_unprocessed.paa")};
	case "life_inv_oilp": {("textures\icons\items\oil_processed.paa")};
	case "life_inv_heroinu": {("textures\icons\items\heroin_unprocessed.paa")};
	case "life_inv_heroinp": {("textures\icons\items\heroin_processed.paa")};
	case "life_inv_cannabis": {("textures\icons\items\cannabis.paa")};
	case "life_inv_marijuana": {("textures\icons\items\marijuana.paa")};
	case "life_inv_maiz": {("textures\icons\items\maiz.paa")};
	case "life_inv_rabbit": {("textures\icons\items\meat.paa")};
	case "life_inv_salema": {("textures\icons\items\fish.paa")};
	case "life_inv_ornate": {("textures\icons\items\fish.paa")};
	case "life_inv_mackerel": {("textures\icons\items\fish.paa")};
	case "life_inv_tuna": {("textures\icons\items\fish.paa")};
	case "life_inv_mullet": {("textures\icons\items\fish.paa")};
	case "life_inv_catshark": {("textures\icons\items\fish.paa")};
	case "life_inv_turtle": {("textures\icons\items\turtle.paa")};
	case "life_inv_fishingpoles": {("textures\icons\items\fishingpoles.paa")};
	case "life_inv_water": {("textures\icons\items\water.paa")};
	case "life_inv_coffee": {("textures\icons\items\coffee.paa")};
	case "life_inv_turtlesoup": {("textures\icons\items\turtle_soup.paa")};
	case "life_inv_donuts": {("textures\icons\items\donut.paa")};
	case "life_inv_fuelE": {("textures\icons\items\fuel_can.paa")};
	case "life_inv_fuelF": {("textures\icons\items\fuel_can.paa")};
	case "life_inv_pickaxe": {("textures\icons\items\pickaxe.paa")};
	case "life_inv_copperore": {("textures\icons\items\copper_ore.paa")};
	case "life_inv_ironore": {("textures\icons\items\iron_ore.paa")};
	case "life_inv_ironr": {("textures\icons\items\iron.paa")};
	case "life_inv_copperr": {("textures\icons\items\copper.paa")};
	case "life_inv_sand": {("textures\icons\items\sand.paa")};
	case "life_inv_salt": {("textures\icons\items\salt_unprocessed.paa")};
	case "life_inv_saltr": {("textures\icons\items\salt.paa")};
	case "life_inv_glass": {("textures\icons\items\glass.paa")};
	case "life_inv_diamond": {("textures\icons\items\diamond_unprocessed.paa")};
	case "life_inv_diamondr": {("textures\icons\items\diamond.paa")};
	case "life_inv_tbacon": {("textures\icons\items\meat.paa")};
	case "life_inv_redgull": {("textures\icons\items\redgull.paa")};
	case "life_inv_lockpick": {("textures\icons\items\lockpick.paa")};
	case "life_inv_peach": {("textures\icons\items\peach.paa")};
	case "life_inv_coke": {("textures\icons\items\cocain_unprocessed.paa")};
	case "life_inv_cokep": {("textures\icons\items\cocain_processed.paa")};
	case "life_inv_spikeStrip": {("textures\icons\items\spikestrip.paa")};
	case "life_inv_rock": {("textures\icons\items\rock.paa")};
	case "life_inv_cement": {("textures\icons\items\cement.paa")};
	case "life_inv_goldbar": {("textures\icons\items\goldbar.paa")};
	case "life_inv_blastingcharge": {("textures\icons\items\blastingcharge.paa")};
	case "life_inv_boltcutter": {("textures\icons\items\boltcutter.paa")};
	case "life_inv_defusekit": {("textures\icons\items\defusekit.paa")};
	//case "life_inv_storagesmall": {("textures\icons\items\storagesmall.paa")};
	//case "life_inv_storagebig": {("textures\icons\items\storagebig.paa")};
	default {("textures\icons\items\noicon.paa")};

};