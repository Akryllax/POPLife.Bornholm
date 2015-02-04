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
//cosas de War
[] execVM "WarBlast\init.sqf";
"BIS_fnc_MP_packet" addPublicVariableEventHandler {_this call life_fnc_MPexec};

StartProgress = true;
/////////////////////////////////////////////////////
//robo avanzado banco de ica adaptado x quick xD
/////////////////////////////////////////////////////

//esta funcion la utiliza el ica pa sacar un codigo!
ICARUK_fnc_addAction = {
    private["_object","_script"];
    _object = _this select 0;
    _script = _this select 1;

    _object addAction _script;
};

MAC_fnc_switchMove = {
    private["_object","_anim"];
    _object = _this select 0;
    _anim = _this select 1;

    _object switchMove _anim;

};

MTP_fnc_numberToString = {
    _number = _this;
    _str = "";
    if (_number % 1 == 0) then
    {
        while { _number > 0 } do
        {
            _digit = floor (_number % 10);
            _str = (str _digit) + _str;
            _number = floor (_number / 10);
        };
    }
    else
    {
        _decimals = _number % 1;
        _decimals = _decimals * 1000000;
        _number = floor _number;
        _str = _number call MTP_fnc_numberToString;
        _str = _str + "." + str _decimals;
    };

    _str;
};

if (isServer) then {
	null = [] execVM "QUICKSKILL\robos\banco\initBanco.sqf";
	null = [] execVM "QUICKSKILL\robos\banco\nuevoCodigoBancario.sqf";
};
[] execVM "QUICKSKILL\robos\banco\sumaDeposito.sqf";

////////////end robo banco avanzado/////////////////////////////////

///camellitos!!
 //marcador
 // _markerID = "Camello2_mrk";
 // _pos = position camello2;
 //markerCamello2 = createMarker [ _markerID, _pos];
//markerCamello2 setMarkerColor "ColorGreen";
//markerCamello2 setMarkerText "CAMELLO";
//markerCamello2 setMarkerType "mil_warning";



  //marcador camello 1
    //_markerID = "Camello1_mrk";
//  _pos = position camello;
 //markerCamello1 = createMarker [ _markerID, _pos];
//markerCamello1 setMarkerColor "ColorGreen";
//markerCamello1 setMarkerText "CAMELLO";
//markerCamello1 setMarkerType "mil_warning";

//quitar efectos de lluvia ninja code by quik +nija code arreglando lo de quick....si esque....
[] spawn {
    while{true} do{
        0 setRain 0;
        0 setOvercast 0;
        0 setFog 0;
        sleep 30;
    };
};
//cuando este terminado activamos
/*[] spawn {
	waitUntil { time > 0 };
	[] call life_fnc_initRem;
};
*/
//quitar fatiga Y RADIO
enableRadio false;

//crear canal de emergencia y administracion
if(isServer) then {
	adminChannel = radioChannelCreate [[1, 0, 0, 1], "Administracion", "%UNIT_NAME", []];
	EMSChannel	 = radioChannelCreate [[1,0.4,0,1], "Emergencias", "%UNIT_NAME", []];
	publicVariable "adminChannel";
	publicVariable "EMSChannel";
} else {

};

//hc client
if !(hasInterface or isServer) then {
  execVM "init_hc.sqf";
};
//poner opacity 0 a markadores de helicrash!!
{_x setMarkerAlphaLocal 0} forEach ["helicrash_1","helicrash_2","helicrash_3","helicrash_4","wreck_1","wreck_2","wreck_3","wreck_4"];
War_loop = compile (preprocessFileLineNumbers "WarBlast\Musica\War_loop.sqf");

_igiload = execVM  "WarBlast\IgiLoad\IgiLoadInit.sqf";

[] call life_fnc_initRacing;