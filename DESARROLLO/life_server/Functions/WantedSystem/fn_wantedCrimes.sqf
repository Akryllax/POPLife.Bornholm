/*
	File: fn_wantedCrimes.sqf
	Author: ColinM
	Assistance by: Paronity
	Stress Tests by: Midgetgrimm
	
	Description:
	Grabs a list of crimes committed by a person.
*/
private["_display","_criminal","_tab","_queryResult","_result","_ret","_crimesDb","_crimesArr","_type"];
disableSerialization;
_ret = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_criminal = [_this,1,[],[]] call BIS_fnc_param;

_result = format["SELECT wantedCrimes, wantedBounty FROM wanted WHERE active='1' AND wantedID='%1'",(_criminal select 0)];
waitUntil{!DB_Async_Active};
_tickTime = diag_tickTime;
_queryResult = [_result,2] call DB_fnc_asyncCall;

_ret = owner _ret;
_crimesArr = [];

_crimesDB = [(_queryResult select 0)] call DB_fnc_mresToArray;
if(typeName _crimesDb == "STRING") then {_crimesDb = call compile _crimesDb;};
_queryResult set[0,_crimesDb];
_type = _queryResult select 0;
{
	switch(_x) do
	{
		case "1": {_x = "Atropello"};
		case "2": {_x = "Asesinato"};
		case "3": {_x = "Fuga"};
		case "4": {_x = "Violacion"};
		case "5": {_x = "Robo"};
		case "6": {_x = "Uso ilegal de explosivos"};
		case "7": {_x = "Hurto menor"};
		case "8": {_x = "Secuestro"};
		case "9": {_x = "Posesion de drogas"};
		case "10": {_x = "Trafico de drogas"};
		case "11": {_x = "Asalto armado"};
		case "12": {_x = "Conducir sin licencia"};
		case "13": {_x = "Conducir sin luces"};
		case "14": {_x = "Exceso de velocidad"};
		case "15": {_x = "Violacion zona de exclusion aerea"};
		case "16": {_x = "Conduccion temeraria"};
		case "17": {_x = "Desorden civil"};
		case "18": {_x = "Falta de respeto a la autoridad"};
		case "19": {_x = "Entrar en zona restringida"};
		case "20": {_x = "Posesion de armas sin licencia"};
		case "21": {_x = "Secuestro"};
		case "22": {_x = "Comercio ilegal"};
		case "23": {_x = "Enemigo publico"};
		case "24": {_x = "Vuelo sin licencia"};
		case "25": {_x = "Destrozar vehiculos/propiedades/mobiliario"};
		case "26": {_x = "Atentar contra la autoridad"};
		case "27": {_x = "Posesion de armas ilegales"};	
		
	};
	_crimesArr pushBack _x;
}forEach _type;
_queryResult set[0,_crimesArr];

diag_log "------------- Client Query Request -------------";
diag_log format["QUERY: %1",_result];
diag_log format["Time to complete: %1 (in seconds)",(diag_tickTime - _tickTime)];
diag_log format["Result: %1",_queryResult];
diag_log "------------------------------------------------";

[[_queryResult],"life_fnc_wantedInfo",_ret,false] spawn life_fnc_MP;