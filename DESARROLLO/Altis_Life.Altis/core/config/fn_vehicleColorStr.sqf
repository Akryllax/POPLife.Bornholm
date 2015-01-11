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
			case 6: {_color = "Negro"};			
			case 7: {_color = "Taxi"};
			case 8: {_color = "Maria"};
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
			case 6: {_color = "Pizza"};
			case 7: {_color = "Monster"};
			case 8: {_color = "RedBull"};
			case 9: {_color = "Valkyria"};
			case 10: {_color = "Policia"};
		};
	};
	
	case "C_SUV_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Rojo Oscuro";};
			case 1: {_color = "Negro";};
			case 2: {_color = "Plateado";};
			case 3: {_color = "Naranja";};
			case 4: {_color = "Policia";};
			case 5: {_color = "Blanco y Negro"};
			case 6: {_color = "Carbono"};
			case 7: {_color = "Calavera"};
			case 8: {_color = "Jurassic"};
			case 9: {_color = "Rojo y Negro"};
			case 10: {_color = "Kitty"};
			case 11: {_color = "Taxi"};
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
			case 6: {_color = "Digital Verde"};
			case 7: {_color = "Camuflaje Hunter"};
			case 8: {_color = "Camuflaje Rebelde"};
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
			case 14: {_color = "Emergencias Blanco"};
			case 15: {_color = "Kitty"};
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
			case 4: {_color = "Emergencias Blanco"};
		};
	};
	
	case "B_MRAP_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Normal"};
			case 1: {_color = "Negro"};
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
};

_color;