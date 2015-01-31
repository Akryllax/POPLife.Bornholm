#include <macro.h>
/*
	Master Life Configuration File
	This file is to setup variables for the client, there are still other configuration files in the system

*****************************
***** Backend Variables *****
*****************************
*/

//Reserve variables
life_reserve_minCops = 5;
life_reserve_bombtime = 10 * 60;

life_casino_minCops = 1;
life_casino_bombtime = 10 * 60;

life_query_time = time;
life_action_delay = time;
life_trunk_vehicle = Objnull;
life_session_completed = false;
life_garage_store = false;
life_session_tries = 0;
life_net_dropped = false;
life_hit_explosive = false;
life_siren_active = false;
life_clothing_filter = 0;
life_clothing_uniform = -1;
life_redgull_effect = time;
life_is_processing = false;
life_bail_paid = false;
life_impound_inuse = false;
life_action_inUse = false;
life_spikestrip = ObjNull;
life_respawn_timer = 1; //Scaled in minutes
life_knockout = false;
life_interrupted = false;
life_respawned = false;
life_removeWanted = false;
life_TankLaster = 1; // Camiones cisterna que solo carguen fluidos
life_CargaUranio = 1; // Camiones antiradiacion solo pueden cargar uranio
life_smartphoneTarget = ObjNull;
life_civ_position = nil;
life_is_alive = false;
life_god = false;
life_markers = false;

//Persistent Saving
__CONST__(life_save_civ,TRUE); //Save weapons for civs?
__CONST__(life_save_yinv,TRUE); //Save Y-Inventory for players?

//Revive constant variables.
__CONST__(life_revive_cops,FALSE); //Set to false if you don't want cops to be able to revive downed players.
__CONST__(life_revive_fee,15000); //Fee for players to pay when revived.

//House Limit
__CONST__(life_houseLimit,4); //Maximum amount of houses a player can buy (TODO: Make Tiered licenses).

//Gang related stuff?
__CONST__(life_gangPrice,75000); //Price for creating a gang (They're all persistent so keep it high to avoid 345345345 gangs).
__CONST__(life_gangUpgradeBase,10000); //MASDASDASD
__CONST__(life_gangUpgradeMultipler,2.5); //BLAH

//Uniform price (0),Hat Price (1),Glasses Price (2),Vest Price (3),Backpack Price (4)
life_clothing_purchase = [-1,-1,-1,-1,-1];
/*
*****************************
****** Weight Variables *****
*****************************
*/
life_maxWeight = 24; //Identifies the max carrying weight (gets adjusted throughout game when wearing different types of clothing).
life_maxWeightT = 24; //Static variable representing the players max carrying weight on start.
life_carryWeight = 0; //Represents the players current inventory weight (MUST START AT 0).

/*
*****************************
****** Life Variables *******
*****************************
*/
life_net_dropped = false;
life_hit_explosive = false;
life_siren_active = false;
life_bank_fail = false;
life_use_atm = true;
life_is_arrested = false;
life_delivery_in_progress = false;
life_action_in_use = false;
life_thirst = 100;
life_hunger = 100;
__CONST__(life_paycheck_period,5); //Five minutes
life_cash = 0;
__CONST__(life_impound_car,10000);
__CONST__(life_impound_boat,15000);
__CONST__(life_impound_air,20000);
life_istazed = false;
life_my_gang = ObjNull;

life_vehicles = [];
bank_robber = [];
switch (playerSide) do
{
	case west:
	{
		life_atmcash = 500000; //Starting Bank Money
		life_paycheck = 5000; //Paycheck Amount
	};
	case civilian:
	{
		life_atmcash = 500000; //Starting Bank Money
		life_paycheck = 2500; //Paycheck Amount
	};

	case independent: {
		life_atmcash = 500000;
		life_paycheck = 5000;
	};
	case east:
	{
 		life_atmcash = 0;
 		life_paycheck = 5000;
 	};
};

/*
	Master Array of items?
*/
//life_vShop_rentalOnly = [""];
//__CONST__(life_vShop_rentalOnly,life_vShop_rentalOnly); //These vehicles can never be bought and only 'rented'. Used as a balancer & money sink. If you want your server to be chaotic then fine.. Remove it..

