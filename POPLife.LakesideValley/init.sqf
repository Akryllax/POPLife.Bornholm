
// Server SetVariables
if (isServer) then {
	bank setvariable ["robbed",false,true];
	stash1 setvariable ["robbed",false,true];
	stash2 setvariable ["robbed",false,true];
	stash3 setvariable ["robbed",false,true];
	stash4 setvariable ["robbed",false,true];
};

if (isServer) then {
	[] execVM "ica\initServer.sqf";
};

[] execVM "Anticheat.sqf";
[] execVM "AdminMenu.sqf";

enableSaving [false, false];

X_Server = false;
X_Client = false;
X_JIP = false;
StartProgress = false;

if(!isDedicated) then { X_Client = true;};


MAC_fnc_switchMove = {
    private["_object","_anim"];
    _object = _this select 0;
    _anim = _this select 1;

    _object switchMove _anim;

};

[] spawn {
   while{true} do {
        sleep 10;
        0 setRain 0;
        0 setOvercast 0;
        0 setFog 0;
        sleep 590;
    };
};

//enableSaving[false,false];

life_versionInfo = "Arma3Life";

profilenamespace setvariable ['GUI_BCG_RGB_R',1.0];
profilenamespace setvariable ['GUI_BCG_RGB_G',0.65];
profilenamespace setvariable ['GUI_BCG_RGB_B',0.0];
profilenamespace setvariable ['GUI_BCG_RGB_A',1.0];

[] execVM "KRON_Strings.sqf";

if(isServer) then  {
	[
		3*60, // seconds to delete dead bodies (0 means don't delete)
		2*45, // seconds to delete dead vehicles (0 means don't delete)
		0, // seconds to delete immobile vehicles (0 means don't delete)
		1*45, // seconds to delete dropped weapons (0 means don't delete)
		10*60, // seconds to deleted planted explosives (0 means don't delete)
		0 // seconds to delete dropped smokes/chemlights (0 means don't delete)
	] execVM "core\repetitive_cleanup.sqf";
};

// TFR Variables API
tf_no_auto_long_range_radio = true; 
tf_west_radio_code = "";
tf_east_radio_code = tf_west_radio_code;
tf_guer_radio_code = tf_west_radio_code;
tf_civ_radio_code = tf_west_radio_code;

StartProgress = true;