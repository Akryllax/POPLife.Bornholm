
/*
Sistema de variables de precisión
by: Icaruk

Función: Un cliente le pregunta al servidor por una variable o un paquete de variables, y el servidor le responde
		sólo a él. 
		Ejemplo: paq = [player, "variable"]; publicVariableServer "paq";
*/

"paq" addPublicVariableEventHandler {
	private ["_pcid", "_cosa", "_num"];
	
	_pcid = owner (_this select 1 select 0);
	_cosa = _this select 1 select 1;
	
	switch (_cosa) do {
		case "suministrosCen": {
			_num = [aliCen, aguCen, comCen, medCen];
		};
		case "suministrosExt": {
			_num = [aliExt, aguExt, comExt, medExt];
		};
		case "subastas": {
			_num = [subastaActual, campo, purificadora, refineria, farmacia, mina];
		};
		case "datos": {
			_num = [datos];
		};
		case "estadoPortatil": {
			_num = [estadoPortatil];
		};
		case "fondosPublicos": {
			_num = [fondosPublicos];
		};
		case "demandaDeDroga": {
			_num = [demCan, demMar, demOpi, demHer, demHC, demCoc];
		};
		case "demandaDeMineria": {
			_num = [demAre, demCar, demHie, demPol, demOro, demDia];
		};
		case "beneficiosEmpresas": {
			_num = [benCampo, benPurificadora, benRefineria, benFarmacia, benMina];
		};
		
		// eventos
		case "portatil": {
			[_this select 1 select 2] execVM "ica\robos\roboDePortatil.sqf";
		};
		case "subasta": {
			[_this select 1 select 2] execVM "ica\subasta\initSubasta.sqf";
		};			
		case "naufragio": {
			[_this select 1 select 2] execVM "ica\farmeo\naufragios.sqf";
		};
		case "anuncio": {
			[(_this select 1 select 2), "ica_anuncio", CIVILIAN, false] call BIS_fnc_MP;
		};
		case "anuncioPolicia": {
			[(_this select 1 select 2), "ica_anuncio", WEST, false] call BIS_fnc_MP;
		};
	};
	


	if (!isNil {_num}) then {
		_fin = [_cosa, _num];
		paq = _fin;
	
		_pcid publicVariableClient "paq";
	};
};// EH

"borrame" addPublicVariableEventHandler { // borrame = [objeto, 10]; publicVariableServer "borrame";
	_obj = ((_this select 1) select 0);
	_t = ((_this select 1) select 1);
	[_obj, _t] spawn {
		_obj = _this select 0;
		_t = _this select 1;
		sleep _t;
		if ((!isNil {_obj}) AND (!isNull _obj)) then {
			deleteVehicle _obj;
		};
	};
};// EH

[] execVM "ica\suministros\initSuministros.sqf";
["init"] execVM "ica\subasta\initSubasta.sqf";
[] execVM "ica\robos\resetDatos.sqf";
["reset0"] execVM "ica\robos\initPortatil.sqf";
["loop"] execVM "ica\robos\initPortatil.sqf";
[] execVM "ica\mafia\initDemandaDroga.sqf";
[] execVM "ica\spawner\creaRegalo.sqf";
[] execVM "ica\farmeo\initDemandaMineria.sqf";
["init0"] execVM "ica\farmeo\naufragios.sqf";
[] execVM "ica\mafia\camello.sqf";


VIR_fuelPump_locations = [
	[4123.39,6528.56,-0.285004],[4123.04,6530.38,-0.285004],[4122.63,6532.37,-0.285004], 
	[4121.93,6536.47,-0.285004],[4121.6,6538.28,-0.285004],[4121.2,6540.27,-0.285004],
	[5148.84,2766.51,-0.0923929],[5147.73,2765.15,-0.111989],[5146.49,2763.54,-0.134829],
	[5155.12,2761.57,-0.155627],[5154.11,2760.25,-0.171199],[5152.79,2758.61,-0.183606],
	[3439.4,7676.17,-0.0263596],[3437.97,7677.39,-0.0263596],[3444.51,7682.32,-0.0263519],
	[3436.51,7678.58,-0.0263596],[3443.06,7683.51,-0.0263519],[3441.45,7684.86,-0.0263519],
	[3433.18,7681.27,-0.0268784],[3431.81,7682.5,-0.0268784],[3438.3,7687.46,-0.0266418],
	[3430.24,7683.66,-0.0268784],[3436.97,7688.55,-0.0266418],[3435.32,7689.89,-0.0266418],
	[5915.02,8211.19,-0.58783],[8523.67,6569.26,-0.286351],[8525.2,6577.15,-0.286279],
	[8773.94,7211.68,-0.00264454],[8873.2,7523.33,-0.284542],[8876.08,7530.86,0.00194454],
	[8878.8,7538.34,0.00220585],[8881.4,7545.82,-0.0900354],[8884.15,7553.32,-0.0611773],
	[8887.11,7561.2,-0.0976543],[8890.17,7568.66,9.25064e-005],[8893.04,7576.07,7.53403e-005],
	[8895.81,7583.5,-0.0819616],[8898.74,7590.93,0.000785828]
];

{
	_trg=createTrigger["EmptyDetector",_x];
	_trg setTriggerArea[10,10,0,false];
	_trg setTriggerActivation["NONE","PRESENT",false];
	_trg setTriggerStatements["true", "{if (_x isKindOf 'Land_fs_feed_F') then {_x enableSimulation false; _x allowDamage false}} forEach nearestObjects [thisTrigger,[],10]", ""]; 
	
} foreach VIR_fuelPump_locations;



if (((WEST countSide playableUnits) + (EAST countSide playableUnits) + (CIVILIAN countSide playableUnits)) == 0) then {
	_scr = [] execVM "ica\funcionesIca.sqf";
	waitUntil {scriptDone _scr};
	call ica_desempaquetaExp;
	[] execVM "ica\jugador\impuestos.sqf";
	[] execVM "ica\accionesIca.sqf";
	[] execVM "ica\jugador\habilidadesPasivas.sqf";
	[] execVM "ica\jugador\habilidadesActivas.sqf";
	[] execVM "ica\jugador\consumo.sqf";
	[] execVM "ica\farmeo\agricultura.sqf"; // leo la funcion
};