life_inv_items =
[
	"life_inv_oilu",
	"life_inv_oilp",
	"life_inv_heroinu",
	"life_inv_heroinp",
	"life_inv_cannabis",
	"life_inv_marijuana",
	"life_inv_apple",
	"life_inv_rabbit",
	"life_inv_salema",
	"life_inv_ornate",
	"life_inv_mackerel",
	"life_inv_mullet",
	"life_inv_tuna",
	"life_inv_salemap",
	"life_inv_ornatep",
	"life_inv_mackerelp",
	"life_inv_mulletp",
	"life_inv_tunap",
	"life_inv_surimi",
	"life_inv_lataatun",
	"life_inv_catshark",
	"life_inv_turtle",
	"life_inv_carne_t",
	"life_inv_piel",
	"life_inv_fishingpoles",
	"life_inv_water",
	"life_inv_donuts",
	"life_inv_turtlesoup",
	"life_inv_coffee",
	"life_inv_fuelF",
	"life_inv_fuelE",
	"life_inv_pickaxe",
	"life_inv_copperore",
	"life_inv_ironore",
	"life_inv_ironr",
	"life_inv_copperr",
	"life_inv_sand",
	"life_inv_salt",
	"life_inv_saltr",
	"life_inv_glass",
	"life_inv_tbacon",
	"life_inv_lockpick",
	"life_inv_redgull",
	"life_inv_peach",
	"life_inv_diamond",
	"life_inv_coke",
	"life_inv_cokep",
	"life_inv_diamondr",
	"life_inv_spikeStrip",
	"life_inv_rock",
	"life_inv_cement",
	"life_inv_goldbar",
	"life_inv_blastingcharge",
	"life_inv_boltcutter",
	"life_inv_defusekit",
	"life_inv_storagesmall",
	"life_inv_storagebig",
	"life_inv_pear",
	"life_inv_biofruta",
	"life_inv_zipties",
	"life_inv_u234",
	"life_inv_u235",
	"life_inv_u238",
	"life_inv_bu234",
	"life_inv_bu235",
	"life_inv_bu238",
	"life_inv_uenriquecido",
	"life_inv_bombanuclear",
	"life_inv_goldbarp",
	"life_inv_underwatercharge",
	//items policia
	"life_inv_cono",
	"life_inv_barrera",
	"life_inv_barricada",
	"life_inv_valla",
	"life_inv_muro",
	//Enfermedades
	"life_inv_jerinCostipado",
	"life_inv_jerinEbola",
	"life_inv_jerinCeguera",
	"life_inv_jerinTranquilizante",
	"life_inv_jerinHipotermia",
	"life_inv_medicAntibiotico",
	"life_inv_medicAnticuerpos",
	"life_inv_medicCalor",
	//items espia
	"life_inv_gpsEspia",
	//semillas
	"life_inv_semillasMaria",
	"life_inv_semillasCoca",
	"life_inv_semillasMaiz",
	"life_inv_semillasTomate",
	//frutos
	"life_inv_tomates",
	"life_inv_maiz"
];

//Setup variable inv vars.
{missionNamespace setVariable[_x,0];} foreach life_inv_items;
//Licenses [license var, civ/cop]
life_licenses =
[
	["license_cop_air","cop"],
	["license_cop_swat","cop"],
	["license_cop_cg","cop"],
	["license_civ_driver","civ"],
	["license_civ_air","civ"],
	["license_civ_plane","civ"],
	["license_civ_heroin","civ"],
	["license_civ_marijuana","civ"],
//	["license_civ_gang","civ"],
	["license_civ_boat","civ"],
	["license_civ_oil","civ"],
	["license_civ_tortuga","civ"],
	["license_civ_pelar","civ"],
	["license_civ_dive","civ"],
	["license_civ_truck","civ"],
	["license_civ_gun","civ"],
	["license_civ_rebel","civ"],
	["license_civ_coke","civ"],
	["license_civ_diamond","civ"],
	["license_civ_copper","civ"],
	["license_civ_iron","civ"],
	["license_civ_sand","civ"],
	["license_civ_salt","civ"],
	["license_civ_cement","civ"],
	["license_med_air","med"],
	["license_civ_home","civ"],
	["license_civ_zumos","civ"],
	["license_civ_fusion","civ"],
	["license_civ_licenciauranio","civ"],
	["license_civ_licenciabomba","civ"],
	["license_civ_bountyh","civ"],
	["license_civ_limpiarpescado","civ"],
	["license_civ_enlatarpescado","civ"],
	["license_civ_enlataratun","civ"]
];

