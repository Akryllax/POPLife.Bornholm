enableSaving [false, false];

X_Server = false;
X_Client = false;
X_JIP = false;
StartProgress = false;

if(!isDedicated) then { X_Client = true;};
enableSaving[false,false];

life_versionInfo = "Altis Life RPG 4.3.1";
[] execVM "briefing.sqf"; //Load Briefing
[] execVM "KRON_Strings.sqf";
[] execVM "statusBar.sqf";

//WarBlast
[] execVM "WarBlast\init.sqf";

StartProgress = true;
player enableFatigue false;

"BIS_fnc_MP_packet" addPublicVariableEventHandler {_this call life_fnc_MPexec};

/*
//For Rain and Fog Gone Below <----------- Here
while {true} do
{
	0 setOvercast 0;
	0 setRain 0;
	0 setFog 0;
};
//TON_Debug = true;
//publicVariable TON_Debug;
*/

{_x setMarkerAlphaLocal 0} forEach ["mrkRed","mrkRed_1","mrkRed_1_1","mrkRed_1_3","mrkGreen"];

MISSION_ROOT = call { private "_arr"; _arr = toArray __FILE__; _arr resize (count _arr - 8); toString _arr };

//Disabling RADIO CHATTER: Las ordenes que mandan por el grupo.
enableRadio false;

//Setting up admin variables...
[] spawn { preprocessFileLineNumbers "core\admin\fn_adminInit.sqf"};

//Iniciar reserva
//Reserve v2
if(isServer) then {
	adminChannel = radioChannelCreate [[1, 0, 0, 1], "Administracion", "%UNIT_NAME", []];
	EMSChannel	 = radioChannelCreate [[1,0.4,0,1], "Emergencias", "%UNIT_NAME", []];
	publicVariable "adminChannel";
	publicVariable "EMSChannel";
} else {

};

[] spawn { //Lets' remove the weader crap... It's local, so keep this on scheduled and for all players.
	while{true} do{
		0 setRain 0;
		0 setOvercast 0;
		0 setFog 0;
		sleep 30;
	};
};

[] spawn {
	waitUntil { time > 0 };
	[] call AKR_fn_initRem;
};

//Remove grass crap... I don't know if it's really effecty, buuuut I was told so, so here it is
setTerrainGrid 50;