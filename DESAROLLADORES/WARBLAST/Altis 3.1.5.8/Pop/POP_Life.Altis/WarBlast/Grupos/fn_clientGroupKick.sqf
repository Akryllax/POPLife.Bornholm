private["_unit","_group"];
_unit = _this select 0;
_group = _this select 1;
if(isNil "_unit" OR isNil "_group") exitWith {};
if(player == _unit && (group player) == _group) then
{
	life_my_group = ObjNull;
	[player] joinSilent (createGroup civilian);
	hint "Has sido expulsado del grupo.";

	if (count life_gangData > 0) then
	{
		[] spawn life_fnc_initGang;
	hint "Has sido expulsado del grupo. Volveras a tu banda en unos segundos.";
	}
};