//Intento 1

private["_ladron","_tienda","_dinero","_ui","_progreso","_texto","_cp","_muerto","_posicion"];
_tienda = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_ladron = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;
_action = [_this,2] call BIS_fnc_param;
_cops = { (isPlayer _x) && (side (group _x) == west) } count playableUnits;

if(side _ladron != civilian) exitWith { hint "No puedes robarle!" };
if(_ladron distance _tienda > 40) exitWith { hint "No te puedes alejar mas de 50m!" };

if !(_dinero) then { _dinero = 1000; };
if (_muerto) exitWith { hint "Robo en marcha atento a la poli" };
if (vehicle player != _ladron) exitWith { hint "Fuera del vehiculo!" };

if !(alive _ladron) exitWith {};
if (currentWeapon _ladron == "") exitWith { hint "Me apuntas con el dedo? jajaja" };
if (_dinero == 0) exitWith { hint "Soy pobre...solo tengo las zapatillas..." };

_muerto = true;
_dinero = switch (true) do {

	case (_cops == 2): {15000 + round(random 45000)};
	case (_cops == 3): {20000 + round(random 45000)};
	case (_cops == 4): {30000 + round(random 45000)};
	case (_cops == 5): {35000 + round(random 45000)};
	case (_cops == 6): {40000 + round(random 45000)};
	case (_cops == 7): {45000 + round(random 45000)};
	case (_cops >= 8): {50000 + round(random 45000)};
 };

_tienda removeAction _action;
_tienda switchMove "AmovPercMstpSsurWnonDnon";
_suerte = random(100);
if(_suerte >= 85) then { hint "El cabron del dependiente activo la alarma! Sal corriendo"; [[1,format["ALARMA! Estan robando en %1", _tienda]],"life_fnc_broadcast",west,false] spawn life_fnc_MP; };

_cops = (west countSide playableUnits);
if(_cops < 2) exitWith{[[_vault,-1],"disableSerialization;",false,false] spawn life_fnc_MP; hint "Poca polica menos diversion";};
disableSerialization;
5 cutRsc ["life_progreso","PLAIN"];
_ui = uiNameSpace getVariable "life_progreso";
_progreso = _ui displayCtrl 38201;
_texto = _ui displayCtrl 38202;
_texto ctrlSetText format["Robo en progreso... estate a menos de 50m (1%1)","%"];
_progreso progressSetPosition 0.01;
_cp = 0.01;

if(_muerto) then
{
while{true} do
{
sleep 0.85;
_cp = _cp + 0.01;
_progreso progressSetPosition _cp;
_texto ctrlSetText format["Robo en progreso... (50m) (%1%2)...",round(_cp * 100),"%"];
_posicion = position player;
				                _marker = createMarker ["Marker200", _posicion];
				                "Marker200" setMarkerColor "ColorRed";
				                "Marker200" setMarkerText "ATENCION! ESTAN ROBANDO!";
				                "Marker200" setMarkerType "mil_warning";
if(_cp >= 1) exitWith {};
if(_ladron distance _tienda > 50.5) exitWith { };
if!(alive _ladron) exitWith {};
};
if!(alive _ladron) exitWith { _muerto = false; };
if(_ladron distance _tienda > 50.5) exitWith { deleteMarker "Marker200"; _tienda switchMove ""; hint "Tenias que estar a menos de 50m ahora esta cerrada la caja!"; 5 cutText ["","PLAIN"]; _muerto = false; };
5 cutText ["","PLAIN"];

titleText[format["Robastes %1,ahora sal corriendo antes de que llegue la poli",[_dinero] call life_fnc_numberText],"PLAIN"];
deleteMarker "Marker200";
life_cash = life_cash + _dinero;

_muerto = false;
life_use_atm = false;
sleep (30 + random(180));
life_use_atm = true;
if!(alive _ladron) exitWith {};
[[getPlayerUID _ladron,name _ladron,"211"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
};
sleep 300;
_action = _tienda addAction["Robar tienda",life_fnc_robShops];
_tienda switchMove "";