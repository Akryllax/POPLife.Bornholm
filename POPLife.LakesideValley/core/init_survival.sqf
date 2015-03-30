[] spawn  {
	private["_fnc_food","_fnc_water"];
	_fnc_food = {
		if ((profileNamespace getVariable "hearb") < 2) then {player setDamage 1; hint "Has muerto de hambre.";}
		else {
			profileNamespace setVariable ["hearb",(profileNamespace getVariable "hearb") - 10];
			[] call life_fnc_hudUpdate;
			
			if ((profileNamespace getVariable "hearb") < 2) then {
				player setDamage 1; hint "Has muerto de hambre.";
			};
			if ((profileNamespace getVariable "hearb") == 10) then  {
				player setFatigue 1;
			};
		};
	};

	_fnc_water = {
		if ((profileNamespace getVariable "fois") < 2) then {hint "Has muerto por deshidratación."}
		else {
			profileNamespace setVariable ["fois",(profileNamespace getVariable "fois") - 10];
			[] call life_fnc_hudUpdate;
			
			if((profileNamespace getVariable "fois") < 2) then {
				player setDamage 1; hint "Has muerto de sed.";
			};
			if ((profileNamespace getVariable "fois") == 10) then  {
				hint "Estás muriéndote de sed, vas a morir muy pronto si no bebes algo";
				player setFatigue 1;
			};
		};
	};

	while{true} do {
		sleep 600;
		[] call _fnc_water;
		sleep 250;
		[] call _fnc_food;
	};
};

[] spawn
{
	private["_bp","_load","_cfg"];
	while {true} do	{
		waitUntil {backpack player != ""};
		_bp = backpack player;
		_cfg = getNumber(configFile >> "CfgVehicles" >> (backpack player) >> "maximumload");
		_load = round(_cfg / 8);
		life_maxWeight = life_maxWeightT + _load;
		if ((playerSide == west || playerSide == independent || playerSide == civilian)) then {(unitBackpack player) setObjectTextureGlobal [0,""];};
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
		sleep 1.5;
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
					life_thirst = life_thirst - 5;
					life_hunger = life_hunger - 5;
					[] call life_fnc_hudUpdate;
				};
			};
			_myLastPos = (getPos player select 0) + (getPos player select 1);
		};
	};
};

[] spawn {
    while {true} do
    {
        enableSentences false;
        sleep 20;
    };
};

/*
[] spawn
{
	while {true} do
	{
		private["_damage"];
		sleep 1;

// RAD ZONE (URANIUM)
		while {((player distance (getMarkerPos "Rad_Zone") < 135) && (player getVariable["Revive",TRUE]))} do
		{
			if(uniform player == "U_C_Scientist" || uniform player == "U_I_HeliPilotCoveralls") then
			{
				titleText ["!!! Usted esta en una zona radiactiva !!!.","PLAIN"];
				player say3D "RadSound";
				sleep 6;
			}else
			{
				titleText ["!!! ADVERTENCIA ESTAS EN UN ZONA RADIACTIVA !!! Usted probabilidades de morir si no esta protegido","PLAIN"];
				player say3D "RadSound";
				_damage = damage player;
				_damage = _damage + 0.1;
				player setDamage (_damage);
				[] call life_fnc_hudUpdate;
				sleep 6;
			};
		};

// URANIUM TRANSPORT
		while {( life_inv_uraniumu > 0 || life_inv_uraniump > 0 )} do
		{
			if(uniform player == "U_C_Scientist" || uniform player == "U_I_HeliPilotCoveralls" || uniform player == "U_B_PilotCoveralls") then
			{
				titleText ["!!! Tu transportes des matieres radioactives !!! Mais ta combinaison te protege.","PLAIN"];
				sleep 10;
			}else
			{
				titleText ["!!! ATENCION MATERIALES RADIACTIVOS TRANSPORTADOS  !!! Usted probabilidades de morir si no esta protegido","PLAIN"];
				_damage = damage player;
				_damage = _damage + 0.1;
				player setDamage (_damage);
				[] call life_fnc_hudUpdate;
				sleep 3;
			};
		};

// RAD ZONE (NUKE-SUCCESS)
		while {((player distance (getMarkerPos "nuke_central") < 135) && (player getVariable["Revive",TRUE]) && (nuke_box getVariable["nukeExplo",true]))} do
		{
			if(uniform player == "U_C_Scientist" || uniform player == "U_I_HeliPilotCoveralls" || uniform player == "U_B_PilotCoveralls") then
			{
			titleText ["!!! La central ha explotado recientemente, usted esta en una zona radiactiva !!!.","PLAIN"];
				player say3D "RadSound";
				sleep 6;
			}else
			{
				titleText ["/!\ATENCION: LA CENTRAL EXPLOTO RECIENTEMENTE ESTA EN UNA ZONA RADIACTIVA !!!/!\","PLAIN"];
				player say3D "RadSound";
				_damage = damage player;
				_damage = _damage + 0.1;
				player setDamage (_damage);
				[] call life_fnc_hudUpdate;
				sleep 6;
			};
		};
};
*/