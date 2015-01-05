/*
file: fn_robHotel.sqf
Author: MrKraken
Made from MrKrakens bare-bones shop robbing tutorial on www.altisliferpg.com forums
Description:
Executes the rob shob action!
Idea developed by PEpwnzya v1.0
Modificado por Plata o Plomo
*/
private["_robber","_shop","_kassa","_ui","_progress","_pgText","_cP","_rip","_pos"];
_shop = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param; //The object that has the action attached to it is _this. ,0, is the index of object, ObjNull is the default should there be nothing in the parameter or it's broken
_robber = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param; //Can you guess? Alright, it's the player, or the "caller". The object is 0, the person activating the object is 1
//_kassa = 1000; //The amount the shop has to rob, you could make this a parameter of the call (https://community.bistudio.com/wiki/addAction). Give it a try and post below ;)
_action = [_this,2] call BIS_fnc_param;//Action name

if(side _robber != civilian) exitWith { hint "No puedes robar!" };
if(_robber distance _shop > 40) exitWith { hint "Necesitas estar a menos de 40m para robar!" };

if !(_kassa) then { _kassa = 1000; };
if (_rip) exitWith { hint "Robo en progreso!" };
if (vehicle player != _robber) exitWith { hint "Salga de su vehículo!" };

if !(alive _robber) exitWith {};
if (currentWeapon _robber == "") exitWith { hint "¡No me amenaces! ¡Fuera de aquí pordiosero!" };
if (_kassa == 0) exitWith { hint "No hay dinero en la caja registradora!" };

_rip = true;
_kassa = 100000 + round(random 700000);
_shop removeAction _action;
_shop switchMove "AmovPercMstpSsurWnonDnon";
_chance = random(100);
if(_chance >= 1) then { hint "El cajero activo la alarma silenciosa, la policía ha sido alertada!"; [[1,format["Alarma activada! - Se esta produciendo un atraco en %1 !", _shop]],"life_fnc_broadcast",west,false] spawn life_fnc_MP; };
		
_cops = (west countSide playableUnits);
if(_cops < 5) exitWith{[[_vault,-1],"disableSerialization;",false,false] spawn life_fnc_MP; hint "No hay suficientes policias!";};
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNameSpace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["Robo en progreso, permanece cerca (40m) (1%1)...","%"];
_progress progressSetPosition 0.01;
_cP = 0.01;
 
if(_rip) then
{
while{true} do
{
sleep 8;
_cP = _cP + 0.01;
_progress progressSetPosition _cP;
_pgText ctrlSetText format["Robo en progreso, permanece cerca (20m) (%1%2)...",round(_cP * 100),"%"];
_Pos = position player; // by ehno: get player pos
				                _marker = createMarker ["Marker200", _Pos]; //by ehno: Place a Maker on the map
				                "Marker200" setMarkerColor "ColorRed";
				                "Marker200" setMarkerText "!ATENCION! Estan robando el Hotel!";
				                "Marker200" setMarkerType "mil_warning";			
if(_cP >= 1) exitWith {};
if(_robber distance _shop > 40) exitWith { };
if!(alive _robber) exitWith {};
};
if!(alive _robber) exitWith { _rip = false; };
if(_robber distance _shop > 40) exitWith { deleteMarker "Marker200"; _shop switchMove ""; hint "Tienes que estar a menos de 40m para robar! - El robo ha fracasado."; 5 cutText ["","PLAIN"]; _rip = false; };
5 cutText ["","PLAIN"];

titleText[format["Has robado %1€, ahora largate antes de que llegue la policía!",[_kassa] call life_fnc_numberText],"PLAIN"];
deleteMarker "Marker200"; // by ehno delete maker
life_cash = life_cash + _kassa;

_rip = false;
life_use_atm = false;
sleep (30 + random(180));
life_use_atm = true;
if!(alive _robber) exitWith {};
[[getPlayerUID _robber,name _robber,"211"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
};
sleep 3600;
_action = _shop addAction["Robo",life_fnc_robHotel];	
_shop switchMove "";