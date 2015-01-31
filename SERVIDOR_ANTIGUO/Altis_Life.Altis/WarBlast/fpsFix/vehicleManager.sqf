/*
	File: vehicleManager.sqf
	Autor:
*/

if (isServer) exitWith {};

#define MOVEMENT_DISTANCE_RESCAN 100
#define DISABLE_DISTANCE_R3F (MOVEMENT_DISTANCE_RESCAN + 100)
#define DISABLE_DISTANCE_MOBILE 2000
#define DISABLE_DISTANCE_IMMOBILE 1000
#define DISABLE_DISTANCE_THING 0

scriptName "vehicleManager";

private ["_eventCode", "_vehicleManager", "_lastPos", "_R3F_attachPoint"];

_eventCode =
{
	_vehicle = _this select 0;
	if (!simulationEnabled _vehicle) then { _vehicle enableSimulation true };
	_vehicle setVariable ["fpsFix_simulationCooloff", diag_tickTime + 20];
};

_vehicleManager =
{
	private ["_vehicle", "_isAnimal", "_isMotorVehicle", "_tryEnable", "_dist"];

	{
		if!(typeOf _x in ["Box_NATO_Grenades_F","Box_IND_Grenades_F","B_supplyCrate_F","Box_NATO_Wps_F"]) then {
			if (!(_x isKindOf "CAManBase") && _x != _R3F_attachPoint) then
			{
				_vehicle = _x;
				_isAnimal = _vehicle isKindOf "Animal";
				_isThing = _vehicle isKindOf "Thing";
				_tryEnable = true;

				if (!local _vehicle &&
				   {(count crew _vehicle == 0 || _isAnimal) &&
				   (_vehicle getVariable ["fpsFix_simulationCooloff", 0] < diag_tickTime) &&
				   ((getPos _vehicle) select 2 < 1 || {_vehicle isKindOf "Static"})}) then
				{
					_dist = _vehicle distance positionCameraToWorld [0,0,0];

					if (_dist > DISABLE_DISTANCE_MOBILE || {
							vectorMagnitude velocity _vehicle < 0.1 && (
								(_dist > DISABLE_DISTANCE_R3F || !(_vehicle getVariable ["R3F_LOG_init_done", false])) && {
									(_dist > DISABLE_DISTANCE_IMMOBILE && !_isAnimal) ||
									(_dist > DISABLE_DISTANCE_THING && _isThing)
								}
							)
						}) then
					{
						_vehicle enableSimulation false;
						_tryEnable = false;
					};
				};

				if (_tryEnable && !simulationEnabled _vehicle) then
				{
					_vehicle enableSimulation true;
				};

				if !(_vehicle getVariable ["fpsFix_eventHandlers", false]) then
				{
					if (_vehicle isKindOf "AllVehicles" && !_isAnimal) then
					{
						_vehicle addEventHandler ["GetIn", _eventCode];
					};

					if (_isThing) then
					{
						_vehicle addEventHandler ["EpeContactStart", _eventCode];
					};

					_vehicle addEventHandler ["Explosion", _eventCode];
					_vehicle addEventHandler ["Killed", _eventCode];

					_vehicle setVariable ["fpsFix_eventHandlers", true];
				};
			};
		};

		sleep 0.01;
	} forEach allMissionObjects "All";
};

_lastPos = [0,0,0];
_R3F_attachPoint = objNull;

while {true} do
{
	_camPos = positionCameraToWorld [0,0,0];

	if (_lastPos distance _camPos > MOVEMENT_DISTANCE_RESCAN) then
	{
		if (isNull _R3F_attachPoint && !isNil "R3F_LOG_PUBVAR_point_attache") then
		{
			_R3F_attachPoint = R3F_LOG_PUBVAR_point_attache;
		};

		_lastPos = _camPos;
		call _vehicleManager;
	};

	sleep 5;
};
