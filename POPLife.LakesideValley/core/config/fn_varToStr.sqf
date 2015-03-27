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
	case "life_inv_wine": {localize "STR_Item_Wine"};
	case "life_inv_beer": {localize "STR_Item_Beer"};
	case "life_inv_oilp": {(localize "STR_Item_OilP")};
	case "life_inv_heroinu": {(localize "STR_Item_HeroinU")};
	case "life_inv_heroinp": {(localize "STR_Item_HeroinP")};
	case "life_inv_uraniumu": {localize "STR_Item_UraniumR"};
	case "life_inv_uraniump": {localize "STR_Item_UraniumB"};
	case "life_inv_marijuana": {(localize "STR_Item_Marijuana")};
	case "life_inv_apple": {(localize "STR_Item_Apple")};
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
	case "life_inv_pickaxe": {localize "STR_Item_Pickaxe"};
	case "life_inv_lockpick": {localize "STR_Item_Lockpick"};
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
	case "life_inv_peach": {(localize "STR_Item_Peach")};
	case "life_inv_coke": {(localize "STR_Item_CocaineU")};
	case "life_inv_cokep": {(localize "STR_Item_CocaineP")};
	case "life_inv_spikeStrip": {(localize "STR_Item_SpikeStrip")};
	case "life_inv_barrierCop": {localize "STR_Item_copBarrier"};
	case "life_inv_rock": {(localize "STR_Item_Rock")};
	case "life_inv_cement": {(localize "STR_Item_CementBag")};
	case "life_inv_goldbar": {(localize "STR_Item_GoldBar")};
	case "life_inv_blastingcharge": {localize "STR_Item_blastingCharge"};
	case "life_inv_boltcutter": {(localize "STR_Item_BCutter")};
	case "life_inv_defusekit": {(localize "STR_Item_DefuseKit")};
	case "life_inv_storagesmall": {(localize "STR_Item_StorageBS")};
	case "life_inv_storagebig": {(localize "STR_Item_StorageBL")};
	case "life_inv_wheat": {(localize "STR_Item_wheat")};
	case "life_inv_sunflower": {(localize "STR_Item_sunflower")};
	case "life_inv_corn": {(localize "STR_Item_corn")};
	case "life_inv_bean": {(localize "STR_Item_bean")};
	case "life_inv_cotton": {(localize "STR_Item_cotton")};
	case "life_inv_olive": {(localize "STR_Item_olive")};
	case "life_inv_opium": {localize "STR_Item_Opium"};
	case "life_inv_cannabis": {(localize "STR_Item_cannabis")};
	case "life_inv_pumpkin": {(localize "STR_Item_Pumpkin")};
	case "life_inv_wheatseeds": {(localize "STR_Item_wheatseeds")};
	case "life_inv_sunflowerseeds": {(localize "STR_Item_sunflowerseeds")};
	case "life_inv_cornseeds": {(localize "STR_Item_cornseeds")};
	case "life_inv_beanseeds": {(localize "STR_Item_beanseeds")};
	case "life_inv_cottonseeds": {(localize "STR_Item_cottonseeds")};
	case "life_inv_oliveseeds": {(localize "STR_Item_oliveseeds")};
	case "life_inv_pavotseeds": {localize "STR_Item_Opiumseeds"};
	case "life_inv_cocaseeds": {localize "STR_Item_Cocaseeds"};
	case "life_inv_cannabisseeds": {(localize "STR_Item_cannabisseeds")};
	case "life_inv_pumpkinseeds": {(localize "STR_Item_Pumpkinseeds")};
    case "life_inv_multipass": {localize "STR_generic_multipass"};
    case "life_inv_menottes": {localize "STR_Item_handcuffs"};
	//Additions
	case "life_inv_zoobeer": {"Zoo Beer"};
	case "life_inv_wall": {localize "STR_Item_Wall"};
	case "life_inv_cone": {localize "STR_Item_roadCone"};
	case "life_inv_coneStrip": {localize "STR_Item_roadConeStrip"};
	case "life_inv_jack": {localize "STR_Item_jackDaniels"};
	case "life_inv_cigarette": {localize "STR_Item_cigarette"};
	case "life_inv_RoadConeStripB": {localize "STR_Item_roadConeBlinkStip"};
	case "life_inv_RoadConeB": {localize "STR_Item_roadConeBlink"};
	case "life_inv_RoadConeStrip": {localize "STR_Item_roadConeBlinkStip"};
	case "life_inv_RoadCone": {localize "STR_Item_roadCone"};
	case "life_inv_RoadBlockWood": {localize "STR_Item_roadblockWooden"};
	case "life_inv_RoadBlockConc": {localize "STR_Item_roadblockConcrete"};
	case "life_inv_RoadBlockRebel": {localize "STR_Item_roadblockRebel"};
	case "life_inv_BarGate": {localize "STR_Item_copBarrier"};
	case "life_inv_raxsrum": {localize "STR_Item_raxrum"};
	case "life_inv_valla": {localize "STR_Item_Wall"};
	case "life_inv_cono": {"Cono"};
	// Esposas y LLaves
	case "life_inv_handcuffs": {(localize "STR_Item_Handcuffs")};
    case "life_inv_handcuffkeys": {(localize "STR_Item_Handcuffkeys")};

	//Nuevo Sistema
	case "life_inv_carbon": {localize "STR_Item_carbon"};
	case "life_inv_polvora": {localize "STR_Item_polvora"};
	case "life_inv_aguasucia": {localize "STR_Item_aguasucia"};
	case "life_inv_cajaali": {localize "STR_Item_cajaali"};
	case "life_inv_cajamedi": {localize "STR_Item_cajamedi"};
	case "life_inv_cajabotellas": {localize "STR_Item_cajabotellas"};
	case "life_inv_barrera": {localize "STR_Item_copBarrier"};
	case "life_inv_hierro": {localize "STR_Item_hierro"};
	case "life_inv_lingotehierro": {localize "STR_Item_lingotehierro"};
	case "life_inv_granlingote": {"Gran Lingote"};
	case "life_inv_pocionparkour": {"Pocion de parkour"};
	case "life_inv_coctelmolotov": {"Coctel Molotov"};
	case "life_inv_pastilladeexperiencia": {"Pastilla de Experiencia"};
	case "life_inv_placadecristal": {"Placa de Cristal"};
	case "life_inv_pepelmoneda": {"Papel Moneda"};
	case "life_inv_componenteselectricos": {"componentes electricos"};
	case "life_inv_pintura": {"Pintura"};
	case "life_inv_papel": {"Papel"};
	case "life_inv_alcohol": {"Alcohol"};
	case "life_inv_amoniaco": {"Amoniaco"};
	case "life_inv_cb": {"Visa"};

	//Objetos de controles Tisor

	case "life_inv_popcono": {"Cono con luz"};
	case "life_inv_popconosinluz": {"Cono sin luz"};
	case "life_inv_popbarrera": {"Barrera peq. con luz"};
	case "life_inv_popbarreragrande": {"Barrera grande"};
	case "life_inv_poparrowdeskright": {"Señal flechas derecha"};
	case "life_inv_poparrowdeskleft": {"Señal flechas izquierda"};


	//License Block

	case "license_civ_driver": {(localize "STR_License_Driver")};
	case "license_civ_air": {(localize "STR_License_Pilot")};
	case "license_civ_heroin": {(localize "STR_License_Heroin")};
	case "license_civ_uranium": {localize "STR_License_uranium"};
	case "license_civ_oil": {(localize "STR_License_Oil")};
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
	case "license_civ_sand": {(localize "STR_License_Sand")};
	case "license_civ_salt": {(localize "STR_License_Salt")};
	case "license_civ_coke": {(localize "STR_License_Cocaine")};
	case "license_civ_marijuana": {(localize "STR_License_Marijuana")};
	case "license_civ_cement": {(localize "STR_License_Cement")};
	case "license_med_air": {(localize "STR_License_Pilot")};
	case "license_civ_home": {(localize "STR_License_Home")};
	case "license_civ_taxita": {(localize "STR_License_taxita")};
	case "license_civ_periodista": {(localize "STR_License_perdiodista")};
	case "license_civ_transporte": {"Transportista"};
	case "license_civ_donator": {(localize "STR_License_donator")};
};
