/*
	File: fn_varToStr.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Takes the long-name (variable) and returns a display name for our
	virtual item.
*/
private["_var"];
_var = [_this,0,"",[""]] call BIS_fnc_param;
if(_var == "") exitWith {""};

switch (_var) do
{
	//Virtual Inventory Items
	case "life_inv_platino": {("Esquirla de platino")};
	case "life_inv_platinos": {("Onza de platino")};
	case "life_inv_heroinu": {(localize "STR_Item_HeroinU")};
	case "life_inv_heroinp": {(localize "STR_Item_HeroinP")};
	case "life_inv_cannabis": {(localize "STR_Item_Cannabis")};
	case "life_inv_marijuana": {(localize "STR_Item_Marijuana")};
	case "life_inv_maiz": {("Maiz")};
	case "life_inv_rabbit": {(localize "STR_Item_RabbitMeat")};
	case "life_inv_salema": {(localize "STR_Item_SalemaMeat")};
	case "life_inv_ornate": {(localize "STR_Item_OrnateMeat")};
	case "life_inv_mackerel": {(localize "STR_Item_MackerelMeat")};
	case "life_inv_tuna": {(localize "STR_Item_TunaMeat")};
	case "life_inv_mullet": {(localize "STR_Item_MulletMeat")};
	case "life_inv_catshark": {(localize "STR_Item_CatSharkMeat")};
	case "life_inv_turtle": {(localize "STR_Item_TurtleMeat")};
	case "life_inv_fishingpoles": {(localize "STR_Item_FishingPole")};
	case "life_inv_water": {(localize "STR_Item_WaterBottle")};
	case "life_inv_coffee": {(localize "STR_Item_Coffee")};
	case "life_inv_turtlesoup": {(localize "STR_Item_TurtleSoup")};
	case "life_inv_donuts": {(localize "STR_Item_Donuts")};
	case "life_inv_fuelE": {(localize "STR_Item_FuelE")};
	case "life_inv_fuelF": {(localize "STR_Item_FuelF")};
	case "life_inv_pickaxe": {(localize "STR_Item_Pickaxe")};
	case "life_inv_copperore": {(localize "STR_Item_CopperOre")};
	case "life_inv_ironore": {(localize "STR_Item_IronOre")};
	case "life_inv_ironr": {(localize "STR_Item_IronIngot")};
	case "life_inv_copperr": {(localize "STR_Item_CopperIngot")};
	case "life_inv_carbon": {("Roca de Carbon")};
	case "life_inv_oro": {("Pepita de oro")};
	case "life_inv_oros": {("Lingote de oro")};
	case "life_inv_carbons": {("Carbon")};
	case "life_inv_diamond": {(localize "STR_Item_DiamondU")};
	case "life_inv_diamondr": {(localize "STR_Item_DiamondC")};
	case "life_inv_tbacon": {(localize "STR_Item_TBacon")};
	case "life_inv_redgull": {(localize "STR_Item_RedGull")};
	case "life_inv_lockpick": {(localize "STR_Item_Lockpick")};
	case "life_inv_peach": {("Trigo")};
	case "life_inv_coke": {(localize "STR_Item_CocaineU")};
	case "life_inv_cokep": {(localize "STR_Item_CocaineP")};
	case "life_inv_spikeStrip": {(localize "STR_Item_SpikeStrip")};
	case "life_inv_granito": {("Roca de Granito")};
	case "life_inv_granitos": {("Granito")};
	case "life_inv_goldbar": {(localize "STR_Item_GoldBar")};
	case "life_inv_blastingcharge": {(localize "STR_Item_BCharge")};
	case "life_inv_boltcutter": {(localize "STR_Item_BCutter")};
	case "life_inv_defusekit": {(localize "STR_Item_DefuseKit")};
	case "life_inv_storagesmall": {(localize "STR_Item_StorageBS")};
	case "life_inv_storagebig": {(localize "STR_Item_StorageBL")};
	// Helicrash
	case "life_inv_centralita": {(localize "STR_Item_Centralita")};
	case "life_inv_trajesoldado": {(localize "STR_Item_TrajeSoldado")};
	case "life_inv_chatarra": {(localize "STR_Item_Chatarra")};
	case "life_inv_piezasmotor": {(localize "STR_Item_PiezasMotor")};
	case "life_inv_municionmilitar": {(localize "STR_Item_MunicionMilitar")};
	case "life_inv_medallas": {(localize "STR_Item_Medallas")};
	case "life_inv_kevlar": {(localize "STR_Item_Kevlar")};
	// Naufragio
	case "life_inv_pergamino": {(localize "STR_Item_Pergamino")};
	case "life_inv_vasija": {(localize "STR_Item_Vasija")};
	case "life_inv_jarron": {(localize "STR_Item_Jarron")};
	case "life_inv_doblon": {(localize "STR_Item_Doblon")};
	case "life_inv_brazalete": {(localize "STR_Item_Brazalete")};
	case "life_inv_catalejo": {(localize "STR_Item_Catalejo")};
	case "life_inv_abrecartas": {(localize "STR_Item_Abrecartas")};
	case "life_inv_collar": {(localize "STR_Item_Collar")};
	case "life_inv_cetro": {(localize "STR_Item_Cetro")};
	case "life_inv_esposas": {(localize "STR_Item_esposas")};
    case "life_inv_llaveesposas": {(localize "STR_Item_llaveesposas")};
     //trabajos
     case "life_inv_metilamina":{("Metilamina")};
     case "life_inv_meta":{("Meta")};
     case "life_inv_petroleo":{("Petroleo")};

     //objetos espia
	case "life_inv_gpsEspia": { ("GPS espia") };
	//semillas
	case "life_inv_semillasMaria":{("Semillas Marihuana")};
	case "life_inv_semillasCoca":{("Semillas Coca")};
	case "life_inv_semillasTomate":{("Semillas Tomate")};
	case "life_inv_semillasMaiz":{("Semillas Maiz")};
	// frutos
	case "life_inv_tomates": {("Tomates")};
	case "life_inv_maiz": {("Maiz")};
	//items Rosen
	//License Block
	case "license_civ_driver": {(localize "STR_License_Driver")};
	case "license_civ_air": {(localize "STR_License_Pilot")};
	case "license_civ_heroin": {(localize "STR_License_Heroin")};
	case "license_civ_platino": {(localize "Licencia de Platino")};
	case "license_civ_dive": {(localize "STR_License_Diving")};
	case "license_civ_boat": {(localize "STR_License_Boat")};
	case "license_civ_gun": {(localize "STR_License_Firearm")};
	case "license_cop_air": {(localize "STR_License_Pilot")};
	case "license_cop_swat": {(localize "STR_License_Swat")};
	case "license_cop_cg": {(localize "STR_License_CG")};
	case "license_civ_rebel": {(localize "STR_License_Rebel")};
	case "license_civ_truck": {(localize "STR_License_Truck")};
	case "license_civ_diamond": {(localize "STR_License_Diamond")};
	case "license_civ_copper": {(localize "STR_License_Copper")};
	case "license_civ_iron": {(localize "STR_License_Iron")};
	case "license_civ_carbon": {("Licencia Carbon")};
	case "license_civ_oro": {("Licencia de Oro")};
	case "license_civ_coke": {(localize "STR_License_Cocaine")};
	case "license_civ_marijuana": {(localize "STR_License_Marijuana")};
	case "license_civ_granitos": {("Licencia Granito")};
	case "license_med_air": {(localize "STR_License_Pilot")};
	case "license_civ_home": {(localize "STR_License_Home")};
	case "license_civ_cazarrecompensas": {(localize "STR_License_Cazarrecompensas")};

	//Prof Block
case "Geologo_Prof": {("Geologia")};
case "Fundicion_Prof": {("Herrero")};
case "Granjero_Prof": {("Granja")};
case "Droga_Prof": {("Drogas")};
};
