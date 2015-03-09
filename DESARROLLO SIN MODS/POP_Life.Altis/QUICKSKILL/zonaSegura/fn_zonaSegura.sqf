///////////////////////////////////////////////////////////////////////
//zona segura serverside sin triggers !!  by quicskill para plata o plomo
/////////////////////////////////////////////////////////////////////////

//sino eres el server vete al carallo
if(!isServer)exitWith{};

_zonasSeguras = ["zonaSegura_1","zonaSegura_2","zonaSegura_3","zonaSegura_4"];
_zone = "";

//loop all playable untis
{ 


      //si es un jugador

	if (isPlayer _x) then { 

		_player = _x;



		//mirar si esta en una zona segura
		{

		if(_player distance (getMarkerPos _x) < 100) exitWith {_zone = _x;};


		} foreach _zonasSeguras;



	//no esta en zona segura

	if(_zone == "") exitWith {

	_player allowDamage true;

	};

	//si esta en una zona segura

	switch(true) do {
	
		case (_zone in ["zonaSegura_1","zonaSegura_2","zonaSegura_3","zonaSegura_4"]): {

			_player allowDamage false;


		};//end case

	};//end switch


	}; //end if es un player



} forEach playableUnits;//for para todos los jugadores jugables

sleep 30;

[] execVM "QUICKSKILL\zonaSegura\fn_zonaSegura.sqf";