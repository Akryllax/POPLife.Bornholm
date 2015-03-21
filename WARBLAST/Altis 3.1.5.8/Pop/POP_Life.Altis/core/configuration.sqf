#include <macro.h>
/*
	Master Life Configuration File
	This file is to setup variables for the client, there are still other configuration files in the system

*****************************
****** Backend Variables *****
*****************************
*/
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
life_action_gathering = false;
//Variables POP Ordenaditas ;D
life_god = false;
life_frozen = false;
life_markers = false;
life_is_alive = false;
life_civ_position = nil;
life_esposas = ObjNull;
life_llaveesposas = ObjNull;
life_my_group = ObjNull;
//robos
life_robandoGas = false;

//Persistent Saving
__CONST__(life_save_civ,TRUE); //Save weapons for civs?
__CONST__(life_save_yinv,TRUE); //Save Y-Inventory for players?

//Revive constant variables.
__CONST__(life_revive_cops,FALSE); //Set to false if you don't want cops to be able to revive downed players.
__CONST__(life_revive_fee,250); //Fee for players to pay when revived.

//House Limit
__CONST__(life_houseLimit,4); //Maximum amount of houses a player can buy (TODO: Make Tiered licenses).

//Gang related stuff?
__CONST__(life_gangPrice,75000); //Price for creating a gang (They're all persistent so keep it high to avoid 345345345 gangs).
__CONST__(life_gangUpgradeBase,10000); //MASDASDASD
__CONST__(life_gangUpgradeMultipler,2.5); //BLAH

__CONST__(life_enableFatigue,FALSE); //Enable / Disable the ARMA 3 Fatigue System

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
__CONST__(life_impound_car,9500);
__CONST__(life_impound_boat,15000);
__CONST__(life_impound_air,17500);
life_istazed = false;
life_my_gang = ObjNull;

life_vehicles = [];
bank_robber = [];
CRServicio = false;

//COPS
taserDelay = 1;

//Racing
inRace = false;

switch (playerSide) do
{
	case west:
	{
		life_atmcash = 50000; //Starting Bank Money
		life_paycheck = 1000; //Paycheck Amount
	};
	case civilian:
	{
		life_atmcash = 50000; //Starting Bank Money
		life_paycheck = 1500; //Paycheck Amount
	};

	case independent: {
		life_atmcash = 50000;
		life_paycheck = 5000;
	};

	case east:
	{
		life_atmcash = 50000; //Starting Bank Money
		life_paycheck = 5000; //Paycheck Amount
	};
};

/*
	Master Array of items?
*/
life_vShop_rentalOnly = [];
__CONST__(life_vShop_rentalOnly,life_vShop_rentalOnly); //These vehicles can never be bought and only 'rented'. Used as a balancer & money sink. If you want your server to be chaotic then fine.. Remove it..

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
	"life_inv_tuna",
	"life_inv_mullet",
	"life_inv_catshark",
	"life_inv_turtle",
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
	// Helicrash
	"life_inv_centralita",
	"life_inv_trajesoldado",
	"life_inv_chatarra",
	"life_inv_piezasmotor",
	"life_inv_municionmilitar",
	"life_inv_medallas",
	"life_inv_kevlar",
	// Naufragios
	"life_inv_pergamino",
	"life_inv_vasija",
	"life_inv_jarron",
	"life_inv_doblon",
	"life_inv_brazalete",
	"life_inv_abrecartas",
	"life_inv_catalejo",
	"life_inv_collar",
	"life_inv_cetro",
	//Esposas
	"life_inv_esposas",
	"life_inv_llaveesposas",
	//items espia
	"life_inv_gpsEspia",
	//semillas
	"life_inv_semillasMaria",
	"life_inv_semillasCoca",
	"life_inv_semillasMaiz",
	"life_inv_semillasTomate",
	//frutos
	"life_inv_tomates",
	"life_inv_maiz",
	//trabajos
	"life_inv_metilamina",
	"life_inv_meta",
	"life_inv_petroleo",
	//defensas
	"life_inv_cono",
	"life_inv_barrera",
	"life_inv_cajaMadera",
	"life_inv_palet",
	"life_inv_murallaPalets",
	"life_inv_murallaSacosGrande",
	"life_inv_murallaSacosPequena",
	"life_inv_murallaPiedras",
	"life_inv_barrilBasura",
	"life_inv_barrilArena",
	"life_inv_barrilArdiendo",
	"life_inv_pilaRuedas",
	"life_inv_defensaChasisCoche",
	"life_inv_contenedorBasura",
	//casino
	"life_inv_llave_casino",
	"life_inv_maletin_casino"

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
	["license_civ_heroin","civ"],
	["license_civ_marijuana","civ"],
	["license_civ_gang","civ"],
	["license_civ_boat","civ"],
	["license_civ_oil","civ"],
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
	["license_civ_cazarrecompensas", "civ"]
];

//Setup License Variables
{missionNamespace setVariable[(_x select 0),false];} foreach life_licenses;

