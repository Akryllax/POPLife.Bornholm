/*
	Author: Bryan "Tonic" Boardwine

	Description:
	A short function for telling the player to add a vehicle to his keychain.
*/
private["_vehicle"];
_vehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(!(_vehicle in life_vehicles)) then
{
	life_vehicles pushBack _vehicle;
};
if _vehicle == "C_SUV_O1_F" then {
_vehicle setCenterOfMass [-0.010813,0.206166,-0.557481];
};