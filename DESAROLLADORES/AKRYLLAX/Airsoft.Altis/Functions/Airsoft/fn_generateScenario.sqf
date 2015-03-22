/*
	File: fn_generateScenario.sqf
	Author: Akryllax
	Desc: Generates de scenario (serverside).
*/

private["_width", "_height","_altura","_density","_mrkrOrigin","_playerDir"];

_this spawn {

	_square = "Land_VR_Block_04_F";
	
	_width = [_this, 0, -1,[-1]] call BIS_fnc_param;
	_height = [_this, 1, -1,[-1]] call BIS_fnc_param;
	_altura = [_this, 2, -1,[-1]] call BIS_fnc_param;
	_density = [_this, 3, -1,[-1]] call BIS_fnc_param;
	_mrkrOrigin = [_this, 4, "not",[""]] call BIS_fnc_param;
	
	if(_width < 0 || _height < 0 || _altura < 0 || _density < 0 || _mrkrOrigin isEqualTo "not") exitWith {
		hint format["width: %1\nheight: %2\naltura: %3\ndensity: %4\nmrkrOrigin: %5", _width, _height, _altura, _density, _mrkrOrigin];
	}; //Bad entry.
	_playerDir = markerDir _mrkrOrigin;
	_vector = (getMarkerPos _mrkrOrigin);
	_separation = 10.4;

	_scenaryArray = [
			"Land_VR_Block_01_F",
			"Land_VR_Block_02_F",
			"Land_VR_Block_03_F",
			"Land_VR_Block_04_F",
			"Land_VR_Block_05_F",
			"Land_VR_CoverObject_01_kneel_F",
			"Land_VR_CoverObject_01_kneelLow_F",
			"Land_VR_CoverObject_01_kneelHigh_F",
			"Land_VR_CoverObject_01_stand_F",
			"#lightpoint",
			"C_Soldier_VR_F"
	];

	{
		if(typeOf _x in _scenaryArray) then{
			deleteVehicle _x;
		};
	} forEach (player nearObjects 1500);
	
	for "_i" from 1 to _width do{
		[_square, _width, _height, _altura,_separation,_playerDir,_vector, _i] spawn {
			_square = _this select 0;
			_width = _this select 1;
			_height = _this select 2;
			_altura = _this select 3;
			_separation = _this select 4;
			_playerDir = _this select 5;
			_vector = _this select 6;
			_i = _this select 7;
		
			for "_j" from 1 to _height do{
				_temp = (_vector vectorAdd[_i * _separation,_j * _separation,0]);
				_obj = createVehicle [_square, _temp, [], 0, "CAN_COLLIDE"];
				_obj allowDamage false;
				_obj enableSimulation false;
			};
		};
	};
	
	for "_i" from 1 to _width do{
		[_square, _width, _height, _altura,_separation,_playerDir,_vector, _i] call {
		
			_square = _this select 0;
			_width = _this select 1;
			_height = _this select 2;
			_altura = _this select 3;
			_separation = _this select 4;
			_playerDir = _this select 5;
			_vector = _this select 6;
			_i = _this select 7;
		
			for "_j" from 1 to _height do{
				_temp = (_vector vectorAdd[_i * _separation,_j * _separation,_altura]);
				_obj = createVehicle [_square, _temp, [], 0, "CAN_COLLIDE"];
				_obj allowDamage false;
				_obj enableSimulation false;
			};
		};
	};
	
	_esquinas = [
		_vector vectorAdd[0,0,0],
		_vector vectorAdd[_width * _separation+_separation,_height * _separation+_separation,0]
	];
	
	for "_i" from 1 to _width do{
		[_square, _width, _height, _altura,_separation,_playerDir,_esquinas select 0, _i] spawn {
			_square = _this select 0;
			_width = _this select 1;
			_height = _this select 2;
			_altura = _this select 3;
			_separation = _this select 4;
			_playerDir = _this select 5;
			_vector = _this select 6;
			_i = _this select 7;
		
			_tempAlt = floor (_altura / _separation);
			for "_j" from 1 to _tempAlt do{
				_temp = (_vector vectorAdd[_i * _separation,0,_j * _separation - 2]);
				_obj = createVehicle [_square, _temp, [], 0, "CAN_COLLIDE"];
				_obj allowDamage false;
				_obj enableSimulation false;
			};
		};
	};
	
	for "_i" from 1 to _width do{
		[_square, _width, _height, _altura,_separation,_playerDir,_esquinas select 0, _i] spawn {
		
			_square = _this select 0;
			_width = _this select 1;
			_height = _this select 2;
			_altura = _this select 3;
			_separation = _this select 4;
			_playerDir = _this select 5;
			_vector = _this select 6;
			_i = _this select 7;
		
			_tempAlt = floor (_altura / _separation);
			for "_j" from 1 to _tempAlt do{
				_temp = (_vector vectorAdd[0,_i * _separation,_j * _separation - 2]);
				_obj = createVehicle [_square, _temp, [], 0, "CAN_COLLIDE"];
				_obj allowDamage false;
				_obj enableSimulation false;
			};
		};
	};
	
	for "_i" from 1 to _width do{
		[_square, _width, _height, _altura,_separation,_playerDir,_esquinas select 1, _i] spawn {
			_square = _this select 0;
			_width = _this select 1;
			_height = _this select 2;
			_altura = _this select 3;
			_separation = _this select 4;
			_playerDir = _this select 5;
			_vector = _this select 6;
			_i = _this select 7;
		
			_tempAlt = floor (_altura / _separation);
			for "_j" from 1 to _tempAlt do{
				_temp = (_vector vectorAdd[-_i * _separation,0,_j * _separation - 2]);
				_obj = createVehicle [_square, _temp, [], 0, "CAN_COLLIDE"];
				_obj allowDamage false;
				_obj enableSimulation false;
			};
		};
	};
	
	for "_i" from 1 to _width do{
		[_square, _width, _height, _altura,_separation,_playerDir,_esquinas select 1, _i] spawn {
		
			_square = _this select 0;
			_width = _this select 1;
			_height = _this select 2;
			_altura = _this select 3;
			_separation = _this select 4;
			_playerDir = _this select 5;
			_vector = _this select 6;
			_i = _this select 7;
		
			_tempAlt = floor (_altura / _separation);
			for "_j" from 1 to _tempAlt do{
				_temp = (_vector vectorAdd[0,-_i * _separation,_j * _separation - 2]);
				_obj = createVehicle [_square, _temp, [], 0, "CAN_COLLIDE"];
				_obj allowDamage false;
				_obj enableSimulation false;
			};
		};
	};
	
	deleteMarker "airsoft_spawn_red";
	_mrk = createMarker["airsoft_spawn_red", (_vector vectorAdd[(_width * _separation)/2,_separation,11])];
	_mrk setMarkerPos ((getMarkerPos _mrk) vectorAdd[0,0,9.5]);
	_mrk setMarkerType "mil_dot";
	_mrk setMarkerColor "ColorRed";
	_mrk setMarkerText "Spawn ROJOS";
	
	deleteMarker "airsoft_spawn_blue";
	_mrk = createMarker["airsoft_spawn_blue", (_vector vectorAdd[(_width * _separation)/2,(_height * _separation),11])];
	_mrk setMarkerPos ((getMarkerPos _mrk) vectorAdd[0,0,9.5]);
	_mrk setMarkerType "mil_dot";
	_mrk setMarkerColor "ColorBlue";
	_mrk setMarkerText "Spawn AZUL";
	
	_scenary = [
		"Land_VR_Block_01_F",
		"Land_VR_Block_02_F",
		"Land_VR_Block_03_F",
		"Land_VR_Block_04_F",
		"Land_VR_Block_05_F",
		"Land_VR_CoverObject_01_kneel_F",
		"Land_VR_CoverObject_01_kneelLow_F",
		"Land_VR_CoverObject_01_kneelHigh_F",
		"Land_VR_CoverObject_01_stand_F"
	];
	
	_random = (_density);
	
	for "_k" from 1 to _random do{
		_tmp = _scenary select floor random count _scenary;
		_vec = [floor (random (_width * _separation)), floor (random (_height * _separation)), 9];
		_obj = createVehicle [_tmp, _vector vectorAdd _vec, [], 0, "CAN_COLLIDE"];
	};
	
	_lightPos = _vector vectorAdd[(_width * _separation) / 2, (_height * _separation) / 2, (_altura * (2/3))];
	vrLight = "#lightpoint" createVehicleLocal _lightPos; vrLight setLightBrightness 5.0; vrLight setLightAmbient [0.7, 0.7, 1.0]; vrLight setLightColor [0.7, 0.7, 1.0];
	
	_lightPos = (getMarkerPos "airsoft_spawn_red") vectorAdd[0,0,20];
	vrRed = "#lightpoint" createVehicleLocal _lightPos; vrRed setLightBrightness 1.0; vrRed setLightAmbient [1, 0, 0]; vrRed setLightColor [1, 0, 0];
	
	_lightPos = (getMarkerPos "airsoft_spawn_blue") vectorAdd[0,0,20];
	vrBlue = "#lightpoint" createVehicleLocal _lightPos; vrBlue setLightBrightness 1.0; vrBlue setLightAmbient [0, 0, 1]; vrBlue setLightColor [0, 0, 1];;
};