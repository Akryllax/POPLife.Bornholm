///////////////////////////////////////////////////////////////////////
//extarer petroleo!! quicskill para plata o plomo
/////////////////////////////////////////////////////////////////////////
private["_furgo"];
_gen = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
_caller =[_this,1,Objnull,[Objnull]] call BIS_fnc_param;
 _id = _this select 2; 

_furgo =[_this,3,Objnull,[Objnull]] call BIS_fnc_param;

if(isNull _furgo) exitWith {hint "Barco is null :("}; //if not the thief get bent


_resourceZones = ["petroleo_1","petroleo_2","petroleo_3","petroleo_4"];
_zone = "";


//Find out what zone we're near
{
	if(_furgo distance (getMarkerPos _x) < 30) exitWith {_zone = _x;};
} foreach _resourceZones;

if(_zone == "") exitWith {
	
	//no estas en una zona con petroleo
	hint "No estas en una zona con petroleo";
};

//Get the resource that will be gathered from the zone name...

switch(true) do {
	case (_zone in ["petroleo_1","petroleo_2","petroleo_3","petroleo_4"]): {

	[_furgo]spawn {
	_furgo = _this select 0;
	hint "Extrayendo petroleo";
	_num = 5;
	_ctrl = "petroleo";
    sleep 5;

	_veh_data = life_trunk_vehicle getVariable ["Trunk",[[],0]];
    _inv = _veh_data select 0;
    
   
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


	hint "Petroleo extraido, espera 10s hasta que se enfrien las maquinas";
	sleep 10;
	_furgo addAction["Extraer Petroleo",QUICK_fnc_extraerPetroleo,_furgo];

	};

};
	
	default {hint "No hay petroleo cerca";};
};