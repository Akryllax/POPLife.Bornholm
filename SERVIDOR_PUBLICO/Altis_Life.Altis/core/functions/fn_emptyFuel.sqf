/*
      Created by Acidcorp TeamBrK.net - All right reserved !
      Date: 08.08.2014
      Related Forum Post: http://www.altisliferpg.com/topic/4812-tutorial-how-to-increase-the-fuel-usage/
      Thanks you Mokomoko
*/

private["_vehicleToFuel","_fuelLast","_fuelEnMoins","_pourcentFuelEnMoins"];

sleep 2;

_pourcentFuelEnMoins = 100;

while{true} do
{
    _vehicleToFuel = (vehicle player);

    if(isEngineOn _vehicleToFuel && ((driver _vehicleToFuel) == player) && (_vehicleToFuel != player) ) then
    {

		_fuelLast = fuel vehicle player;

		//waitUntil {!alive _vehicleToFuel || (fuel _vehicleToFuel) != _fuelLast};

		sleep 1;

		_vehicleToFuel = (vehicle player);

		switch (typeOf (_vehicleToFuel)) do {
			case "C_Offroad_01_F":				{ _pourcentFuelEnMoins = 1000; }; //Pick up
			case "B_Quadbike_01_F":				{ _pourcentFuelEnMoins = 1500; }; //Quad
			case "C_Hatchback_01_sport_F":		{ _pourcentFuelEnMoins = 1200; }; //Turismo rapido
			case "C_Hatchback_01_F":			{ _pourcentFuelEnMoins = 800; }; //Turismo normal
			case "C_SUV_01_F":					{ _pourcentFuelEnMoins = 1500; }; //Suburban BMW
			case "C_Van_01_transport_F":		{ _pourcentFuelEnMoins = 800; }; //Furgoneta de transporte
			case "I_G_Van_01_fuel_F":			{ _pourcentFuelEnMoins = 800; }; //Furgoneta cisterna
			case "C_Van_01_box_F":				{ _pourcentFuelEnMoins = 800; }; //Furgoneta con caja
			case "I_Truck_02_transport_F":		{ _pourcentFuelEnMoins = 800; }; //Zamack
			case "I_Truck_02_covered_F":		{ _pourcentFuelEnMoins = 800; }; //Zamack con lona
			case "B_Truck_01_transport_F":		{ _pourcentFuelEnMoins = 800; }; //Hemett descubierto
			case "B_Truck_01_box_F":			{ _pourcentFuelEnMoins = 800; }; //Hemett AntiRadiacion
			case "B_Truck_01_box_F":			{ _pourcentFuelEnMoins = 800; }; //Hemett caja
			case "B_Truck_01_fuel_F":			{ _pourcentFuelEnMoins = 800; }; //Hemett cisterna
			case "O_Truck_02_transport_F":		{ _pourcentFuelEnMoins = 800; }; //Zamack rebelde
			case "O_Truck_02_covered_F":		{ _pourcentFuelEnMoins = 800; }; //Zamack rebelde con lona
			case "O_Truck_02_fuel_F":			{ _pourcentFuelEnMoins = 800; }; //Zamack rebelde con cisterna
			case "O_Truck_02_medical_F":		{ _pourcentFuelEnMoins = 800; }; //Zamack rebelde AntiRadiacion
			case "O_Truck_03_transport_F":		{ _pourcentFuelEnMoins = 800; }; //Tempest descubierto
			case "O_Truck_03_covered_F":		{ _pourcentFuelEnMoins = 800; }; //Tempest caja
			case "O_Truck_03_fuel_F":			{ _pourcentFuelEnMoins = 800; }; //Tempest AntiRadiacion
			case "O_Truck_03_fuel_F":			{ _pourcentFuelEnMoins = 800; }; //Tempest cisterna
			case "O_Truck_03_device_F":			{ _pourcentFuelEnMoins = 800; }; //Tempest con dispositivo
			case "B_G_Offroad_01_F":			{ _pourcentFuelEnMoins = 1000; };//Pick up rebelde
			case "O_MRAP_02_F":					{ _pourcentFuelEnMoins = 800; }; //Ifrit
			case "O_MRAP_02_hmg_F":				{ _pourcentFuelEnMoins = 800; }; //Ifrit artillado
			case "B_G_Offroad_01_armed_F":		{ _pourcentFuelEnMoins = 1000; }; //Pick up rebelde artillado
			case "B_Heli_Light_01_F":			{ _pourcentFuelEnMoins = 80; }; //Little bird
			case "O_Heli_Light_02_unarmed_F":	{ _pourcentFuelEnMoins = 500; }; //Orca
			case "I_Heli_Transport_02_F":		{ _pourcentFuelEnMoins = 500; }; //Mohawk
			case "B_MRAP_01_F":					{ _pourcentFuelEnMoins = 800; }; //Hunter
			case "B_MRAP_01_hmg_F":				{ _pourcentFuelEnMoins = 800; }; //Hunter artillado
			case "B_Heli_Transport_01_F":		{ _pourcentFuelEnMoins = 800; }; //Ghost
			case "I_Heli_light_03_unarmed_F":	{ _pourcentFuelEnMoins = 800; }; //Hellcat
			case "I_Quadbike_01_F":				{ _pourcentFuelEnMoins = 1500; }; //Quad mercenarios
			case "I_G_Offroad_01_F":			{ _pourcentFuelEnMoins = 1000; }; //Pick up mercenarios
			case "I_G_Offroad_01_armed_F":		{ _pourcentFuelEnMoins = 1000; }; //Pick up mercenarios artillado
			case "I_MRAP_03_F":					{ _pourcentFuelEnMoins = 800; }; //Strider
			case "I_MRAP_03_hmg_F":				{ _pourcentFuelEnMoins = 800; }; //Strider artillado
			default { _pourcentFuelEnMoins = 100; };
		};

		_fuelEnMoins = ((_pourcentFuelEnMoins/100)*(_fuelLast - (fuel _vehicleToFuel)));

		//hint parseText format["%1, %2 au lieu de %3 %4 %5",(fuel _vehicleToFuel),_fuelEnMoins,(_fuelLast - (fuel _vehicleToFuel)),_pourcentFuelEnMoins,_fuelLast];

		_vehicleToFuel setFuel ((fuel _vehicleToFuel) - _fuelEnMoins);

        if(fuel _vehicleToFuel < 0.3 && fuel _vehicleToFuel > 0.28) then
        {
            hint "Se te acaba la gasolina!. Mejor que busques una gasolinera cerca!";
        }
        else
        {
            if(fuel _vehicleToFuel < 0.03) then
            {
                hint "Te vas a quedar tirado...";
            };
        };
    } else {
		sleep 5;
	};
};