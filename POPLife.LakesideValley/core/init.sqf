#include <macro.h>
/*
	Master client initialization file
*/

if (!isNil "A3L_RunCode") exitwith {
	player setvariable ["lolusuck",true,true];
};

A3L_RunCode = compileFinal "
	private ""_code"";
	_code = _this select 0;
	_code = compile _code;
	[] call _code;
";

// Run Some Client Stuff
execVM"A3L_Functions\a3lint.sqf";
[] execVM "A3L_Stuff\jailsystem.sqf";
[] execVM "A3L_Stuff\bank.sqf";
[] execVM "ica\funcionesIca.sqf";


// Needs to be removed after halloween
// candy = 0;
// scarylevel = 0;

// A3L CURRENT VERSION
//A3L_ClientVersion = getNumber (configFile >> "CfgPatches" >> "A3L_Client2" >> "requiredVersion");

life_firstSpawn = true;
life_session_completed = false;
private["_handle","_timeStamp"];
0 cutText["Setting up client, please wait...","BLACK FADED"];
0 cutFadeOut 9999999;
_timeStamp = diag_tickTime;
diag_log "------------------------------------------------------------------------------------------------------";
diag_log "--------------------------------- Starting ArmA 3 Life Client Init ----------------------------------";
diag_log "------------------------------------------------------------------------------------------------------";
waitUntil {!isNull player && player == player}; //Wait till the player is ready
//Setup initial client core functions
diag_log "::Life Client:: Initialization Variables";
[] call compile PreprocessFileLineNumbers "core\configuration.sqf";
diag_log "::Life Client:: Variables initialized";
diag_log "::Life Client:: Setting up Eventhandlers";
[] call life_fnc_setupEVH;
diag_log "::Life Client:: Eventhandlers completed";
diag_log "::Life Client:: Setting up user actions";
[] call life_fnc_setupActions;
diag_log "::Life Client:: User actions completed";
diag_log "::Life Client:: Waiting for server functions to transfer..";
waitUntil {(!isNil {TON_fnc_clientGangLeader})};
diag_log "::Life Client:: Received server functions.";
diag_log "::Life Client:: Executed custom client functions";
0 cutText ["Waiting for the server to be ready...","BLACK FADED"];
0 cutFadeOut 99999999;
diag_log "::Life Client:: Waiting for the server to be ready..";
waitUntil{!isNil "life_server_isReady"};
waitUntil{(life_server_isReady OR !isNil "life_server_extDB_notLoaded")};
if(!isNil "life_server_extDB_notLoaded") exitWith {
	diag_log "::Life Client:: Server did not load extDB";
	999999 cutText ["The server-side extension extDB was not loaded into the engine, report this to the server admin.","BLACK FADED"];
	999999 cutFadeOut 99999999;
};
[] call SOCK_fnc_dataQuery;
waitUntil {life_session_completed};
0 cutText["Finishing client setup procedure","BLACK FADED"];
0 cutFadeOut 9999999;

//Illegal markers removal for cops
illegalmarkers = ["heroin_area_1","heroin_area_2","heroin_1","heroin_2","cannabis_area_1","cannabis_1","BlackFarming_Market","carReseller_1","heroin_p","Weed_p_1","radZoneMarker_1"];
if (playerSide == west) then {
{ deleteMarkerLocal _x; } forEach illegalmarkers ;
};



//diag_log "::Life Client:: Group Base Execution";
if (((WEST countSide playableUnits) + (EAST countSide playableUnits) + (CIVILIAN countSide playableUnits)) > 0) then {
	[] spawn life_fnc_escInterupt;
};

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
};

//Para la vision y carga de los jugadores
setViewDistance 1300;
setTerrainGrid 50;

//Radio y sonidos de radio ambientales
player setVariable ["BIS_noCoreConversations", true];
enableSentences false;
enableRadio false;
0 fadeRadio 0;
enableEnvironment false;


player setVariable["restrained",false,true];
player setVariable["Escorting",false,true];
player setVariable["transporting",false,true];
player setVariable["surrender",false,true]; //Set surrender to false
player setVariable["lockpicking",false,true];
//activar medical advaned system

diag_log "Past Settings Init";
[] execFSM "core\fsm\client.fsm";
diag_log "Executing client.fsm";
waitUntil {!(isNull (findDisplay 46))};
diag_log "Display 46 Found";
(findDisplay 46) displayAddEventHandler ["KeyDown", "_this call life_fnc_keyHandler"];
player addRating 99999999;
diag_log "------------------------------------------------------------------------------------------------------";
diag_log format["                End of Altis Life Client Init :: Total Execution Time %1 seconds ",(diag_tickTime) - _timeStamp];
diag_log "------------------------------------------------------------------------------------------------------";
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

[] call life_fnc_initRacing;
[] execVM "ica\initica.sqf";
//Añadir LLaves
[] execVM "acj\fn_addKey.sqf";

switch(__GETC__(life_donator)) do
{
	case 0: {Desc = 1};
	case 1: {Desc = 0.95};
	case 2: {Desc = 0.85};
	case 3: {Desc = 0.70};
	case 4: {Desc = 0.50};
	case 5: {Desc = 0.10};
};

[] execVM "core\init_survival.sqf";

//Announce system
call compile preprocessFileLineNumbers "core\functions\fn_announce.sqf";

//FPS-Fix Mejora los FPS del Servidor un 50%
diag_log "-------- Lade FPS-Fix... --------";
[] execVM "acj\fpsfix.sqf";
diag_log "-------- FPS-Fix geladen. --------";

__CONST__(life_paycheck,life_paycheck); //Make the paycheck static.

[] spawn life_fnc_asyncInit;