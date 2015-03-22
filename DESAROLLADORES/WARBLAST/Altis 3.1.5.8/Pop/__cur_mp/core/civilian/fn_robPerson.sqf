/*
	File: fn_robPerson.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Getting tired of adding descriptions...
*/
private["_robber"];
_robber = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _robber) exitWith {}; //No one to return it to?

if(ALUK_wonga > 0) then
{
	[[ALUK_wonga],"life_fnc_rbRecv",_robber,false] spawn life_fnc_MP; //NDJ - altered name of func to reduce hack calls
	[[getPlayerUID _robber,_robber getVariable["realname",name _robber],"211"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
	
	[[1,format[localize "STR_NOTF_Robbed",_robber getVariable["realname",name _robber],profileName,[ALUK_wonga] call life_fnc_numberText]],"life_fnc_broadcast",nil,false] spawn life_fnc_MP;


	[[player,_robber,ALUK_wonga, "robtaken"],"TON_fnc_MoneyRecord",false,false] spawn life_fnc_MP; //log to server NDJ 11Apr14
	ALUK_wonga = 0;
}
	else
{
	[[2,format[localize "STR_NOTF_RobFail",profileName]],"life_fnc_broadcast",_robber,false] spawn life_fnc_MP;
};