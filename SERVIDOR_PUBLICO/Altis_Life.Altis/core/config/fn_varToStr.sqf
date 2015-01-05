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
	case "life_inv_oilu": {(localize "STR_Item_OilU")};
	case "life_inv_oilp": {(localize "STR_Item_OilP")};
	case "life_inv_heroinu": {(localize "STR_Item_HeroinU")};
	case "life_inv_heroinp": {(localize "STR_Item_HeroinP")};
	case "life_inv_cannabis": {(localize "STR_Item_Cannabis")};
	case "life_inv_marijuana": {(localize "STR_Item_Marijuana")};
	case "life_inv_apple": {(localize "STR_Item_Apple")};
	case "life_inv_pear": {(localize "STR_Item_Pear")};
	case "life_inv_rabbit": {(localize "STR_Item_RabbitMeat")};
	case "life_inv_salema": {(localize "STR_Item_SalemaMeat")};
	case "life_inv_ornate": {(localize "STR_Item_OrnateMeat")};
	case "life_inv_mackerel": {(localize "STR_Item_MackerelMeat")};
	case "life_inv_mullet": {(localize "STR_Item_MulletMeat")};
	case "life_inv_tuna": {(localize "STR_Item_TunaMeat")};
	case "life_inv_salemap": {(localize "STR_Item_SalemaMeatp")};
	case "life_inv_ornatep": {(localize "STR_Item_OrnateMeatp")};
	case "life_inv_mackerelp": {(localize "STR_Item_MackerelMeatp")};
	case "life_inv_mulletp": {(localize "STR_Item_MulletMeatp")};
	case "life_inv_tunap": {(localize "STR_Item_TunaMeatp")};
	case "life_inv_surimi": {(localize "STR_Item_Surimi")};
	case "life_inv_lataatun": {(localize "STR_Item_LataAtun")};
	case "life_inv_catshark": {(localize "STR_Item_CatSharkMeat")};
	case "life_inv_turtle": {(localize "STR_Item_TurtleMeat")};
	case "life_inv_carnet_t": { ("CarneTortuga") };
	case "life_inv_piel": {(localize "STR_Item_PielTortuga")};	
	case "life_inv_fishingpoles": {(localize "STR_Item_FishingPole")};
	case "life_inv_water": {(localize "STR_Item_WaterBottle")};
	case "life_inv_coffee": {(localize "STR_Item_Coffee")};
	case "life_inv_donuts": {(localize "STR_Item_Donuts")};
	case "life_inv_fuelE": {(localize "STR_Item_FuelE")};
	case "life_inv_fuelF": {(localize "STR_Item_FuelF")};
	case "life_inv_pickaxe": {(localize "STR_Item_Pickaxe")};
	case "life_inv_copperore": {(localize "STR_Item_CopperOre")};
	case "life_inv_ironore": {(localize "STR_Item_IronOre")};
	case "life_inv_ironr": {(localize "STR_Item_IronIngot")};
	case "life_inv_copperr": {(localize "STR_Item_CopperIngot")};
	case "life_inv_sand": {(localize "STR_Item_Sand")};
	case "life_inv_salt": {(localize "STR_Item_Salt")};
	case "life_inv_saltr": {(localize "STR_Item_SaltR")};
	case "life_inv_glass": {(localize "STR_Item_Glass")};
	case "life_inv_diamond": {(localize "STR_Item_DiamondU")};
	case "life_inv_diamondr": {(localize "STR_Item_DiamondC")};
	case "life_inv_tbacon": {(localize "STR_Item_TBacon")};
	case "life_inv_redgull": {(localize "STR_Item_RedGull")};
	case "life_inv_lockpick": {(localize "STR_Item_Lockpick")};
	case "life_inv_peach": {(localize "STR_Item_Peach")};
	case "life_inv_coke": {(localize "STR_Item_CocaineU")};
	case "life_inv_cokep": {(localize "STR_Item_CocaineP")};
	case "life_inv_spikeStrip": {(localize "STR_Item_SpikeStrip")};
	case "life_inv_rock": {(localize "STR_Item_Rock")};
	case "life_inv_cement": {(localize "STR_Item_CementBag")};
	case "life_inv_goldbar": {(localize "STR_Item_GoldBar")};
	case "life_inv_blastingcharge": {(localize "STR_Item_BCharge")};
	case "life_inv_boltcutter": {(localize "STR_Item_BCutter")};
	case "life_inv_defusekit": {(localize "STR_Item_DefuseKit")};
	case "life_inv_storagesmall": {(localize "STR_Item_StorageBS")};
	case "life_inv_storagebig": {(localize "STR_Item_StorageBL")};
	case "life_inv_zipties": {(localize "STR_Item_ZipTies")};
	case "life_inv_biofruta": {(localize "STR_Item_Biofruta")};
    case "life_inv_u234": {(localize "STR_Item_U234")};
	case "life_inv_u235": {(localize "STR_Item_U235")};
	case "life_inv_u238": {(localize "STR_Item_U238")};
    case "life_inv_bu234": {(localize "STR_Item_BU234")};
	case "life_inv_bu235": {(localize "STR_Item_BU235")};
	case "life_inv_bu238": {(localize "STR_Item_BU238")};
	case "life_inv_uenriquecido": {(localize "STR_Item_Uenriquecido")};
	case "life_inv_bombanuclear": {(localize "STR_Item_Bombanuclear")};


	
	//License Block
	case "license_civ_driver": {(localize "STR_License_Driver")};
	case "license_civ_air": {(localize "STR_License_Pilot_Heli")};
	case "license_civ_plane": {(localize "STR_License_Pilot_Plane")};
	case "license_civ_heroin": {(localize "STR_License_Heroin")};
	case "license_civ_oil": {(localize "STR_License_Oil")};
	case "license_civ_dive": {(localize "STR_License_Diving")};
	case "license_civ_boat": {(localize "STR_License_Boat")};
	case "license_civ_gun": {(localize "STR_License_Firearm")};
	case "license_cop_air": {(localize "STR_License_Pilot_Heli")};
	case "license_cop_swat": {(localize "STR_License_Swat")};
	case "license_cop_cg": {(localize "STR_License_CG")};
	case "license_civ_rebel": {(localize "STR_License_Rebel")};
	case "license_civ_truck": {(localize "STR_License_Truck")};
	case "license_civ_diamond": {(localize "STR_License_Diamond")};
	case "license_civ_copper": {(localize "STR_License_Copper")};
	case "license_civ_tortuga": {(localize "STR_License_Tortuga")};
	case "license_civ_pelar": {(localize "STR_License_Pelar")};
	case "license_civ_iron": {(localize "STR_License_Iron")};
	case "license_civ_sand": {(localize "STR_License_Sand")};
	case "license_civ_salt": {(localize "STR_License_Salt")};
	case "license_civ_coke": {(localize "STR_License_Cocaine")};
	case "license_civ_marijuana": {(localize "STR_License_Marijuana")};
	case "license_civ_cement": {(localize "STR_License_Cement")};
	case "license_med_air": {(localize "STR_License_Pilot_Heli")};
	case "license_civ_home": {(localize "STR_License_Home")};
	case "license_civ_zumos": {(localize "STR_License_Zumos")};
	case "license_civ_fusion": {(localize "STR_License_Fusion")};
	case "license_civ_licenciauranio": {(localize "STR_License_Licenciauranio")};
	case "license_civ_licenciabomba": {(localize "STR_License_Licenciabomba")};
	case "license_civ_bountyh": {(localize "STR_License_Bountyh")};
	case "license_civ_limpiarpescado": {(localize "STR_License_LimpiarPescado")};
	case "license_civ_enlataratun": {(localize "STR_License_LataAtun")};
	case "license_civ_enlatarpescado": {(localize "STR_License_LataPescado")};

	//Gold hunting
	case "life_inv_underwatercharge": {(localize "STR_Item_UCharge")};
	case "life_inv_goldbarp": {(localize "STR_Item_GoldScrap")};

	//Enfermedades
	case "life_inv_jerinCostipado": { ("Inyectable (Costipado)") };
	case "life_inv_jerinEbola": { ("Inyectable (Ebola)") };
	case "life_inv_jerinCeguera": { ("Inyectable (Ceguera)") };
	case "life_inv_jerinTranquilizante": { ("Inyectable (Tranquilizante)") };
	case "life_inv_jerinHipotermia": { ("Inyectable (Hipotermia)") };
	case "life_inv_medicAntibiotico": { ("Farmaco (Antibiotico)") };
	case "life_inv_medicAnticuerpos": { ("Farmaco (Anticuerpos)") };
	case "life_inv_medicCalor": { ("Bolsa de calor") };
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
	//items policia
	case "life_inv_cono": {"Cono"};
	case "life_inv_barrera": {"Barrera"};
	case "life_inv_barricada": {"Barricada"};
	case "life_inv_valla": {"Valla"};
	case "life_inv_muro": {"Muro"};
};