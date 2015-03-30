/*
	File: fn_useItem.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Main function for item effects and functionality through the player menu.
*/
private["_item"];
disableSerialization;
if((lbCurSel 2005) == -1) exitWith {hint localize "STR_ISTR_SelectItemFirst";};
_item = lbData[2005,(lbCurSel 2005)];

_hambre = (profileNamespace getVariable "hearb");
_sed = (profileNamespace getVariable "fois");

switch (true) do
{
	case (_item == "water" or _item == "coffee"):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			profileNamespace setVariable ["fois", _sed + 30];
			player setFatigue 0;
			//Animacion de beber
		[] execVM "acj\animaciones\beber.sqf";

		};
	};

	case (_item == "coffee"):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			profileNamespace setVariable ["fois", _sed + 30];
			player setFatigue 0;
			if(life_intox <= 0.02) then
			{
			life_intox = 0.00;
			}
			else
			{
			life_intox = life_intox - 0.02;
			//Animacion de beber
			[] execVM "acj\animaciones\beber.sqf";
			};
		};
	};

	case (_item == "zoobeer"):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			titleText["Usted ha consumido una cerveza","PLAIN"];
			life_intox = life_intox + 0.02;
		};
	};

	case (_item == "raxsrum"):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			titleText["Usted ha consumido ron","PLAIN"];
			life_intox = life_intox + 0.06;
		};
	};
	case (_item == "boltcutter"): {
		[cursorTarget] spawn life_fnc_boltcutter;
		closeDialog 0;
	};

	case (_item == "blastingcharge"): {
		player reveal fed_bank;
		(group player) reveal fed_bank;
		[cursorTarget] spawn life_fnc_blastingCharge;
	};
	case (_item == "menottes"):
	{
		// Civs => Civs
		if(playerSide == civilian && !isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && alive cursorTarget && cursorTarget getVariable ["surrender", true] && cursorTarget distance player < 3.5 && isPlayer cursorTarget && !(cursorTarget getVariable "Escorting") && !(cursorTarget getVariable "restrained") && speed cursorTarget < 1) then
		{
			[] call life_fnc_restrainActionCiv;
			[false,"menottes",1] call life_fnc_handleInv;
		};
	};
	case (_item == "Cigarette"):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[[0,format["%1 sparks up a Cigarette.",name player]],"life_fnc_broadcast",(position player) nearEntities [["Man"], 50],false] spawn life_fnc_MP;
			life_intox = life_intox + 0.10;
			[] spawn life_fnc_useCigarette;
			player setFatigue 1;
		};
	};
	case (_item == "marijuana"):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[[0,format["%1 sparks up a joint.",name player]],"life_fnc_broadcast",(position player) nearEntities [["Man"], 50],false] spawn life_fnc_MP;
			life_intox = life_intox + 0.10;
			[] spawn life_fnc_useMarijuana;
			player setFatigue 1;
		};
	};

	case (_item == "cocainep"):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[] spawn
			{
				life_cocaine_effect = time;
				titleText["Estas tan puesto en cocaina ahora puede correr durante 2 minutos","PLAIN"];
				player enableFatigue false;
				life_intox = life_intox + 0.10;
				[] spawn life_fnc_useCocaine;
				waitUntil {!alive player OR ((time - life_cocaine_effect) > (2 * 60))};
				player enableFatigue true;
			};
		};
	};

	case (_item == "popcono"):
	{
		if(!isNull life_popcono) exitWith {hint "Ya has colocado el Cono"};
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[] spawn life_fnc_popcono;
		};
	};

	case (_item == "popconosinluz"):
	{
		if(!isNull life_popconosinluz) exitWith {hint "Ya has colocado el Cono"};
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[] spawn life_fnc_popconosinluz;
		};
	};

	case (_item == "popbarrera"):
	{
		if(!isNull life_popbarrera) exitWith {hint "Ya has colocado la barrera"};
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[] spawn life_fnc_popbarrera;
		};
	};

	case (_item == "popbarreragrande"):
	{
		if(!isNull life_popbarreragrande) exitWith {hint "Ya has colocado la barrera grande"};
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[] spawn life_fnc_popbarreragrande;
		};
	};

	case (_item == "poparrowdeskleft"):
	{
		if(!isNull life_poparrowdeskleft) exitWith {hint "Ya has colocado las flechas"};
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[] spawn life_fnc_poparrowdeskleft;
		};
	};

	case (_item == "poparrowdeskright"):
	{
		if(!isNull life_poparrowdeskright) exitWith {hint "Ya has colocado las flechas"};
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[] spawn life_fnc_poparrowdeskright;
		};
	};


	case (_item == "heroinp"):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[[0,format["%1 se a inyectado un poco de heroina.",name player]],"life_fnc_broadcast",(position player) nearEntities [["Man"], 50],false] spawn life_fnc_MP;
			life_intox = life_intox + 0.10;
			[] spawn life_fnc_useHeroin;
		};
	};

	case (_item == "defusekit"): {
		[cursorTarget] spawn life_fnc_defuseKit;
	};

	case (_item == "barrierCop"):
	{
		if(!isNull life_spikestrip) exitWith {hint "Usted ya tiene una barrera desplegada !"};
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[] spawn life_fnc_barrierCop;
		};
	};

	case (_item in ["storagesmall","storagebig"]): {
		[_item] call life_fnc_storageBox;
	};

	case (_item == "redgull"):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			profileNamespace setVariable ["fois", _sed + 30];
			player setFatigue 0;
			//Animacion de Beber
			[] execVM "acj\animaciones\beber.sqf";

			[] spawn
			{
				life_redgull_effect = time;
				titleText[localize "STR_ISTR_RedGullEffect","PLAIN"];
				player enableFatigue false;
				waitUntil {!alive player OR ((time - life_redgull_effect) > (3 * 60))};
				player enableFatigue true;
			};
		};
	};

	case (_item == "spikeStrip"):
	{
		if(!isNull life_spikestrip) exitWith {hint localize "STR_ISTR_SpikesDeployment"};
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[] spawn life_fnc_spikeStrip;
		};
	};

	case (_item == "fuelF"):
	{
		if(vehicle player != player) exitWith {hint localize "STR_ISTR_RefuelInVehicle"};
		[] spawn life_fnc_jerryRefuel;
	};

	case (_item == "lockpick"):
	{
		[] spawn life_fnc_lockpick;
	};

	case (_item == "multipass"):
	{
		[] spawn life_fnc_multipass;
	};

	case (_item in ["apple","rabbit","salema","ornate","mackerel","tuna","mullet","catshark","turtle","turtlesoup","donuts","tbacon","peach"]):
	{
		[_item] call life_fnc_eatFood;
		//Animacion de Comer
		[] execVM "acj\animaciones\comer.sqf";
	};

	case (_item == "pickaxe"):
	{
		[] spawn life_fnc_pickAxeUse;
	};

	default
	{
		hint localize "STR_ISTR_NotUsable";
	};
	//Nuestro
	// Pocion Parkour
	case (_item == "pocionparkour"):
	{
		if(!isNull life_semilla) exitWith {hint "Teas Tomado una Pocion!"};
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[] call hab_pocionDeParkour;
		};
	};
	// Colte
	case (_item == "coctelmolotov"):
	{
		if(!isNull life_semilla) exitWith {hint "Teas Tomado una Pocion!"};
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[] call hab_molotov;
		};
	};
	//Pastilla Exp
	case (_item == "pastilladeexperiencia"):
	{
		if(!isNull life_semilla) exitWith {hint "Teas Tomado una Pocion!"};
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[] call hab_pastillasExp;
		};
	};
};

[] call life_fnc_p_updateMenu;
[] call life_fnc_hudUpdate;