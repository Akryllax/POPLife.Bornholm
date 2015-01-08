/*
	File: fn_wantedAdd.sqf
	Author: Bryan "Tonic" Boardwine"
	Database Persistence By: ColinM
	Assistance by: Paronity
	Stress Tests by: Midgetgrimm

	Description:
	Adds or appends a unit to the wanted list.
*/
private["_uid","_type","_index","_data","_crimes","_val","_customBounty","_name","_pastCrimes","_query","_queryResult"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
_name = [_this,1,"",[""]] call BIS_fnc_param;
_type = [_this,2,"",[""]] call BIS_fnc_param;
_customBounty = [_this,3,-1,[0]] call BIS_fnc_param;
if(_uid == "" OR _type == "" OR _name == "") exitWith {}; //Bad data passed.

//What is the crime?
switch(_type) do
{
	//What is the crime?
switch(_type) do
{
	case "1": {_type = ["1",25000]};
    case "2": {_type = ["2",50000]};
    case "3": {_type = ["3",50000]};
    case "4": {_type = ["4",15000]};
    case "5": {_type = ["5",20000]};
    case "6": {_type = ["6",60000]};
	case "7": {_type = ["7",10000]};
	case "8": {_type = ["8",40000]};
	case "9": {_type = ["9",30000]};
	case "10": {_type = ["10",50000]};
	case "11": {_type = ["11",40000]};
	case "12": {_type = ["12",1500]};
	case "13": {_type = ["13",500]};
	case "14": {_type = ["14",50000]};
	case "15": {_type = ["15",2000]};
	case "16": {_type = ["16",5000]};
	case "17": {_type = ["17",5000]};
	case "18": {_type = ["18",500]};
	case "19": {_type = ["19",1000]};
	case "20": {_type = ["20",20000]};
	case "21": {_type = ["21",40000]};
	case "22": {_type = ["22",20000]};
	case "23": {_type = ["23",500000]};
	case "24": {_type = ["24",10000]};
	case "25": {_type = ["25",15000]};
	case "26": {_type = ["26",20000]};
	case "27": {_type = ["27",60000]};
	case "485": {_type = ["Intento de soltar esposas",2500]};
	case "486": {_type = ["Ayuda de por escape de esposas",5000]};


	default {_type = [];};
};
};

if(count _type == 0) exitWith {}; //Not our information being passed...
//Is there a custom bounty being sent? Set that as the pricing.
if(_customBounty != -1) then {_type set[1,_customBounty];};
//Search the wanted list to make sure they are not on it.

_result = format["SELECT wantedID, wantedCrimes FROM wanted WHERE wantedID='%1'",_uid];
waitUntil{!DB_Async_Active};
_queryResult = [_result,2] call DB_fnc_asyncCall;

_name = [_name] call DB_fnc_mresString;
_val = [(_type select 1)] call DB_fnc_numberSafe;

if(count _queryResult != 0) then
{
	_pastCrimes = [(_queryResult select 1)] call DB_fnc_mresToArray;
	_pastCrimes pushBack (_type select 0);
	_pastCrimes = [_pastCrimes] call DB_fnc_mresArray;
	_query = format["UPDATE wanted SET wantedCrimes = '%1', wantedBounty = wantedBounty + '%2', active = '1' WHERE wantedID='%3'",_pastCrimes,_val,_uid];
} else {
	_crimes = [[(_type select 0)]] call DB_fnc_mresArray;
	_query = format["INSERT INTO wanted (wantedID, wantedName, wantedCrimes, wantedBounty, active) VALUES('%1','%2','%3','%4', '1')",_uid,_name,_crimes,_val];
};

if(!isNil "_query") then {
	waitUntil{!DB_Async_Active};
	[_query,2] call DB_fnc_asyncCall;
};