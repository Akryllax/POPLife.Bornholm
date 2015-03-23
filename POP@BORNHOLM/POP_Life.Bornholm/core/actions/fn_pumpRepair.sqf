/*
	File: fn_pumpRepair.sqf

	Description:
	Quick simple action that is only temp.
*/
private["_method"];
if(pop_dinero < 500) then
{
	if(pop_banco < 500) exitWith {_method = 0;};
	_method = 2;
}
	else
{
	_method = 1;
};

switch (_method) do
{
	case 0: {hint "You do not have $500 in cash or in your bank accoumt."};
	case 1: {vehicle player setDamage 0; pop_dinero = pop_dinero - 500; hint "You have repaired your vehicle for $500";};
	case 2: {vehicle player setDamage 0; pop_banco = pop_banco - 500; hint "You have repaired your vehicle for $500";};
};