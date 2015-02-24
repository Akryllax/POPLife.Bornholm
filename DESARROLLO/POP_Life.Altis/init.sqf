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

while {fog > 0} do {
	0 setfog 0;
} else {
	sleep 360;
};
StartProgress = true;