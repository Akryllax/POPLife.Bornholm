/*
	File: fn_vehicleColorStr.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Master configuration for color strings depending on their index location.
*/
private["_vehicle","_color","_index"];
_vehicle = [_this,0,"",[""]] call BIS_fnc_param;
_index = [_this,1,-1,[0]] call BIS_fnc_param;
_color = "";

switch (_vehicle) do
{
	case "C_Offroad_01_F" :
	{
		switch (_index) do
		{
			case 0: {_color = "Rojo";};
			case 1: {_color = "Amarillo";};
			case 2: {_color = "Blanco";};
			case 3: {_color = "Azul";};
			case 4: {_color = "Rojo Oscuro";};
			case 5: {_color = "Azul y Blanco"};
			case 12: {_color = "Medico"};
		};
	};
	
	case "cl3_z4_2008_black" :
	{
		switch (_index) do
		{
			case 0: {_color = "Noir";};
			case 1: {_color = "Gris Sombre";};
			case 2: {_color = "Gris";};
			case 3: {_color = "Gris Clair";};
			case 4: {_color = "Blanc";};
			case 5: {_color = "Sable";};
			case 6: {_color = "Bordeau";};
			case 7: {_color = "Bleu";};
			case 8: {_color = "Bleu Nuit";};
			case 9: {_color = "Mauve Nuit";};
			case 10: {_color = "Vert";};
			case 11: {_color = "Rouge";};
			case 12: {_color = "Jaune";};
			case 13: {_color = "Orange";};
		};
	};
	
	case "cl3_carrera_gt_black" :
	{
		switch (_index) do
		{
			case 0: {_color = "Noir";};
			case 1: {_color = "Gris Sombre";};
			case 2: {_color = "Gris";};
			case 3: {_color = "Gris Clair";};
			case 4: {_color = "Blanc";};
			case 5: {_color = "Sable";};
			case 6: {_color = "Bordeau";};
			case 7: {_color = "Bleu";};
			case 8: {_color = "Bleu Nuit";};
			case 9: {_color = "Mauve Nuit";};
			case 10: {_color = "Vert";};
			case 11: {_color = "Rouge";};
			case 12: {_color = "Jaune";};
			case 13: {_color = "Orange";};
		};
	};
	
	case "cl3_dbs_volante_black" :
	{
		switch (_index) do
		{
			case 0: {_color = "Noir";};
			case 1: {_color = "Gris Sombre";};
			case 2: {_color = "Gris";};
			case 3: {_color = "Gris Clair";};
			case 4: {_color = "Blanc";};
			case 5: {_color = "Sable";};
			case 6: {_color = "Bordeau";};
			case 7: {_color = "Bleu";};
			case 8: {_color = "Bleu Nuit";};
			case 9: {_color = "Mauve Nuit";};
			case 10: {_color = "Vert";};
			case 11: {_color = "Rouge";};
			case 12: {_color = "Jaune";};
			case 13: {_color = "Orange";};
		};
	};
	
	case "cl3_r8_spyder_black" :
	{
		switch (_index) do
		{
			case 0: {_color = "Noir";};
			case 1: {_color = "Gris Sombre";};
			case 2: {_color = "Gris";};
			case 3: {_color = "Gris Clair";};
			case 4: {_color = "Blanc";};
			case 5: {_color = "Sable";};
			case 6: {_color = "Bordeau";};
			case 7: {_color = "Bleu";};
			case 8: {_color = "Bleu Nuit";};
			case 9: {_color = "Mauve Nuit";};
			case 10: {_color = "Vert";};
			case 11: {_color = "Rouge";};
			case 12: {_color = "Jaune";};
			case 13: {_color = "Orange";};
		};
	};
	
	case "cl3_458_black" :
	{
		switch (_index) do
		{
			case 0: {_color = "Noir";};
			case 1: {_color = "Gris Sombre";};
			case 2: {_color = "Gris";};
			case 3: {_color = "Gris Clair";};
			case 4: {_color = "Blanc";};
			case 5: {_color = "Sable";};
			case 6: {_color = "Bordeau";};
			case 7: {_color = "Bleu";};
			case 8: {_color = "Bleu Nuit";};
			case 9: {_color = "Mauve Nuit";};
			case 10: {_color = "Vert";};
			case 11: {_color = "Rouge";};
			case 12: {_color = "Jaune";};
			case 13: {_color = "Orange";};
		};
	};
	
	case "cl3_murcielago_black" :
	{
		switch (_index) do
		{
			case 0: {_color = "Noir";};
			case 1: {_color = "Gris Sombre";};
			case 2: {_color = "Gris";};
			case 3: {_color = "Gris Clair";};
			case 4: {_color = "Blanc";};
			case 5: {_color = "Sable";};
			case 6: {_color = "Bordeau";};
			case 7: {_color = "Bleu";};
			case 8: {_color = "Bleu Nuit";};
			case 9: {_color = "Mauve Nuit";};
			case 10: {_color = "Vert";};
			case 11: {_color = "Rouge";};
			case 12: {_color = "Jaune";};
			case 13: {_color = "Orange";};
			case 14: {_color = "Police";};
		};
	};
	
	case "cl3_reventon_black" :
	{
		switch (_index) do
		{
			case 0: {_color = "Noir";};
			case 1: {_color = "Gris Sombre";};
			case 2: {_color = "Gris";};
			case 3: {_color = "Gris Clair";};
			case 4: {_color = "Blanc";};
			case 5: {_color = "Sable";};
			case 6: {_color = "Bordeau";};
			case 7: {_color = "Bleu";};
			case 8: {_color = "Bleu Nuit";};
			case 9: {_color = "Mauve Nuit";};
			case 10: {_color = "Vert";};
			case 11: {_color = "Rouge";};
			case 12: {_color = "Jaune";};
			case 13: {_color = "Orange";};
		};
	};
	
	case "cl3_veyron_blk_wht" :
	{
		switch (_index) do
		{
			case 0: {_color = "Noir";};
			case 1: {_color = "Gris Sombre";};
			case 2: {_color = "Gris";};
			case 3: {_color = "Gris Clair";};
			case 4: {_color = "Blanc";};
			case 5: {_color = "Sable";};
			case 6: {_color = "Bordeau";};
			case 7: {_color = "Bleu";};
			case 8: {_color = "Bleu Nuit";};
			case 9: {_color = "Mauve Nuit";};
			case 10: {_color = "Vert";};
			case 11: {_color = "Rouge";};
			case 12: {_color = "Jaune";};
			case 13: {_color = "Orange";};
		};
	};
	
	case "cl3_lamborghini_gt1_black" :
	{
		switch (_index) do
		{
			case 0: {_color = "Noir";};
			case 1: {_color = "Gris Sombre";};
			case 2: {_color = "Gris";};
			case 3: {_color = "Gris Clair";};
			case 4: {_color = "Blanc";};
			case 5: {_color = "Sable";};
			case 6: {_color = "Bordeau";};
			case 7: {_color = "Bleu";};
			case 8: {_color = "Bleu Nuit";};
			case 9: {_color = "Mauve Nuit";};
			case 10: {_color = "Vert";};
			case 11: {_color = "Rouge";};
			case 12: {_color = "Jaune";};
			case 13: {_color = "Orange";};
		};
	};
	
	case "cl3_insignia_camo" :
	{
		switch (_index) do
		{
			case 0: {_color = "Camo";};
			case 1: {_color = "Camo Urbain";};
			case 2: {_color = "Noir";};
		};
	};
	
	case "cl3_dodge_charger_s_camo" :
	{
		switch (_index) do
		{
			case 0: {_color = "Camo";};
			case 1: {_color = "Camo Urbain";};
			case 2: {_color = "Noir";};
		};
	};
	
	case "cl3_e63_amg_camo" :
	{
		switch (_index) do
		{
			case 0: {_color = "Camo";};
			case 1: {_color = "Camo Urbain";};
			case 2: {_color = "Noir";};
		};
	};
	
	case "cl3_range_rover_camo" :
	{
		switch (_index) do
		{
			case 0: {_color = "Camo";};
			case 1: {_color = "Camo Urbain";};
			case 2: {_color = "Noir";};
		};
	};
	
	

	case "C_Hatchback_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Beige";};
			case 1: {_color = "Verde";};
			case 2: {_color = "Azul";};
			case 3: {_color = "Azul Oscuro";};
			case 4: {_color = "Amarillo";};
			case 5: {_color = "Blanco"};
			case 6: {_color = "Gris"};
			case 7: {_color = "Negro"};
		};
	};

	case "C_Hatchback_01_sport_F":
	{
		switch(_index) do
		{
			case 0: {_color = "Rojo"};
			case 1: {_color = "Azul Oscuro"};
			case 2: {_color = "Naranja"};
			case 3: {_color = "Blanco y Negro"};
			case 4: {_color = "Palido"};
			case 5: {_color = "Verde"};
		};
	};

	case "C_SUV_01_F":
	{
		switch (_index) do
		{
			case 1: {_color = "Blanco y Negro"};
			case 2: {_color = "Carbono"};
			case 3: {_color = "Calavera"};
			case 4: {_color = "Jurasico"};
			case 5: {_color = "Rojo y Negro"};
			case 6: {_color = "Medico"};
		};
	};

	case "C_Van_01_box_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Blanco"};
			case 1: {_color = "Rojo"};
		};
	};

	case "C_Van_01_transport_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Blanco"};
			case 1: {_color = "Rojo"};
		};
	};

	case "C_Van_01_fuel_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Blanco"};
			case 1: {_color = "Rojo"};
		};
	};

	case "B_Quadbike_01_F" :
	{
		switch (_index) do
		{
			case 0: {_color = "Marron"};
			case 1: {_color = "Digital Desierto"};
			case 2: {_color = "Negro"};
			case 3: {_color = "Azul"};
			case 4: {_color = "Rojo"};
			case 5: {_color = "Blanco"};
		};
	};

	case "DAR_MF1Civ" :
	{
		switch (_index) do
		{
			case 0: {_color = "Rouge";};
			case 1: {_color = "Noir";};
			case 2: {_color = "Argent";};
			case 3: {_color = "Orange";};
			case 4: {_color = "Bordeau";};
			case 5: {_color = "Blanc";};
		};
	};

	case "exxpensive_bmwm3e46_base":
	{
		switch (_index) do
		{
			case 0: {_color = "Negro"};
			case 1: {_color = "Rojo"};
			case 2: {_color = "Amarillo"};
			case 3: {_color = "Naranja"};
			case 4: {_color = "verde"};
			case 5: {_color = "Gris"};
			case 6: {_color = "Azul"};
			case 7: {_color = "Blanco"};
		};
	};

	case "exxpensive_jaguar_base":
	{
		switch (_index) do
		{
			case 0: {_color = "Negro"};
			case 1: {_color = "Rojo"};
			case 2: {_color = "Amarillo"};
			case 3: {_color = "Naranja"};
			case 4: {_color = "verde"};
			case 5: {_color = "Gris"};
			case 6: {_color = "Azul"};
			case 7: {_color = "Blanco"};
		};
	};
	case "exxpensive_mercedes_sls_base":
	{
		switch (_index) do
		{
			case 0: {_color = "Negro"};
			case 1: {_color = "Rojo"};
			case 2: {_color = "Amarillo"};
			case 3: {_color = "naranja"};
			case 4: {_color = "verde"};
			case 5: {_color = "Gris"};
			case 6: {_color = "Azul"};
			case 7: {_color = "Blanco"};
		};
	};
	case "exxpensive_ferrari_458_base":
	{
		switch (_index) do
		{
			case 0: {_color = "Negro"};
			case 1: {_color = "Rojo"};
			case 2: {_color = "Amarillo"};
			case 3: {_color = "naranja"};
			case 4: {_color = "verde"};
			case 5: {_color = "Gris"};
			case 6: {_color = "Azul"};
			case 7: {_color = "Blanco"};
		};
	};
	
	case "exxpensive_aventador_base":
	{
		 switch (_index) do
		 {
			 case 0: {_color = "Negro"};
			 case 1: {_color = "Rojo"};
			 case 2: {_color = "Amarillo"};
			 case 3: {_color = "naranja"};
			 case 4: {_color = "verde"};
			 case 5: {_color = "Gris"};
			 case 6: {_color = "Azul"};
			 case 7: {_color = "Blanco"};
		 };
	};
	 
	case "exxpensive_mini_cooper_base":
	{
		 switch (_index) do
		 {
			 case 0: {_color = "Negro"};
			 case 1: {_color = "Rojo"};
			 case 2: {_color = "Amarillo"};
			 case 3: {_color = "naranja"};
			 case 4: {_color = "verde"};
			 case 5: {_color = "Gris"};
			 case 6: {_color = "Azul"};
			 case 7: {_color = "Blanco"};
		 };
	};
	 
	case "exxpensive_ford_raptor_base":
	{
		switch (_index) do
		{
			case 0: {_color = "Negro"};
			case 1: {_color = "Rojo"};
			case 2: {_color = "Amarillo"};
			case 3: {_color = "naranja"};
			case 4: {_color = "verde"};
			case 5: {_color = "Gris"};
			case 6: {_color = "Azul"};
			case 7: {_color = "Blanco"};
		};
	};
	
	case "exxpensive_volvo_242_base":
	 {
		 switch (_index) do
		 {
			 case 0: {_color = "Negro"};
			 case 1: {_color = "Rojo"};
			 case 2: {_color = "Amarillo"};
			 case 3: {_color = "naranja"};
			 case 4: {_color = "verde"};
			 case 5: {_color = "Gris"};
			 case 6: {_color = "Azul"};
			 case 7: {_color = "Blanco"};
		 };
	};
	 
	case "exxpensive_cadillac_sedan":
	{
		switch (_index) do
		{
			case 0: {_color = "Negro"};
			case 1: {_color = "Rojo"};
			case 2: {_color = "Amarillo"};
			case 3: {_color = "naranja"};
			case 4: {_color = "verde"};
			case 5: {_color = "Gris"};
			case 6: {_color = "Azul"};
			case 7: {_color = "Blanco"};
		};
	};
	
	case "exxpensive_2cv_base":
	 {
		 switch (_index) do
		 {
			 case 0: {_color = "Negro"};
			 case 1: {_color = "Rojo"};
			 case 2: {_color = "Amarillo"};
			 case 3: {_color = "naranja"};
			 case 4: {_color = "verde"};
			 case 5: {_color = "Gris"};
			 case 6: {_color = "Azul"};
			 case 7: {_color = "Blanco"};
		 };
	};
	 
	case "exxpensive_cadillac_sedan_base":
	{
		switch (_index) do
		{
			case 0: {_color = "Negro"};
			case 1: {_color = "Rojo"};
			case 2: {_color = "Amarillo"};
			case 3: {_color = "naranja"};
			case 4: {_color = "verde"};
			case 5: {_color = "Gris"};
			case 6: {_color = "Azul"};
			case 7: {_color = "Blanco"};
		};
	};
	
	case "exxpensive_chevrolet_caprice_base":
	 {
		 switch (_index) do
		 {
			 case 0: {_color = "Negro"};
			 case 1: {_color = "Rojo"};
			 case 2: {_color = "Amarillo"};
			 case 3: {_color = "naranja"};
			 case 4: {_color = "verde"};
			 case 5: {_color = "Gris"};
			 case 6: {_color = "Azul"};
			 case 7: {_color = "Blanco"};
		 };
	};
	case "exxpensive_bugatti_base": 
		 {
		 switch (_index) do
		 {
			 case 0: {_color = "Negro"};
			 case 1: {_color = "Rojo"};
			 case 2: {_color = "Amarillo"};
			 case 3: {_color = "naranja"};
			 case 4: {_color = "verde"};
			 case 5: {_color = "Gris"};
			 case 6: {_color = "Azul"};
			 case 7: {_color = "Blanco"};
		 };
	};
		
	case "exxpensive_audi_R8_base":
		 {
		 switch (_index) do
		 {
			 case 0: {_color = "Negro"};
			 case 1: {_color = "Rojo"};
			 case 2: {_color = "Amarillo"};
			 case 3: {_color = "naranja"};
			 case 4: {_color = "verde"};
			 case 5: {_color = "Gris"};
			 case 6: {_color = "Azul"};
			 case 7: {_color = "Blanco"};
		 };
	};
	case "exxpensive_m5_e34_base":
		 {
		 switch (_index) do
		 {
			 case 0: {_color = "Negro"};
			 case 1: {_color = "Rojo"};
			 case 2: {_color = "Amarillo"};
			 case 3: {_color = "naranja"};
			 case 4: {_color = "verde"};
			 case 5: {_color = "Gris"};
			 case 6: {_color = "Azul"};
			 case 7: {_color = "Blanco"};
		 };
	};
	case "exxpensive_volvo_242_base":
		 {
		 switch (_index) do
		 {
			 case 0: {_color = "Negro"};
			 case 1: {_color = "Rojo"};
			 case 2: {_color = "Amarillo"};
			 case 3: {_color = "naranja"};
			 case 4: {_color = "verde"};
			 case 5: {_color = "Gris"};
			 case 6: {_color = "Azul"};
			 case 7: {_color = "Blanco"};
		 };
	};
	
	case "B_Heli_Light_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Sheriff"};
			case 1: {_color = "Negro"};
			case 2: {_color = "Azul"};
			case 3: {_color = "Rojo"};
			case 4: {_color = "Digital Verde"};
			case 5: {_color = "Linea Azul"};
			case 6: {_color = "Eliptico"};
			case 7: {_color = "Furioso"};
			case 8: {_color = "Vaqueros"};
			case 9: {_color = "Linea Roja"};
			case 10: {_color = "Amanecer"};
			case 11: {_color = "Vrana"};
			case 12: {_color = "Olas Azules"};
			case 13: {_color = "Digital Rebelde"};
			case 14: {_color = "Medico"};
		};
	};

	case "O_Heli_Light_02_unarmed_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Negro"};
			case 1: {_color = "Blanco y Azul"};
			case 2: {_color = "Digital Verde"};
			case 3: {_color = "Digital Desierto"};
		};
	};

	case "B_MRAP_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Geo"};
			case 1: {_color = "GC"};
		};
	};

	case "I_Truck_02_covered_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Naranja"};
			case 1: {_color = "Negro"};
			case 2: {_color = "RedBull"};

		};
	};

	case "I_Truck_02_transport_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Naranja"};
			case 1: {_color = "Negro"};
		};
	};

	case "B_APC_Wheeled_01_cannon_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Negro"};
		};
	};

	case "O_Heli_Attack_02_black_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Negro"};
		};
	};

	case "I_Heli_Transport_02_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Ion"};
			case 1: {_color = "Dahoman"};
		};
	};

	case "B_APC_Wheeled_01_cannon_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Negro"};
		};
	};

	case "I_MRAP_03_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Negro"};
		};
	};

	case "I_MRAP_03_hmg_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Geo"};
		};
	};

	case "B_MRAP_01_hmg_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Geo"};
		};
	};

	case "I_Heli_light_03_unarmed_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Geo"};
		};
	};
};

_color;