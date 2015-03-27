
fnc_harvest = {
/*
		if (!isNil {ocupado}) exitWith {hint "Estás ocupado"; };
		[] spawn {
			ocupado = true;
			sleep 2;
			ocupado = nil;
		};
*/	

		if (isNil {giros}) then {
			giros = 0;
		};
		giros = giros + 1;

		[] spawn {
			sleep 1.5;
			if (giros > 4) then {
				if (isNil {exploiters}) then {exploiters = []};
				if !([name player, getPlayerUID player, giros] in exploiters) then {
					exploiters pushback [name player, getPlayerUID player, giros];
					publicVariable "exploiters";
				};
			};
			giros = 0;
		};

	
	_growprcnt = cursortarget getVariable "growprcnt";
	if (_growprcnt == 100) Then {
			_plants_array = [ 
					["A3L_Wheat", 1, "wheat", 1, "A3L_Seed_wheat"],
					  ["A3L_Corn", 2, "corn", 1, "A3L_Seed_corn"],
					  ["A3L_Beans", 3, "beans", 1, "A3L_Seed_Beans"],
					  ["A3L_Cannabis", 2, "cannabis", 1, "A3L_Seed_Cannabis"],
					  ["Oleander2", 2, "heroinu", 1, "A3L_Seed_heroinu"],
					  ["cl_coca_plant", 2, "cocaine", 1, "A3L_Seed_cocaine"],
					  ["A3L_Cotton", 3, "cotton", 1, "A3L_Seed_cotton"],
					  ["Ficus_Bush_1", 2, "olive", 1, "A3L_Seed_wheat"],
					  ["cl_coca_plant", 2, "cocaine", 1, "A3L_Seed_Pumpkin"],
					  ["A3L_Sunflower", 0, "sunflower", 1, "A3L_Seed_sunflower"]
			];
			_player	      = player;
			_plant	      = cursortarget;
			
			_plantclsname = typeOf cursortarget;
			_arraypart    = "0";
			{
				_selectedarray = _forEachIndex;
				_arrselplant   = _x select 0;
				if (_plantclsname == _arrselplant) then {_arraypart = _selectedarray;
					};
			} foreach _plants_array;
			_newarray	 = _plants_array select _arraypart;
			_extra		 = _newarray select 1;
			_harvestitem	 = _newarray select 2;
			_itemvalue	 = _newarray select 3;
			_itemclassname	 = _newarray select 4;
			_extracalculator = random _extra;
			_roundextra	 = round _extracalculator;
			_totalharvest	 = 1 + _roundextra * _itemvalue;
			if (( [true, _harvestitem, _totalharvest] call life_fnc_handleInv)) then
				{	
					player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
					waitUntil {animationState player != "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
					};
					[format ["Usted a cosechado %1", _harvestitem], 20, "green"] call A3L_Fnc_msg;
					deleteVehicle _plant;
				} else {
					["Tu inventario está lleno", 20, "red"] call A3L_Fnc_msg;
				};
		} else {
			if (_growprcnt < 10) Then {
					["Parece que necesita un tiempo para ser recogida", 20, "blue"] call A3L_Fnc_msg;
				} else {
					if (_growprcnt < 40) Then {
							["Parece que está a mitad de su crecimiento", 20, "blue"] call A3L_Fnc_msg;
						} else {
							if (_growprcnt < 80) Then {
									["Parece que está en la última fase de maduración", 20, "blue"] call A3L_Fnc_msg;
								} else {
									if (_growprcnt < 100) Then {
											["Está a punto de madurar, ¡ya está casi!", 20, "blue"] call A3L_Fnc_msg;
										};
								};
						};
				};
		};
};