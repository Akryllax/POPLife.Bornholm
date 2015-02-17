enableSaving [false, false];

X_Server = false;
X_Client = false;
X_JIP = false;
StartProgress = false;

if(!isDedicated) then { X_Client = true;};
enableSaving[false,false];

life_versionInfo = "Altis Life RPG v5";
[] execVM "briefing.sqf"; //Load Briefing
[] execVM "KRON_Strings.sqf";

StartProgress = true;


if (isServer) then {
    adminChannel = radioChannelCreate [[1, 0, 0, 1], "Administracion", "%UNIT_NAME", []];
    EMSChannel   = radioChannelCreate [[1,0.4,0,1], "Emergencias", "%UNIT_NAME", []];
    publicVariable "adminChannel";
    publicVariable "EMSChannel";

};


//quitar efectos de lluvia
[] spawn {
    while{true} do {
        sleep 10;
        0 setRain 0;
        0 setOvercast 0;
        0 setFog 0;
        sleep 590;
    };
};

//cuando este terminado activamos
/*[] spawn {
	waitUntil { time > 0 };
	[] call life_fnc_initRem;
};
*/

//poner opacity 0 a markadores de helicrash!!
{_x setMarkerAlphaLocal 0} forEach ["helicrash_1","helicrash_2","helicrash_3","helicrash_4","wreck_1","wreck_2","wreck_3","wreck_4"];
//War_loop = compile (preprocessFileLineNumbers "WarBlast\Musica\War_loop.sqf");

//_igiload = execVM  "WarBlast\IgiLoad\IgiLoadInit.sqf";

