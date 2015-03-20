/* 
	File: spawnPoints.hpp
	
	Author: Ciaran Langton
	Date: 2015-02-08 14:41:17
	Last Modified by: Ciaran Langton
	Last Modified time: 2015-03-07 13:45:34

	LAYOUT:
	{"DisplayName","MarkerName","Logo","Conditional Statement"}
*/
class spawnPoints
{
	class Altis
	{
		WEST[] = {
			{"Kavala Station","cop_spawn_1","\a3\ui_f\data\map\MapControl\watertower_ca.paa","true"},
			
			{"Athira Station","cop_spawn_3","\a3\ui_f\data\map\MapControl\watertower_ca.paa","true"},
			
			{"NPAS HQ","cop_spawn_4","\a3\ui_f\data\map\Markers\NATO\b_air.paa","true"},
			
			{"Highway Patrol","cop_spawn_5","\a3\ui_f\data\map\MapControl\watertower_ca.paa","true"},
			
			{"MPU Police","cop_spawn_mpu","\a3\ui_f\data\map\MapControl\watertower_ca.paa","true"},

			{"Training Area","cop_training_spawn","\a3\ui_f\data\map\MapControl\watertower_ca.paa","true"}
		};

		GUER[] = {
			{"Kavala NHS","medic_spawn_1","\a3\ui_f\data\map\MapControl\hospital_ca.paa","true"},
			{"Athira NHS","medic_spawn_2","\a3\ui_f\data\map\MapControl\hospital_ca.paa","true"}
		};

		CIV[] = {
			{"Kavala","civ_spawn_1","\a3\ui_f\data\map\MapControl\watertower_ca.paa","true"},
			{"Athira","civ_spawn_3","\a3\ui_f\data\map\MapControl\watertower_ca.paa","true"},

			{"VIP Club","vip_spawn","\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa","(call life_samaritan > 0)"},
			{"UNMC Spawn","rebelspawn","\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa","(call life_fnc_isRebel)"},

			{"Taxi HQ","taxi_spawn","\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa","(license_civ_taxi)"},
			{"ARAC HQ","arac_spawn","\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa","(license_civ_arac)"},
			{"Gang Spawn","life_gang_spawnpoint","\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa","(!(call life_fnc_isRebel) && life_gang_spawnpoint != 'nocustom')","life_gang_spawnpoint"}
		};
	};

	class Stratis
	{
		WEST[] = {
			{"Agia Marina","cop_spawn_1","\a3\ui_f\data\map\MapControl\watertower_ca.paa","true"}
		};

		GUER[] = {
			{"Stratis NHS","medic_spawn_1","\a3\ui_f\data\map\MapControl\hospital_ca.paa","true"}
		};

		CIV[] = {
			{"Agia Marina","civ_spawn_1","\a3\ui_f\data\map\MapControl\watertower_ca.paa","true"},
			{"Athira","civ_spawn_3","\a3\ui_f\data\map\MapControl\watertower_ca.paa","true"},
			{"VIP Club","vip_spawn","\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa","(call life_samaritan > 0 || (call life_wilcorank > 0))"},
			{"ARAC HQ","arac_spawn","\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa","(license_civ_arac || (call life_wilcorank > 0))"},
			{"Taxi HQ","taxi_spawn","\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa","(license_civ_taxi || (call life_wilcorank > 0))"}
		};
	};
};