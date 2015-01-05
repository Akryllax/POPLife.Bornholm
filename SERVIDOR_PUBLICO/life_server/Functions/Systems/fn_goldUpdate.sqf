/*
	File: fn_federalUpdate.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Uhhh, adds to it?
*/
private["_goldB"];

[] spawn
{
	while {true} do
	{
		try{
			_goldB = gold_safe getVariable["safe",0];
			gold_safe setVariable["safe",round(_goldB+round(random 100)),true]; //Adds a random number of gold ever hour or 2 hours.
			_goldB = reserve2_vault getVariable["safe",0];
			reserve2_vault setVariable["safe",round(_goldB+round(random 100)),true]; //Adds a random number of gold ever hour or 2 hours.
			sleep (30 * 270);
		} catch {};
	};
};