//Setup License Variables
{missionNamespace setVariable[(_x select 0),false];} foreach life_licenses;

life_dp_points = ["dp_1","dp_2","dp_3","dp_4","dp_5","dp_6","dp_7","dp_8","dp_9","dp_10","dp_11","dp_12","dp_13","dp_14","dp_15","dp_15","dp_16","dp_17","dp_18","dp_19","dp_20","dp_21","dp_22","dp_23","dp_24","dp_25"];
//[shortVar,reward]
life_illegal_items = [["heroinu",1200],["heroinp",2500],["cocaine",1500],["cocainep",3500],["marijuana",2000],["turtle",3000],["blastingcharge",10000],["boltcutter",500],["u234",5000],["u235",5000],["u238",5000],["bu234",15000],["bu235",15000],["bu238",15000],["uenriquecido",30000],["bombanuclear",50000],["carne_t",8000],["piel",15000],["goldbar",150000]];


/*
	Sell / buy arrays
*/
sell_array =
[
	["apple",50],
	["heroinu",3000],
	["heroinp",11500],
	["salema",130],
	["ornate",120],
	["mackerel",175],
	["tuna",700],
	["mullet",250],
	["catshark",300],
	["surimi",10000],
	["lataatun",10000],
	["rabbit",65],
	["oilp",3000],
	["turtle",1000],
	["piel",30000],
	["water",5],
	["coffee",5],
	["turtlesoup",1000],
	["donuts",60],
	["marijuana",2500],
	["tbacon",25],
	["lockpick",75],
	["pickaxe",750],
	["redgull",200],
	["peach",55],
	["cocaine",5500],
	["cocainep",10500],
	["diamond",1000],
	["diamondc",5000],
	["iron_r",1000],
	["copper_r",500],
	["salt_r",330],
	["glass",340],
	["fuelF",500],
	["spikeStrip",1200],
	["cement",650],
	["goldbar",150000],
	["pear",50],
	["biofruta",2000],
	["zipties",2],
	["bombanuclear",10000000],
	["goldbarp",75000],
	["semillasMaria",25000],
	["semillasCoca",50000],
	["semillasMaiz",5000],
	["semillasTomate",3500],
	["tomates",400],
	["maiz",800],
	//D.HERRAMIENTAS POLICIA
	["cono",50],
	["barrera",50],
	["barricada",50],
	["valla",50],
	["muro",50]
];
__CONST__(sell_array,sell_array);

_medicDiscount = 1;
if(side player == independent) then{
	_medicDiscount = 0.1;
};

buy_array =
[
	["rabbit",75],
	["catshark",350],
	["surimi",15000],
	["lataatun",15000],
	["water",10],
	["donuts",120],
	["coffee",10],
	["tbacon",75],
	["lockpick",150],
	["pickaxe",1200],
	["redgull",1500],
	["fuelF",850],
	["spikeStrip",2500],
	["blastingcharge",35000],
	["boltcutter",7500],
	["defusekit",2500],
	["storagesmall",75000],
	["storagebig",150000],
	["biofruta",2000],
	["zipties",100],
	["underwatercharge",40000],
	["jerinHipotermia", 15000],
	["jerinCostipado", 30000],
	["jerinEbola", 45000],
	["jerinCeguera", 10000],
	["jerinTranquilizante", 5000],
	["medicCalor", 10000 * _medicDiscount],
	["medicAntibiotico", 25000 * _medicDiscount],
	["medicAnticuerpos", 50000 * _medicDiscount],
	["semillasMaria",25000],
	["semillasCoca",50000],
	["semillasMaiz",5000],
	["semillasTomate",3500],
	["tomates",400],
	["maiz",800],
	["cono",50],
	["barrera",50],
	["barricada",50],
	["valla",50],
	["muro",50]
];
__CONST__(buy_array,buy_array);

