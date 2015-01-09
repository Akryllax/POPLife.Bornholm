enableSaving [false, false];

X_Server = false;
X_Client = false;
X_JIP = false;
StartProgress = false;

if(!isDedicated) then { X_Client = true;};
enableSaving[false,false];

life_versionInfo = "Altis Life RPG v3.1.4.8";
[] execVM "briefing.sqf"; //Load Briefing
[] execVM "KRON_Strings.sqf";
//mejorar fps
[] execVM "WarBlast\init.sqf";

StartProgress = true;

//quitar efectos de lluvia ninja code by quik
[] spawn {

	    0 setOvercast 0;
		0 setRain 0;
		0 setFog 0;

		_timeCTiempo = nextWeatherChange;

		sleep _timeCTiempo;


};

//Remove grass crap...
setTerrainGrid 50;

//quitar fatiga Y RADIO
player enableFatigue false;
enableRadio false;

//crear canal de emergencia y administracion
if(isServer) then {
	adminChannel = radioChannelCreate [[1, 0, 0, 1], "Administracion", "%UNIT_NAME", []];
	EMSChannel	 = radioChannelCreate [[1,0.4,0,1], "Emergencias", "%UNIT_NAME", []];
	publicVariable "adminChannel";
	publicVariable "EMSChannel";

	//activar controlador de robos activos by quick
	if (isNil "robosActivosGLOBAL") then {robosActivosGLOBAL = [["Dummy init",0]]};	
	publicVariable "robosActivosGLOBAL";
	if (isNil "robosActivosCount") then {robosActivosCount = 0};	
	publicVariable "robosActivosCount";



} else {

};
{_x setMarkerAlphaLocal 0} forEach ["helicrash_1","helicrash_2","helicrash_3","helicrash_4","wreck_1","wreck_2","wreck_3","wreck_4"];


