///////////////////////////////////////////////////////////////////////
//extarer petroleo!! quicskill para plata o plomo
/////////////////////////////////////////////////////////////////////////
private["_furgo"];
_gen = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
_caller =[_this,1,Objnull,[Objnull]] call BIS_fnc_param;
 _id = _this select 2; 

_furgo =[_this,3,Objnull,[Objnull]] call BIS_fnc_param;

if(isNull _furgo) exitWith {hint "Barco is null :("}; //if not the thief get bent


_resourceZones = ["extraer_petrolio_1","extraer_petrolio_2","extraer_petrolio_3","extraer_petrolio_4"];
_zone = "";


//Find out what zone we're near
{
	if(_furgo distance (getMarkerPos _x) < 30) exitWith {_zone = _x;};
} foreach _resourceZones;

if(_zone == "") exitWith {
	
	//no estas en una zona con petroleo
};

//Get the resource that will be gathered from the zone name...
switch(true) do {
	case (_zone in ["extraer_petrolio_1","extraer_petrolio_2","extraer_petrolio_3","extraer_petrolio_4"]): {
	hint "Extrayendo petroleo";
    sleep 5;

	_veh_data = life_trunk_vehicle getVariable ["Trunk",[[],0]];
    _inv = _veh_data select 0;
    _ctrl = "petroleo";
   
	_index = [_ctrl,_inv] call TON_fnc_index;
	if(_index == -1) then
	{
		_inv pushBack [_ctrl,_num];
	}
		else
	{
		_val = _inv select _index select 1;
		_inv set[_index,[_ctrl,_val + _num]];
	};
	
	life_trunk_vehicle setVariable["Trunk",[_inv,(_veh_data select 1) + 10],true];
	[life_trunk_vehicle] call life_fnc_vehInventory;


	hint "Petroleo extraido, espera 30s hasta que se enfrian las maquinas.";
	sleep 30;
	_furgo addAction["Extarer Petroleo", QUICK_fnc_extraerPetroleo,_furgo];

};
	
	default {hint "No hay petroleo cerca";};
};








};
