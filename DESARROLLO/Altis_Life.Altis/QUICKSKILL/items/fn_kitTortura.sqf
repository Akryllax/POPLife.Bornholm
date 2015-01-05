/*
	Tortura al jugador,lo hizo un aleman loco, editado por quickskill para plataoplomo
*/
private["_unit","_rand","_damage"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _unit) exitWith {};
if(playerSide == west) exitWith {};
if(life_action_inUse) exitWith {[true,"kitTortura",1] call life_fnc_handleInv;};

if(player distance _unit > 3 || !alive player || !alive _unit) exitWith {hint "La persona esta muy lejos";[true,"kitTortura",1] call life_fnc_handleInv;	};

life_action_inUse = true;

_rand = [0,4] call life_fnc_randomRound;


switch(_rand) do 
{
	case 0:
	{
		hintSilent "Le has quitado 1 uña";
		//Play sound on _unit
		
		//Damage _unit
		_damage = damage _unit;
		_damage = _damage + 0.07;
		
		if(_damage >= 1) then { _damage = 0.95; };
		
		_unit setDamage _damage;
		

		player say3D "punch1";
		_unit say3D "hurt1";
	};
	case 1:
	{
		hintSilent "Le has cortado 1 dedo";
		//Play sound on _unit
		
		//Damage _unit
		_damage = damage _unit;
		_damage = _damage + 0.1;
		
		if(_damage >= 1) then { _damage = 0.98; };
		
		_unit setDamage _damage;
		
		player say3D "punch1";
		_unit say3D "hurt1";
	};
	case 2:
	{
		hintSilent "Le has dado una paliza";
		//Play sound on _unit
		
		//Damage _unit
		_damage = damage _unit;
		_damage = _damage + 0.11;
		
		if(_damage >= 1) then { _damage = 0.98; };
		
		_unit setDamage _damage;
		player say3D "punch1";
		_unit say3D "hurt1";
	};
	case 3:
	{
		hintSilent "Le has cortado una mano";
		//Play sound on _unit
		
		//Damage _unit
		_damage = damage _unit;
		_damage = _damage + 0.5;
		
		if(_damage >= 1) then { _damage = 0.99; };
		
		_unit setDamage _damage;
		
	   player say3D "punch1";
		_unit say3D "hurt1";
	};
	default
	{
		hintSilent "Le has roto las piernas";
		//Play sound on _unit
		
		//Damage _unit
		_damage = damage _unit;
		_damage = _damage + 0.1;
		
		if(_damage >= 1) then { _damage = 0.98; };
		
		_unit setDamage _damage;
		
		
		
		  player say3D "punch1";
		_unit say3D "hurt1";
	};
};


life_action_inUse = false;

//[[getPlayerUID player,name player,"",["Torturador",800]],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
