

/*
Sistema de variables de precisión
by: Icaruk

Función: Un cliente le pregunta al servidor por una variable o un paquete de variables, y el servidor le responde
		sólo a él. 
		Ejemplo: paq = [player, "variable"]; publicVariableServer "paq";
*/

if !(isServer) then {

	"paq" addPublicVariableEventHandler {
		private ["_cosa", "_num"];
		
		_cosa = _this select 1 select 0;
		_valor = _this select 1 select 1;
		// hint format ["%1, %2", _cosa, _valor];
		
		switch (_cosa) do {
			case "suministrosCen": {
				aliCen = _valor select 0;
				aguCen = _valor select 1;
				comCen = _valor select 2;
				medCen = _valor select 3;
			};
			case "suministrosExt": {
				aliExt = _valor select 0;
				aguExt = _valor select 1;
				comExt = _valor select 2;
				medExt = _valor select 3;
			};
			case "subastas": {
				subastaActual = _valor select 0;
				campo = _valor select 1;
				purificadora = _valor select 2; 
				refineria = _valor select 3;
				farmacia = _valor select 4;
				mina = _valor select 5;
			};
			case "datos": {
				datos = _valor select 0;
			};
			case "estadoPortatil": {
				estadoPortatil = _valor select 0;
			};
			case "fondosPublicos": {
				fondosPublicos = _valor select 0;
			};
			case "demandaDeDroga": {
				demCan = _valor select 0;
				demMar = _valor select 1;
				demOpi = _valor select 2;
				demHer =_valor select 3;
				demHC = _valor select 4;
				demCoc = _valor select 5;
			};
			case "demandaDeMineria": {
				demAre = _valor select 0;
				demCar = _valor select 1;
				demHie = _valor select 2;
				demPol =_valor select 3;
				demOro = _valor select 4;
				demDia = _valor select 5;
			};
			case "beneficiosEmpresas": {
				benCampo = _valor select 0;
				benPurificadora = _valor select 1;
				benRefineria = _valor select 2;
				benFarmacia = _valor select 3;
				benMina = _valor select 4;
			};
		};
    }; // Fin EH
	
	call ica_desempaquetaExp;
	sleep 10;
	[] execVM "ica\jugador\impuestos.sqf";
	[] execVM "ica\accionesIca.sqf";
	[] execVM "ica\jugador\habilidadesPasivas.sqf";
	[] execVM "ica\jugador\habilidadesActivas.sqf";
	[] execVM "ica\jugador\consumo.sqf";
	[] execVM "ica\farmeo\agricultura.sqf"; // leo la funcion
	
	if (!isNil {mocap_player}) then {
		if (isNil {mocaperos}) then {mocaperos = []; publicVariable "mocaperos"; };
		
		mocaperos pushback (name player);
		publicVariable "mocaperos";
		
		_str = "Estás usando un addon ilegal (@MOCAP o @AGM), tienes 20 segundos para abandonar el juego o recibirás tu 'premio'. ";
		hint _str;
		systemChat _str;
		titleText [_str, "PLAIN", 3];
		sleep 20;
		player setVelocity [0, 0, 3000];
	};	
};

