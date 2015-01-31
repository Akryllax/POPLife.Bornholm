/*
File: fn_RepaintVehicle.sqf
Author: MooN-Gaming


Description: Does the active repaint man....read the title!
*/
private["_index","_veh","_color","_color_index"];
if(!isNull (findDisplay 2300)) then {
	_veh = nearestObject [position player, "LandVehicle"];
	_color = lbcursel 2303;
	_color_index = lbValue[2303,_color];
	closeDialog 0;


	_baseprice = 10000;
	_vehicleData = _veh getVariable["vehicle_info_owners",[]];
	_vehOwner = (_vehicleData select 0) select 0;
	if(life_cash < _basePrice) exitWith {hint "No tienes suficiente dinero."};


	if(isNil {_vehicleData}) exitWith {hint "Vehiculo pirata?"};
	if ((getPlayerUID player) != _vehOwner) exitWith {hint "Este no es tu coche."};


	life_action_inUse = true;
	_displayName = getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "displayName");
	_upp = format["Pintando %1",_displayName];
	//Setup our progress bar.
	disableSerialization;
	5 cutRsc ["life_progress","PLAIN"];
	_ui = uiNameSpace getVariable "life_progress";
	_progress = _ui displayCtrl 38201;
	_pgText = _ui displayCtrl 38202;
	_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
	_progress progressSetPosition 0.01;
	_cP = 0.01;


	while{true} do
	{
		if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
			[[player,"AinvPknlMstpSnonWnonDnon_medic_1"],"life_fnc_animSync",true,false] spawn life_fnc_MP;
			player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
		};
		sleep 1;

		_cP = _cP + 0.1;
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
		if(_cP >= 1) exitWith {};
		if(!alive player) exitWith {};
		if(player != vehicle player) exitWith {};
		if(life_interrupted) exitWith {};
	};
	player say3D "spraycan"; //Global Sound

	life_action_inUse = false;
	5 cutText ["","PLAIN"];
	player playActionNow "stop";
	if(life_interrupted) exitWith {life_interrupted = false; titleText["Cancelado.","PLAIN"]; life_action_inUse = false;};
	if(player != vehicle player) exitWith {titleText["Tienes que estar fuera del vehiculo para pintarlo.","PLAIN"];};

	life_cash = life_cash - _basePrice;
	//Send toDB
	[[_veh,_color_index],"TON_fnc_vehicleRepaint",false,false] spawn life_fnc_MP;

	//Color vehicle locally
	[_veh,_color_index] call life_fnc_colorVehicle;

	[] spawn SOCK_fnc_updateRequest; //Sync silently because it's obviously silently..


	hint format["Vehiculo: %1 || Nuevo color: %2 || Propietario: %3",_veh,_color_index,_vehicledata];




};