 this enableSimulation false;
 this allowDamage false;
 this addAction[format["%1 ($%2)",["license_med_air"] call life_fnc_varToStr,[(["mair"] call life_fnc_licensePrice)] call life_fnc_numberText],life_fnc_buyLicense,"mair",0,false,false,"",' !license_med_air && playerSide == independent '];
 this addAction["EMS Item Shop",life_fnc_weaponShopMenu,"med_basic"];

 this addAction["Vehicle Shop",life_fnc_vehicleShopMenu,["med_shop",independent,["medicos1"],"med","Kavala Hospital"]];
 this addAction["Helicopter Shop",life_fnc_vehicleShopMenu,["med_air_hs",independent,["medicos1"],"med","Kavala Hosptial"]];

 this addAction["<t color='#0000FF'>Concesionario</t>",life_fnc_vehicleShopMenu,["civ_car",civilian,["civ_car_1","civ_car_1_1"],"civ","Bruce's New & Used Auto's"]];

 this addAction["Vehicle Garage",  {
 [[getPlayerUID player,playerSide,"Car",player],"TON_fnc_getVehicles",false,false] spawn life_fnc_MP;   createDialog "Life_impound_menu";   disableSerialization;   ctrlSetText[2802,"Fetching Vehicles...."];
 life_garage_sp = "med_car_1";
 life_garage_type = "Car";
  },"",0,false,false,"",'playerSide == independent '];
 this addAction["Helicopter Garage",  {   [[getPlayerUID player,playerSide,"Air",player],"TON_fnc_getVehicles",false,false] spawn life_fnc_MP;   createDialog "Life_impound_menu";   disableSerialization;   ctrlSetText[2802,"Fetching Vehicles...."];
 life_garage_sp = "medic_spawn_1";
 life_garage_type = "Air";
   },"",0,false,false,"",'playerSide == independent '];
 this addAction["Store vehicle in Garage",life_fnc_storeVehicle,"",0,false,false,"",'!life_garage_store'];


 this enableSimulation false;
 this allowDamage false;
 this addAction["<t color='#0000FF'>Concesionario</t>",life_fnc_vehicleShopMenu,["civ_car",civilian,["civ_car_1","civ_car_1_1"],"civ","Bruce's New & Used Auto's"]];
 this setVariable["realname", "Concesionario"];
 this addAction["Vehiculos en Garaje",  {   [[getPlayerUID player,playerSide,"Car",player],"TON_fnc_getVehicles",false,false] spawn life_fnc_MP; life_garage_type = "Car";
 createDialog "Life_impound_menu";
 disableSerialization;
 ctrlSetText[2802,"buscando Vehiculos...."];
 life_garage_sp = "car_g_1";  }];
 this addAction["Guardando vehiculos",life_fnc_storeVehicle,"",0,false,false,"",'!life_garage_store'];