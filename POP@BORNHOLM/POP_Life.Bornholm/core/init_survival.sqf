[] spawn  {
	private["_fnc_food","_fnc_water"];
	_fnc_food =
	{
		if((profileNamespace getVariable "hambre") < 2) then {player setDamage 1; hint localize "STR_NOTF_EatMSG_Death";}
		else
		{
		profileNamespace setVariable ["hambre",(profileNamespace getVariable "hambre") - 10];
		[] call life_fnc_hudUpdate;
		if((profileNamespace getVariable "hambre") < 2) then {player setDamage 1; hint localize "STR_NOTF_EatMSG_Death";};
		switch(profileNamespace getVariable "hambre") do {
			case 30: {hint localize "STR_NOTF_EatMSG_1";};
			case 20: {hint localize "STR_NOTF_EatMSG_2";};
			case 10: {hint localize "STR_NOTF_EatMSG_3";player setFatigue 1;};
			};
		};
	};

	_fnc_water =
	{
		if((profileNamespace getVariable "sed") < 2) then {player setDamage 1; hint localize "STR_NOTF_DrinkMSG_Death";}
		else
		{
			profileNamespace setVariable ["sed",(profileNamespace getVariable "sed") - 10];
			[] call life_fnc_hudUpdate;
			if((profileNamespace getVariable "sed") < 2) then {player setDamage 1; hint localize "STR_NOTF_DrinkMSG_Death";};
			switch(profileNamespace getVariable "sed") do
			{
				case 30: {hint localize "STR_NOTF_DrinkMSG_1";};
				case 20: {hint localize "STR_NOTF_DrinkMSG_2"; player setFatigue 1;};
				case 10: {hint localize "STR_NOTF_DrinkMSG_3"; player setFatigue 1;};
			};
		};
	};

	while{true} do
	{
		sleep 600;
		[] call _fnc_water;
		sleep 250;
		[] call _fnc_food;
	};
};

[] spawn
{
	private["_bp","_load","_cfg"];
	while{true} do
	{
		waitUntil {backpack player != ""};
		_bp = backpack player;
		_cfg = getNumber(configFile >> "CfgVehicles" >> (backpack player) >> "maximumload");
		_load = round(_cfg / 8);
		life_maxWeight = life_maxWeightT + _load;
		if ((playerSide == west || playerSide == independent || playerSide == east)) then {(unitBackpack player) setObjectTextureGlobal [0,""];};
		waitUntil {backpack player != _bp};
		if(backpack player == "") then
		{
			life_maxWeight = life_maxWeightT;
		};
	};
};

[] spawn
{
	while {true} do
	{
		sleep 1.8;
		if(life_carryWeight > life_maxWeight && !isForcedWalk player) then {
			player forceWalk true;
			player setFatigue 1;
			hint localize "STR_NOTF_MaxWeight";
		} else {
			if(isForcedWalk player) then {
				player forceWalk false;
			};
		};
	};
};

[] spawn
{
	if !(playerSide == civilian) exitWith {};
	private["_pos","_posVieja","_posNueva"];
	while {true} do
	{
	sleep 1.3;
	_posVieja = profileNamespace getVariable "posicion";
	_posNueva = getPosATL player;
	_pos = [_posVieja,_posNueva] call BIS_fnc_areEqual;
	if !(_pos) then {
		profileNamespace setVariable ["posicion",_posNueva];
	};
  };
};
[] spawn
{
	private["_walkDis","_myLastPos","_MaxWalk","_runHunger","_runDehydrate"];
	_walkDis = 0;
	_myLastPos = (getPos player select 0) + (getPos player select 1);
	_MaxWalk = 1200;
	while{true} do
	{
		sleep 0.5;
		if(!alive player) then {_walkDis = 0;}
		else
		{
			_CurPos = (getPos player select 0) + (getPos player select 1);
			if((_CurPos != _myLastPos) && (vehicle player == player)) then
			{
				_walkDis = _walkDis + 1;
				if(_walkDis == _MaxWalk) then
				{
					_walkDis = 0;
				    profileNamespace setVariable ["hambre",(profileNamespace getVariable "hambre") - 5];
					profileNamespace setVariable ["sed",(profileNamespace getVariable "sed") - 5];
					[] call life_fnc_hudUpdate;
				};
			};
			_myLastPos = (getPos player select 0) + (getPos player select 1);
		};
	};
};
