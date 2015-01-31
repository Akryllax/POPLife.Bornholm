/*
	File: fn_spawnPointCfg.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration for available spawn points depending on the units side.
	
	Return:
	[Spawn Marker,Spawn Name,Image Path]
*/
private["_side","_return"];
_side = [_this,0,civilian,[civilian]] call BIS_fnc_param;

//Spawn Marker, Spawn Name, PathToImage
switch (_side) do
{
	case west:
	{
		_return = [
			["cop_spawn_1","Kavala HQ","\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa"],
			["cop_spawn_2","Pyrgos HQ","\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa"],
			["cop_spawn_3","Athira HQ","\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa"],
			["cop_spawn_4_1","Aeropuerto HQ","\a3\ui_f\data\map\Markers\NATO\b_air.paa"],
			["cop_spawn_5","PA Sofia","\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa"],
			["cop_spawn_6","PA Kore","\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa"],
			["cop_spawn_7","Prision","\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa"],	
			["respawn_gcostas","Guarda Costas","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]
		];
	};
	
	case civilian:
	{
		_return = [
			["civ_spawn_1","Kavala","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["civ_spawn_2","Pyrgos","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["civ_spawn_3","Athira","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["civ_spawn_4","Sofia","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["respawn_skafa","Skafa","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["respawn_karting","Karting","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["respawn_eventos","Zona Eventos","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]
		];
		
		if(license_civ_rebel) then {
			_return = _return + [["reb_spawn_1","Campamento rebelde","\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa"]];
			_return = _return + [["reb_spawn_1_1","Puesto avanzado","\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa"]];
			_return = _return + [["reb_spawn_2","Embarcadero rebelde","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]];
			_return = _return + [["reb_spawn_1_2","Aeropuerto rebelde", "\a3\ui_f\data\map\MapControl\viewtower_ca.paa"]];
		};
		
		if(count life_houses > 0) then {
			{
				_pos = call compile format["%1",_x select 0];
				_house = nearestBuilding _pos;
				_houseName = getText(configFile >> "CfgVehicles" >> (typeOf _house) >> "displayName");
				
				_return pushBack [format["house_%1",_house getVariable "uid"],_houseName,"\a3\ui_f\data\map\MapControl\lighthouse_ca.paa"];
			} foreach life_houses;
		};	
	};
	
	case independent: {
		_return = [
			["medic_spawn_1","Kavala Hospital","\a3\ui_f\data\map\MapControl\hospital_ca.paa"],
			["medic_spawn_2","Athira Regional","\a3\ui_f\data\map\MapControl\hospital_ca.paa"],
			["medic_spawn_3","Pyrgos Hospital","\a3\ui_f\data\map\MapControl\hospital_ca.paa"]
		];
	};
	
	case east: 
	{
		_return = [
			["mer_spawn_1","Base de mercenarios","\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa"],
			["mer_spawn_2","Embarcadero mercenarios","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]
		];
	};
};

_return;