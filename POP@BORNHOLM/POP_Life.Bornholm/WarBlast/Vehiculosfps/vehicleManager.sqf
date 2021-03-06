/*
	File: vehicleManager.sqf
	Autor:
*/

if (isServer) exitWith {};

private ["_vehicleManager", "_lastPos", "_camPos"];

_vehicleManager =
{
	private ["_eventCode", "_vehicle", "_camPos"];

	_eventCode =
	{
		(_this select 0) enableSimulation true;
		(_this select 0) setVariable ["fpsFix_simulationCooloff", time + 15];
	};

	{
		_vehicle = _x;
		_camPos = positionCameraToWorld [0,0,0];

		if (!local _vehicle &&
		   {_vehicle distance _camPos > 1000} &&
		   {count crew _vehicle == 0} &&
		   {_vehicle getVariable ["fpsFix_simulationCooloff", 0] < time} &&
		   {(velocity _vehicle) call BIS_fnc_magnitude < 0.1} &&
		   {!(_vehicle isKindOf "Man")}) then
		{
			if (simulationEnabled _vehicle) then
			{
				_vehicle enableSimulation false;
			};
		}
		else
		{
			if (!simulationEnabled _vehicle) then
			{
				_vehicle enableSimulation true;
			};
		};

		if !(_vehicle getVariable ["fpsFix_eventHandlers", false]) then
		{
			_vehicle addEventHandler ["GetIn", _eventCode];
			_vehicle addEventHandler ["Dammaged", _eventCode];
			_vehicle addEventHandler ["EpeContactStart", _eventCode];
			_vehicle addEventHandler ["Killed", _eventCode];

			_vehicle setVariable ["fpsFix_eventHandlers", true];
		};

		sleep 0.01;
	} forEach entities "All";
};

_lastPos = [0,0,0];

while {true} do
{
	_camPos = positionCameraToWorld [0,0,0];

	if (_lastPos distance _camPos > 100) then
	{
		_lastPos = _camPos;
		call _vehicleManager;
	};

	sleep 5;
};