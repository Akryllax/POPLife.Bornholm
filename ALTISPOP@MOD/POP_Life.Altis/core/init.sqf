#include <macro.h>
/*
	Master client initialization file
*/
life_firstSpawn = true;
life_session_completed = false;
private["_handle","_timeStamp"];
0 cutText["Setting up client, please wait...","BLACK FADED"];
0 cutFadeOut 9999999;
_timeStamp = diag_tickTime;

waitUntil {!isNull player && player == player}; //Wait till the player is ready

[] call compile PreprocessFileLineNumbers "core\configuration.sqf";

[] call life_fnc_setupEVH;

[] call life_fnc_setupActions;

waitUntil {(!isNil {TON_fnc_clientGangLeader})};

0 cutText ["Waiting for the server to be ready...","BLACK FADED"];
0 cutFadeOut 99999999;

waitUntil{!isNil "life_server_isReady"};
waitUntil{(life_server_isReady OR !isNil "life_server_extDB_notLoaded")};
if(!isNil "life_server_extDB_notLoaded") exitWith {

	999999 cutText ["The server-side extension extDB was not loaded into the engine, report this to the server admin.","BLACK FADED"];
	999999 cutFadeOut 99999999;
};
[] call SOCK_fnc_dataQuery;
waitUntil {life_session_completed};
0 cutText["Finishing client setup procedure","BLACK FADED"];
0 cutFadeOut 9999999;


[] spawn life_fnc_escInterupt;

[[getPlayerUID player,player getVariable["realname",name player]],"life_fnc_wantedProfUpdate",false,false] spawn life_fnc_MP;

switch (playerSide) do
{
	case west:
	{
		_handle = [] spawn life_fnc_initCop;
		waitUntil {scriptDone _handle};
	};

	case civilian:
	{
		//Initialize Civilian Settings
		_handle = [] spawn life_fnc_initCiv;
		waitUntil {scriptDone _handle};
	};

	case independent:
	{
		//Initialize Medics and blah
		_handle = [] spawn life_fnc_initMedic;
		waitUntil {scriptDone _handle};
	};

	case east:
	{
		//Initialize Mercenaries and blah
		_handle = [] spawn life_fnc_initMerc;
		waitUntil {scriptDone _handle};
	};
};

//Para la vision y carga de los jugadores
setViewDistance 1300;
setTerrainGrid 50;

player setVariable ["BIS_noCoreConversations", true];
enableSentences false;
enableRadio false;
0 fadeRadio 0;
//enableEnvironment false;

player setVariable["restrained",false,true];
player setVariable["Escorting",false,true];
player setVariable["transporting",false,true];

[] execFSM "core\fsm\client.fsm";

waitUntil {!(isNull (findDisplay 46))};

(findDisplay 46) displayAddEventHandler ["KeyDown", "_this call life_fnc_keyHandler"];
player addRating 99999999;

life_sidechat = true;
[[player,life_sidechat,playerSide],"TON_fnc_managesc",false,false] spawn life_fnc_MP;
0 cutText ["","BLACK IN"];
[] call life_fnc_hudSetup;
LIFE_ID_PlayerTags = ["LIFE_PlayerTags","onEachFrame","life_fnc_playerTags"] call BIS_fnc_addStackedEventHandler;
LIFE_ID_RevealObjects = ["LIFE_RevealObjects","onEachFrame","life_fnc_revealObjects"] call BIS_fnc_addStackedEventHandler;
[] call life_fnc_settingsInit;
player setVariable["steam64ID",getPlayerUID player];
player setVariable["realname",profileName,true];
life_fnc_moveIn = compileFinal
"
	player moveInCargo (_this select 0);
";

life_fnc_garageRefund = compileFinal
"
	_price = _this select 0;
	_unit = _this select 1;
	if(_unit != player) exitWith {};
	life_atmcash = life_atmcash + _price;
";

[] execVM "core\init_survival.sqf";

[] execVM "WarBlast\zlt_fastrope.sqf";
[] execVM "WarBlast\Luces\fn_luces.sqf";
[] execVM "WarBlast\Luces\fn_luces2.sqf";
[] execVM "WarBlast\Policias\lacrimogeno.sqf";
[] execVM "WarBlast\fn_statusBar.sqf";
// [] execVM "WarBlast\real_weather.sqf";
// [] execVM "WarBlast\randomWeather2.sqf";

//[] execVM "WarBlast\fn_tasas.sqf";
[] call life_fnc_initRacing;
//[] execVM "WarBlast\module_cleanup\init.sqf";
//[] execVM "WarBlast\module_monitor\init.sqf";


switch(__GETC__(life_donator)) do
{
	case 0: {Desc = 1};
	case 1: {Desc = 0.95};
	case 2: {Desc = 0.85};
	case 3: {Desc = 0.70};
	case 4: {Desc = 0.50};
	case 5: {Desc = 0.10};
};

__CONST__(life_paycheck,life_paycheck); //Make the paycheck static.
player enableFatigue (__GETC__(life_enableFatigue));
[] call War_fnc_texturas;