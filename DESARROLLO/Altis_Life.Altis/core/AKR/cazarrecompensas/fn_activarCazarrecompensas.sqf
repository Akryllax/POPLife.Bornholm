CRServicio = true;
player setVariable["CRServicio", true,true];

removeVest player;
removeHeadgear player;
removeBackpack player;
player removeWeapon (primaryWeapon player);
player removeWeapon (handgunWeapon player);

player addWeapon "SMG_02_ACO_F";
player addWeapon "hgun_P07_snds_F";
[] spawn {
	waitUntil { primaryWeapon player isEqualTo "SMG_02_ACO_F"  && handgunWeapon player isEqualTo "hgun_P07_snds_F"};
	player addMagazine "30Rnd_9x21_Mag";
	player addMagazine "30Rnd_9x21_Mag";
	player addMagazine "30Rnd_9x21_Mag";
	player addMagazine "30Rnd_9x21_Mag";


	reload player;
};
//Inventario virtual
[true,"esposas",5] call life_fnc_handleInv;
[true,"llaveesposas",5] call life_fnc_handleInv;

player forceAddUniform "U_B_CombatUniform_mcam";
player setObjectTextureGlobal [0, "textures\cazarrecompensas.jpg"];

[] spawn {
	sleep 5;
	while {CRServicio && alive player} do {
		if(uniform player != "U_B_CombatUniform_mcam") then {
			player forceAddUniform "U_B_CombatUniform_mcam";
		};
		player setObjectTextureGlobal [0, "textures\cazarrecompensas.jpg"];

		sleep 10;
	};
};
taserDelay = 1;
primaryDelay = 0.3;

life_tiroAtiro = {

	_CRallowedPWeapon = "SMG_02_";
	_CRallowedHWeapon = "hgun_P07_";

	if((_this select 1) isEqualTo "hgun_P07_snds_F") then {
		[] spawn {
			player setAmmo ["hgun_P07_snds_F", 0];
			sleep taserDelay;

			player setAmmo ["hgun_P07_snds_F", 1];
		};
	};

	if((_this select 1) find _CRallowedPWeapon != -1) then {
		_this spawn {
			player setAmmo [(_this select 1), 0];
			sleep primaryDelay;

			player setAmmo [(_this select 1), 1];
		};
	};
};

CREHFired = player addEventHandler ["Fired", "_this call life_tiroAtiro"];
CREHOpenI = player addEventHandler["InventoryOpened", "closeDialog 0; true"];
CREHDropI = player addEventHandler ["InventoryClosed", { deleteVehicle (_this select 1); }];

[] spawn {

	_CRallowedPWeapon = "SMG_02_";
	_CRallowedHWeapon = "hgun_P07_";

	_primaryCondition = {
		(primaryWeapon player != "" && ((primaryWeapon player) find _CRallowedPWeapon == -1))
	};

	_handgunCondition = {
		(handgunWeapon player != "" && ((handgunWeapon player) find _CRallowedHWeapon == -1))
	};

	while {CRServicio && alive player} do {
		sleep 1;
		waitUntil { !CRServicio || !(alive player) || (count (vest player) > 0) || [] call _primaryCondition || [] call _handgunCondition};

		_temp = "<t size =""1.2"" color=""#FF0000""> Estas de servicio</t><br/>No puedes ";

		if((count (vest player) > 0)) then {
			_temp = _temp + "usar chaleco.";
			removeVest player;
		};

		if([] call _primaryCondition) then {
			_temp = _temp + "usar otro arma que no sea un Sting.";
			player removeWeapon (primaryWeapon player);
		};

		if([] call _handgunCondition) then {
			_temp = _temp + "usar otra arma secundaria que no sea un taser.";
			player removeWeapon (primaryWeapon player);
		};

		if(!alive player) then{
			CRServicio = false;
			player setVariable["CRServicio", false,true];
		};

		if(CRServicio)then {
			hint parseText _temp;
		};

		removeVest player;
		removeHeadgear player;
		removeBackpack player;
	};

	removeVest player;
	removeHeadgear player;
	removeBackpack player;
	player removeWeapon (primaryWeapon player);
	player removeWeapon (handgunWeapon player);

	player removeEventHandler ["Fired", CREHFired];
	player removeEventHandler ["InventoryOpened", CREHOpenI];
	player removeEventHandler ["InventoryClosed", CREHDropI];

	player forceAddUniform "U_B_CombatUniform_mcam";
};

_paraf = parseText "<t size=""1.5"" color=""#FF0000"" align=""center"">Cuerpo Voluntario de Seguridad</t><br/><t size=""1"">Bienvenido al C.V.S. de Alits. Gracias por velar por la seguridad de sus conciudadanos. Aun asi, le recordamos que usted sigue siendo civil, y tendra que seguir la normative vigente como tal, salvo las excepciones debido a este cargo.</t>";

("SUMARIO") hintC [
	_paraf,
	"Estas obligado a mantener el uniforme mientras estes de servicio.",
	"El uso de armas de fuego letal esta restringido EXCLUSIVAMENTE a la proteccion del portador.",
	(parseText "Para mas informacion, dirigase a la <t color=""#000099""><a href=""http://plataoplomo.wtf"">pagina web</a></t>.")
];

[] spawn {
	sleep 3;

	0=[[["ALTIS","<t align = 'center' size = '1.5' font='PuristaBold'>%1</t><br/>"],["","<br/>"],["Cuerpo Voluntario de Seguridad","<t align = 'center' size = '0.8' color = '#aaaaaa'>%1</t>"]]] spawn BIS_fnc_typeText;
};