life_weapon_shop_array =
[
	["arifle_sdar_F",7500],
	["hgun_P07_snds_F",650],
	["hgun_P07_F",1500],
	["ItemGPS",45],
	["ToolKit",75],
	["FirstAidKit",65],
	["Medikit",450],
	["NVGoggles",980],
	["16Rnd_9x21_Mag",15],
	["20Rnd_556x45_UW_mag",35],
	["ItemMap",35],
	["ItemCompass",25],
	["Chemlight_blue",50],
	["Chemlight_yellow",50],
	["Chemlight_green",50],
	["Chemlight_red",50],
	["hgun_Rook40_F",500],
	["arifle_Katiba_F",5000],
	["30Rnd_556x45_Stanag",65],
	["20Rnd_762x51_Mag",85],
	["30Rnd_65x39_caseless_green",50],
	["DemoCharge_Remote_Mag",7500],
	["SLAMDirectionalMine_Wire_Mag",2575],
	["optic_ACO_grn",250],
	["acc_flashlight",100],
	["srifle_EBR_F",15000],
	["arifle_TRG21_F",3500],
	["optic_MRCO",5000],
	["optic_Aco",850],
	["arifle_MX_F",7500],
	["arifle_MXC_F",5000],
	["arifle_MXM_F",8500],
	["MineDetector",500],
	["optic_Holosight",275],
	["acc_pointer_IR",175],
	["arifle_TRG20_F",2500],
	["SMG_01_F",1500],
	["arifle_Mk20C_F",4500],
	["30Rnd_45ACP_Mag_SMG_01",60],
	["30Rnd_9x21_Mag",30]
];
__CONST__(life_weapon_shop_array,life_weapon_shop_array);

life_garage_prices =
[
	["C_Kart_01_Blu_F",1500], //Kart
	["C_Kart_01_Fuel_F",1500], //Kart
	["C_Kart_01_Red_F",1500], //Kart
	["C_Kart_01_Vrana_F",1500], //Kart
	["C_Rubberboat",500], //Zodiac civil
	["C_Boat_Civil_01_F",2200], //Bote civil
	["C_Offroad_01_F",1200], //Pick up
	["B_Quadbike_01_F",1500], //Quad
	["C_Hatchback_01_sport_F",3000], //Turismo rapido
	["C_Hatchback_01_F",2500], //Turismo normal
	["C_SUV_01_F",3500], //Suburban BMW
	["C_Van_01_transport_F",4000], //Furgoneta de transporte
	["I_G_Van_01_fuel_F",5000], //Furgoneta cisterna
	["C_Van_01_box_F",6000], //Furgoneta con caja
	["I_Truck_02_transport_F",12000], //Zamack
	["I_Truck_02_covered_F",15000], //Zamack con lona
	["B_Truck_01_transport_F",40000], //Hemett descubierto
	["B_Truck_01_box_F",45000], //Hemett caja
	["B_Truck_01_fuel_F",48000], //Hemett cisterna
	["O_Truck_02_transport_F",12000], //Zamack rebelde
	["O_Truck_02_covered_F",15000], //Zamack rebelde con lona
	["O_Truck_02_fuel_F",18000], //Zamack rebelde con cisterna
	["O_Truck_03_transport_F",60000], //Tempest descubierto
	["O_Truck_03_covered_F",65000], //Tempest caja
	["O_Truck_03_fuel_F",68000], //Tempest cisterna
	["O_Truck_03_device_F",75000], //Tempest con dispositivo
	["B_G_Offroad_01_F",3000], //Pick up rebelde
	["O_MRAP_02_F",65000], //Ifrit
	["O_MRAP_02_hmg_F",80000], //Ifrit artillado
	["B_G_Offroad_01_armed_F",50000], //Pick up rebelde artillado
	["B_Heli_Light_01_F",25000], //Little bird
	["O_Heli_Light_02_unarmed_F",45000], //Orca
	["I_Heli_Transport_02_F",70000], //Mohawk
	["B_MRAP_01_F",10000], //Hunter
	["B_MRAP_01_hmg_F",15000], //Hunter artillado
	["B_Heli_Transport_01_F",40000], //Ghost
	["I_Heli_light_03_unarmed_F",50000], //Hellcat
	["B_Boat_Transport_01_F",500], //Zodiac policia
	["C_Boat_Civil_01_police_F",2000], //Bote de policia
	["B_Boat_Armed_01_minigun_F",7500], //Patrullera de la policia artillada
	["B_SDV_01_F",10000], //Mini submarino
	["I_Quadbike_01_F",500], //Quad mercenarios
	["I_G_Offroad_01_F",2000], //Pick up mercenarios
	["I_G_Offroad_01_armed_F",25000], //Pick up mercenarios artillado
	["I_MRAP_03_F",35000], //Strider
	["I_MRAP_03_hmg_F",50000] //Strider artillado
];
__CONST__(life_garage_prices,life_garage_prices);

