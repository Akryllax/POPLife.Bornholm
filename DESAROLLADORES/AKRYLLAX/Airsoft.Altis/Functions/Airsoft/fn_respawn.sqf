/*

*/
private["_unit"];

if(!life_playing_airsoft) exitWith {}; //So Arma... What the fuck are you doing here?

switch (group _unit) do{

	case airsoft_redGroup:
	{
		_spawn = getMarkerPos "marker_airsoft_red";
		_unit  = "O_Soldier_VR_F" createUnit [_spawn,airsoft_redGroup];
		waitUntil{vehicle _unit == _unit};
		_unit addEventHandler["Killed", "[] call { [] execVM ""fn_airsoftOnPlayerKilled.sqf"" }"];
		
		selectPlayer _unit;
		life_playing_airsoft = true;
	};
	
	case airsoft_blueGroup:
	{
		_spawn = getMarkerPos "marker_airsoft_blue";
		_unit  = "O_Soldier_VR_F" createUnit [_spawn,airsoft_blueGroup];
		waitUntil{vehicle _unit == _unit};
		_unit addEventHandler["Killed", "[] call { [] execVM ""fn_airsoftOnPlayerKilled.sqf"" }"];
		
		selectPlayer _unit;
		life_playing_airsoft = true;
	};
};