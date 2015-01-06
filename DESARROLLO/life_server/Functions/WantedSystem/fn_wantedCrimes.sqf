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
		case "1": {_x = "Driving without Lights"};
		case "2": {_x = "Driving without License"};
		case "3": {_x = "Driving over the Speed"};
		case "4": {_x = "Reckless Driving"};
		case "5": {_x = "Driving Stolen Vehicle"};
		case "6": {_x = "Hit and Run"};
		case "7": {_x = "Attempted Murder"};
		case "8": {_x = "Vehicular Manslaughter"};
		case "9": {_x = "Manslaughter"};
		case "10": {_x = "Escaping Jail"};
		case "11": {_x = "Rape"};
		case "12": {_x = "Attempted Rape"};
		case "13": {_x = "Attempted Auto Theft"};
		case "14": {_x = "Use of illegal explosives"};
		case "15": {_x = "Robbery"};
		case "16": {_x = "Kidnapping"};
		case "17": {_x = "Attempted Kidnapping"};
		case "18": {_x = "Public Intoxication"};
		case "19": {_x = "Grand Theft"};
		case "20": {_x = "Petty Theft"};
		case "21": {_x = "Hit and run"};
		case "22": {_x = "Drug Possession"};
		case "23": {_x = "Intent to distribute"};
		case "24": {_x = "Drug Trafficking"};
		case "25": {_x = "Burglary"};
		case "26": {_x = "Tax Evasion"};
		case "27": {_x = "Terrorism"};
		case "28": {_x = "Unlicensed Hunting"};
		
		
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