life_garage_sell =
[
	["C_Kart_01_Blu_F",12000], //Kart
	["C_Kart_01_Fuel_F",12000], //Kart
	["C_Kart_01_Red_F",12000], //Kart
	["C_Kart_01_Vrana_F",12000], //Kart
	["C_Rubberboat",3000], //Zodiac civil
	["C_Boat_Civil_01_F",18000], //Bote civil
	["C_Offroad_01_F",9000], //Pick up
	["B_Quadbike_01_F",3000], //Quad
	["C_Hatchback_01_sport_F",8000], //Turismo rapido
	["C_Hatchback_01_F",8000], //Turismo normal
	["C_SUV_01_F",10000], //Suburban BMW
	["C_Van_01_transport_F",35000], //Furgoneta de transporte
	["I_G_Van_01_fuel_F",40000], //Furgoneta cisterna
	["C_Van_01_box_F",50000], //Furgoneta con caja
	["I_Truck_02_transport_F",100000], //Zamack
	["I_Truck_02_covered_F",120000], //Zamack con lona
	["B_Truck_01_transport_F",700000], //Hemett descubierto
	["B_Truck_01_box_F",1000000], //Hemett AntiRadiacion
	["B_Truck_01_box_F",900000], //Hemett caja
	["B_Truck_01_fuel_F",700000], //Hemett cisterna
	["O_Truck_02_transport_F",120000], //Zamack rebelde
	["O_Truck_02_covered_F",180000], //Zamack rebelde con lona
	["O_Truck_02_fuel_F",200000], //Zamack rebelde con cisterna
	["O_Truck_02_medical_F",250000], //Zamack rebelde AntiRadiacion
	["O_Truck_03_transport_F",600000], //Tempest descubierto
	["O_Truck_03_covered_F",800000], //Tempest caja
	["O_Truck_03_fuel_F",900000], //Tempest AntiRadiacion
	["O_Truck_03_fuel_F",600000], //Tempest cisterna
	["O_Truck_03_device_F",1100000], //Tempest con dispositivo
	["B_G_Offroad_01_F",12000], //Pick up rebelde
	["O_MRAP_02_F",2500000], //Ifrit
	["O_MRAP_02_hmg_F",4500000], //Ifrit artillado
	["B_G_Offroad_01_armed_F",400000], //Pick up rebelde artillado
	["B_Heli_Light_01_F",100000], //Little bird
	["O_Heli_Light_02_unarmed_F",45000], //Orca
	["I_Heli_Transport_02_F",1800000], //Mohawk
	//["B_MRAP_01_F",10000], //Hunter
	//["B_MRAP_01_hmg_F",15000], //Hunter artillado
	//["B_Heli_Transport_01_F",20], //Ghost
	//["I_Heli_light_03_unarmed_F",20], //Hellcat
	//["B_Boat_Transport_01_F",20], //Zodiac policia
	//["C_Boat_Civil_01_police_F",20], //Bote de policia
	//["B_Boat_Armed_01_minigun_F",20], //Patrullera de la policia artillada
	//["B_SDV_01_F",10000], //Mini submarino
	["I_Quadbike_01_F",3000], //Quad mercenarios
	["I_G_Offroad_01_F",8000], //Pick up mercenarios
	["I_G_Offroad_01_armed_F",375000], //Pick up mercenarios artillado
	["I_MRAP_03_F",900000], //Strider
	["I_MRAP_03_hmg_F",20] //Strider artillado
];
__CONST__(life_garage_sell,life_garage_sell);