life_dp_points = ["dp_1","dp_2","dp_3","dp_4","dp_5","dp_6","dp_7","dp_8","dp_9","dp_10","dp_11","dp_12","dp_13","dp_14","dp_15","dp_15","dp_16","dp_17","dp_18","dp_19","dp_20","dp_21","dp_22","dp_23","dp_24","dp_25"];
//[shortVar,reward]

life_illegal_items = [["heroinu",1200],["heroinp",2500],["cocaine",1500],
	["cocainep",3500],["marijuana",2000],["turtle",3000],["blastingcharge",10000],
	["boltcutter",500],["meta",50000],["goldbar",95000],["metilamina",35000],
	["esposas",500],["llaveesposas",500],["semillasMaria",3000],["semillasCoca",5000]];


/*
	Sell / buy arrays
*/
sell_array =
[
	["apple",50],
	["heroinu",1850],
	["heroinp",15000],
	["salema",45],
	["ornate",40],
	["mackerel",175],
	["tuna",700],
	["mullet",250],
	["catshark",300],
	["rabbit",65],
	["oilp",6500],
	["turtle",15000],
	["water",50],
	["coffee",50],
	["turtlesoup",20000],
	["donuts",60],
	["marijuana",12000],
	["tbacon",250],
	["lockpick",150],
	["pickaxe",750],
	["redgull",200],
	["peach",55],
	["cocaine",11000],
	["cocainep",19000],
	["diamond",750],
	["diamondc",6500],
	["iron_r",6500],
	["copper_r",6500],
	["salt_r",6500],
	["glass",6500],
	["fuelF",500],
	["spikeStrip",1200],
	["cement",6500],
	["goldbar",95000],
	// Helicrash
	["centralita",5000],
	["trajesoldado",5000],
	["chatarra",5000],
	["piezasmotor",5000],
	["municionmilitar",5000],
	["medallas",5000],
	["kevlar",5000],
	// Naufragios
	["pergamino",5000],
	["vasija",5000],
	["jarron",5000],
	["doblon",5000],
	["brazalete",5000],
	["abrecartas",5000],
	["catalejo",5000],
	["collar",5000],
	["cetro",5000],
    ["semillasMaria",2500],
	["semillasCoca",50000],
	["semillasMaiz",1000],
	["semillasTomate",500],
	["tomates",500],
	["maiz",1000],
	//trabajos
	["meta",50000],
	["petroleo",5000]
];
__CONST__(sell_array,sell_array);


buy_array =
[
	["apple",65],
	["rabbit",75],
	["salema",55],
	["ornate",50],
	["mackerel",200],
	["tuna",900],
	["mullet",300],
	["catshark",350],
	["water",10],
	["turtle",4000],
	["turtlesoup",2500],
	["donuts",120],
	["coffee",10],
	["tbacon",75],
	["lockpick",150],
	["pickaxe",1200],
	["redgull",1500],
	["fuelF",850],
	["peach",68],
	["spikeStrip",2500],
	["blastingcharge",35000],
	["boltcutter",7500],
	["defusekit",2500],
	["storagesmall",75000],
	["storagebig",150000],
	["esposas",500],
	["llaveesposas",700],

	["jerinHipotermia", 15000],
	["jerinCostipado", 30000],
	["jerinEbola", 45000],
	["jerinCeguera", 10000],
	["jerinTranquilizante", 5000],
	["medicCalor", 10000],
	["medicAntibiotico", 25000],
	["medicAnticuerpos", 50000],

	["semillasMaria",2500],
	["semillasCoca",50000],
	["semillasMaiz",1000],
	["semillasTomate",500],
	["tomates",1000],
	["maiz",1500],

	//trabajos
	["meta",50000],
	["petroleo",5000],
	//casino
	["maletin_casino",1500000]
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
	["B_QuadBike_01_F",550],
	["C_Hatchback_01_F",1500],
	["C_Offroad_01_F", 2500],
	["B_G_Offroad_01_F",3500],
	["C_SUV_01_F",5250],
	["C_Van_01_transport_F",7890],
	["C_Hatchback_01_sport_F",2350],
	["C_Van_01_fuel_F",4500],
	["I_Heli_Transport_02_F",100000],
	["C_Van_01_box_F",9000],
	["I_Truck_02_transport_F",12000],
	["I_Truck_02_covered_F",14500],
	["B_Truck_01_transport_F",25650],
	["B_Truck_01_box_F", 35000],
	["O_MRAP_02_F",45000],
	["B_Heli_Light_01_F",75000],
	["O_Heli_Light_02_unarmed_F",65000],
	["C_Rubberboat",400],
	["C_Boat_Civil_01_F",4500],
	["B_Boat_Transport_01_F",450],
	["C_Boat_Civil_01_police_F",3500],
	["B_Boat_Armed_01_minigun_F",16500],
	["B_SDV_01_F",25000],
	["B_MRAP_01_F",7500],
	["O_MRAP_02_hmg_F",250000],
	["C_Heli_Light_01_civil_F",90000]
];
__CONST__(life_garage_prices,life_garage_prices);

