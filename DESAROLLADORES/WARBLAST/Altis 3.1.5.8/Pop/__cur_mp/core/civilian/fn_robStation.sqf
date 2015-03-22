/* 
	File: fn_robStation.sqf
	Desc: Robs the station.

	Author: Ciaran Langton.
	For: AltisLife.co.uk and only AltisLife.co.uk.
*/
private["_pump","_station","_name","_colour"];
_pump = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_station = [_this,3,"",[""]] call BIS_fnc_param;
if(isNull _pump || _station == "") exitWith {}; //Error.
if(_pump getVariable ["rob_empty",false]) exitWith {hint "This shop was robbed recently and cannot be robbed again for a while as security is high!";};
if(_pump getVariable ["rob_ip",false]) exitWith {hint "This shop is already being robbed!";};
if(side player != civilian) exitWith {};
if(!alive player) exitWith {};
if({side _x == west} count playableUnits < 5) exitWith {hint "There are not enough cops online for you to rob this! (5 Minimum)"}; //Annd less than 10 cops on!
if(currentWeapon player == "" || currentWeapon player == "binocular") exitWith {hint "You do not threaten me!";};
if(vehicle player != player) exitWith {hint "You cannot rob this shop from your car!";};

//Alright, rob is a go! lets begin shall we!!
_pump setVariable ["rob_ip",true,true];

_name = markerText _station;
_colour = markerColor _station;
//Set the marker to ROBBING state.
_station setMarkerColor "ColorRed";
_station setMarkerText format["-ROBBERY IN PROGRESS- %1",_name];

//Now to send it out to give people a hint that a station is being robbed...
[[1,format["A camera has saw that %1 Is Being Robbed!",_name]],"life_fnc_broadcast",west,false] spawn life_fnc_MP; //Hint for cops
[[0,format["A camera has saw that %1 Is Being Robbed!",_name]],"life_fnc_broadcast",true,false] spawn life_fnc_MP; //Systemchat message for everyone!!
hint format["Robbing %1 please stay near the till in order to receive the money.",_name];
[[_pump, "shopalarm",40],"life_fnc_playSound",true,false] spawn life_fnc_MP; //Lets send out a little sound to alert near by people.
[[getPlayerUID player,profileName,"211"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
[[_pump,"AmovPercMstpSsurWnonDnon"],"life_fnc_animSync",true,false] spawn life_fnc_MP;

_upp = "Robbing Shop";
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNameSpace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (1%1)... You are currently %3m Away!","%",_upp,round(player distance _pump)];
_progress progressSetPosition 0.01;
_cP = 0.01;

while{true} do
{
	sleep 1;
	_cP = _cP + 0.0035;
	_progress progressSetPosition _cP;
	_pgText ctrlSetText format["%3 (%1%2)... You are currently %4m Away!",round(_cP * 100),"%",_upp, round(player distance _pump)];
	//Some progress updates for the Popo!
	if(round(_cP * 100) == 75) then {[[1,format["The robber of %1 is currently preparing to leave! (75% Complete)",_name]],"life_fnc_broadcast",west,false] spawn life_fnc_MP;};
	if(round(_cP * 100) == 50) then {[[1,format["The robber of %1 is currently stuffing the money bags! (50% Complete)",_name]],"life_fnc_broadcast",west,false] spawn life_fnc_MP;};
	if(_cP >= 1) exitWith {};
	if(!alive player) exitWith {};
	if(player != vehicle player) exitWith {};
	if((player distance _pump) > 5) exitWith {};
	if(life_istazed) exitWith {};
	if(currentWeapon player == "") exitWith {};
};

5 cutText ["","PLAIN"];

if(_cP >= 1) then {
	_money = 15000 + floor(round(random 5000));
	ALUK_wonga = ALUK_wonga + _money;

	_moneyStr = [_money] call life_fnc_numberText;
	hint format["You gained £%1 from robbing %2.",_moneyStr,_name];
	[[1,format["A camera has reported the robber of %1 has ran after stealing around £%2!",_name,_moneyStr]],"life_fnc_broadcast",west,false] spawn life_fnc_MP; //Hint for cops
	[[0,format["A camera has reported the robber of %1 has ran after stealing around £%2!",_name,_moneyStr]],"life_fnc_broadcast",true,false] spawn life_fnc_MP; //Systemchat message for everyone!!
} else {
	[[1,format["A camera has reported that %1 is no longer being robbed!",_name]],"life_fnc_broadcast",west,false] spawn life_fnc_MP; //Hint for cops
	[[0,format["A camera has reported that %1 is no longer being robbed!",_name]],"life_fnc_broadcast",true,false] spawn life_fnc_MP; //Systemchat message for everyone!!

	if((player distance _pump) > 5) then {hint "You went more than 5 meters from the till.";};
};

[[_pump,""],"life_fnc_animSync",true,false] spawn life_fnc_MP;
[70] call life_fnc_addXP;
_station setMarkerColor _colour;
_station setMarkerText _name;
[[_pump,_name],"TON_fnc_stationTimer",false,false] spawn life_fnc_MP; 

_pump setVariable ["rob_ip",false,true];