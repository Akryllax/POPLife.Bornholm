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
[] spawn {
   while{true} do {
        sleep 10;
        0 setRain 0;
        0 setOvercast 0;
        0 setFog 0;
        sleep 590;
    };
};
/*if(isServer) then  {
	[
		5*60, // seconds to delete dead bodies (0 means don't delete)
		2*45, // seconds to delete dead vehicles (0 means don't delete)
		0, // seconds to delete immobile vehicles (0 means don't delete)
		1*45, // seconds to delete dropped weapons (0 means don't delete)
		10*60, // seconds to deleted planted explosives (0 means don't delete)
		0 // seconds to delete dropped smokes/chemlights (0 means don't delete)
] execVM "WarBlast\repetitive_cleanup.sqf";
};
*/
{_x setMarkerAlphaLocal 0} forEach ["helicrash_1","helicrash_2","helicrash_3","helicrash_4","wreck_1","wreck_2","wreck_3","wreck_4"];

StartProgress = true;