life_garage_sell =
[
	["B_Quadbike_01_F",950],
	["C_Hatchback_01_F",4500],
	["C_Offroad_01_F", 6500],
	["B_G_Offroad_01_F",3500],
	["C_SUV_01_F",15000],
	["C_Van_01_transport_F",25000],
	["C_Hatchback_01_sport_F",7500],
	["C_Van_01_fuel_F",3850],
	["I_Heli_Transport_02_F",125000],
	["C_Van_01_box_F",35000],
	["I_Truck_02_transport_F",49800],
	["I_Truck_02_covered_F",62000],
	["B_Truck_01_transport_F",135000],
	["B_Truck_01_box_F", 150000],
	["O_MRAP_02_F",65000],
	["B_Heli_Light_01_F",57000],
	["O_Heli_Light_02_unarmed_F",72500],
	["C_Rubberboat",950],
	["C_Boat_Civil_01_F",6800],
	["B_Boat_Transport_01_F",850],
	["C_Boat_Civil_01_police_F",4950],
	["B_Boat_Armed_01_minigun_F",21000],
	["B_SDV_01_F",45000],
	["O_MRAP_02_hmg_F",250000],
	["B_MRAP_01_F",10000],
	["C_Kart_01_Blu_F",15000],
	["C_Kart_01_Fuel_F",15000],
	["C_Kart_01_Red_F",15000],
	["C_Kart_01_Vrana_F",15000 ],
	["ambulancia_f",1000],
	["dezkit_b206_ems",5000],
	["DAR_ChargerCiv",15000],
	["DAR_TahoeCiv",9999],
	["DAR_TahoeCivBlack",9999],
	["DAR_TahoeCivBlue",9999],
	["DAR_TahoeCivRed",9999],
	["DAR_TahoeCivSilver",99999],
	["DAR_FusionCivBlack",70000],
	["DAR_FusionCivBlue",70000],
	["DAR_FusionCivRed",7000],
	["DAR_FusionCiv",7000],
	["DAR_TaurusCivBlack",8500],
	["DAR_TaurusCivBlue",8500],
	["DAR_TaurusCiv",8500],
	["DAR_ImpalaCivA",6000],
	["DAR_ImpalaCivC",6000],
	["DAR_ImpalaCivB",6000],
	["DAR_ImpalaCivD",6000],
	["DAR_ImpalaCiv",6000],
	["DAR_ImpalaCivG",9000],
	["DAR_ImpalaCivF",9000],
	["DAR_ImpalaCivE",9000],
	["cl3_civic_vti_black",6700],
	["cl3_polo_gti_black",7000],
	["cl3_insignia_black",7000],
	["cl3_range_rover_black",7000],
	["Orel_Monster",107000],
	["cl3_e63_amg_black",117000],
	["cl3_dodge_charger_s_black",20700],
	["cl3_z4_2008_black",70000],
	["cl3_carrera_gt_black",221700],
	["cl3_dbs_volante_black",370000],
	["cl3_r8_spyder_black",207000],
	["cl3_murcielago_black",20700],
	["cl3_reventon_black",417000],
	["O_Truck_03_covered_F",100000],
	["O_MRAP_02_F",290000],
	["BAF_Jackal2_GMG_W",290000],
	["BAF_Jackal2_GMG_D",290000],
	["BAF_Offroad_W",29000],
	["BAF_Offroad_D",29000],
	["B_Heli_Light_01_F",45000],
	["O_MRAP_02_hmg_F",690000],
	["B_G_Offroad_01_armed_F",120000],
	["TDR_Explorer_GC",3000],
	["TDR_Tahoe_K",5000],
	["TDR_BlindadoGEO",5000],
	["TDR_Explorer_K",5000],
	["TDR_Taurus_CNP_ST",3000],
	["Orel_Dingo",60000],
	["B_Heli_Light_01_F",40000],
	["dezkit_b206x_unarmed",40000],
	["dezkit_b206_news",40000],
	["dezkit_b206_ls",40000],
	["dezkit_b206x_unarmed",40000],
	["C_Heli_Light_01_civil_F", 55000],
	["O_Heli_Light_02_unarmed_F",125000],
	["I_Heli_Transport_02_F",245000],
	["O_Heli_Transport_04_F",255000],
	["O_Heli_Transport_04_bench_F", 260000],
	["O_Heli_Transport_04_covered_F", 270000],
	["B_Heli_Transport_03_F", 280000],
	["B_Heli_Attack_01_F", 525000],
	["O_Heli_Attack_02_F", 545000],
	["ec135_policia_f", 5000],
	["ffaa_et_rg31_samson",250000],
	["ffaa_et_vamtac_ume",3900],
	["ffaa_et_anibal",3900],
	["DAR_MK23",29000],
	["DAR_LHS_16",29000],
	["DAR_4X4",29000],
	["DAR_MK27T",29000],
	["DAR_MK23",29000]

];
__CONST__(life_garage_sell,life_garage_sell);