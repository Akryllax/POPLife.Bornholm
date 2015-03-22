/*
	File: fn_changeFPS.sqf
	Author: Ciaran Langton
	
	Description:
	Updates the grass and other settings.
*/
if(life_lowFPS) then {
	setTerrainGrid 50;
} else {
	setTerrainGrid 25;
};