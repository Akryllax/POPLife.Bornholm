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
			case 0: {_color = "Medico";};
			case 1: {_color = "Amarillo";};
			case 2: {_color = "Blanco";};
			case 3: {_color = "Azul";};
			case 4: {_color = "Rojo";};
			case 5: {_color = "Azul y blanco"};
			case 6: {_color = "Oscuro"};
			case 7: {_color = "Policia Municipal"};
			case 8: {_color = "Amarillo"};
			case 9: {_color = "Policia Nacional"};
			case 10: {_color = "Guardia Civil"};
			case 11: {_color = "GEO"};
			case 12: {_color = "American Offroad"};
		};
	};
	
	case "C_Hatchback_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Beige";};
			case 1: {_color = "Green";};
			case 2: {_color = "Blue";};
			case 3: {_color = "Dark Blue";};
			case 4: {_color = "Yellow";};
			case 5: {_color = "White"};
			case 6: {_color = "Grey"};
			case 7: {_color = "Black"};
		};
	};
	
	case "C_Hatchback_01_sport_F":
	{
		switch(_index) do
		{
			case 0: {_color = "Rojo"};
			case 1: {_color = "Azul oscuro"};
			case 2: {_color = "Naranja"};
			case 3: {_color = "Blanco y negro"};
			case 4: {_color = "Tan"};
			case 5: {_color = "Verde"};
			case 6: {_color = "Policia Municipal"};
			case 7: {_color = "Policia Nacional"};
			case 8: {_color = "Guardia Civil"};
			case 9: {_color = "Competicion 1"};
			case 10: {_color = "Camuflaje"};
			case 11: {_color = "Competicion 2"};
			case 12: {_color = "Redbull"};
			case 13: {_color = "Rockstar"};
			case 14: {_color = "Lancia Martini"};
			case 15: {_color = "Mercedes"};
			case 16: {_color = "Monster"};
			case 17: {_color = "Peugeot"};
			
		};
	};
	
	case "C_SUV_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Rojo";};
			case 1: {_color = "Negro";};
			case 2: {_color = "Plata";};
			case 3: {_color = "Naranja";};
			case 4: {_color = "Policia Nacional";};
			case 5: {_color = "Guardia Civil";};
			case 6: {_color = "Medico";};
			case 7: {_color = "ShuPremoh";};
			case 8: {_color = "Ferrari";};
			case 9: {_color = "Ghostrider";};
		};
	};
	
	case "C_Van_01_box_F":
	{
		switch (_index) do
		{
			case 0: {_color = "White"};
			case 1: {_color = "Red"};
		};
	};
	
	case "C_Van_01_transport_F":
	{
		switch (_index) do
		{
			case 0: {_color = "White"};
			case 1: {_color = "Red"};
		};
	};
	
	case "I_G_Van_01_fuel_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Blanco"};
			case 1: {_color = "Rebelde"};
		};
	};
	case "C_Van_01_fuel_F":
	{
		switch (_index) do
		{
			case 0: {_color = "White"};
			case 1: {_color = "Red"};
		};
	};
	
	case "B_Quadbike_01_F" :
	{
		switch (_index) do
		{
			case 0: {_color = "Brown"};
			case 1: {_color = "Digi Desert"};
			case 2: {_color = "Black"};
			case 3: {_color = "Blue"};
			case 4: {_color = "Red"};
			case 5: {_color = "White"};
			case 6: {_color = "Digi Green"};
			case 7: {_color = "Hunter Camo"};
			case 8: {_color = "Rebel Camo"};
		};
	};
	
	case "B_Heli_Light_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Policia Nacional"};
			case 1: {_color = "Civil azul"};
			case 2: {_color = "Civil rojo"};
			case 3: {_color = "Sombra"};
			case 4: {_color = "Negro y rojo"};
			case 5: {_color = "Tiburon negro"};
			case 6: {_color = "Civil azul"};
			case 7: {_color = "Civil rojo"};
			case 8: {_color = "Sombra"};
			case 9: {_color = "Negro y rojo"};
			case 10: {_color = "Tiburon negro"};
			case 11: {_color = "Rebelde Digital"};
			case 12: {_color = "Verde"};
			case 13: {_color = "Negro"};
			case 14: {_color = "Mercenario"};
			case 15: {_color = "Guardia Civil"};
		};
	};
	
	case "O_Heli_Light_02_unarmed_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Black"};
			case 1: {_color = "White / Blue"};
			case 2: {_color = "Mercenario"};
			case 3: {_color = "Desert Digi"};
			case 4: {_color = "Paramedic"};
		};
	};
	
	case "I_Heli_Transport_02_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Blanco"};
			case 1: {_color = "Rebelde"};
		};
	};
	
	case "I_Heli_light_03_unarmed_F":
	{
		switch (_index) do
		{
			case 0: {_color = "GEO"};
			case 1: {_color = "Mercenario"};
			case 2: {_color = "Rescate" };
		};
	};
	
		
	case "B_MRAP_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "GEO"};
			case 1: {_color = "Guardia Civil"};
		};
	};
	
	case "B_MRAP_01_hmg_F":
	{
		switch (_index) do
		{
			case 0: {_color = "GEO"};
			case 1: {_color = "Guardia Civil"};
		};
	};
	
	case "I_MRAP_03_hmg_F":
	{
		switch (_index) do
		{
			case 0: {_color = "GEO"};
		};
	};
		
	case "I_Truck_02_covered_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Naranja"};
			case 1: {_color = "Negro"};
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
	case "O_Truck_02_covered_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Rebelde"};
		};
	};
	
	case "O_Truck_02_transport_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Rebelde"};
		};
	};

	case "B_APC_Wheeled_01_cannon_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Black"};
		};
	};
	
	case "O_Heli_Attack_02_black_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Black"};
		};
	};
	
	case "I_Heli_Transport_02_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Ion"};
			case 1: {_color = "Digital verde"};
		};
	};
	
	case "B_APC_Wheeled_01_cannon_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Black"};
		};
	};
};

_color;