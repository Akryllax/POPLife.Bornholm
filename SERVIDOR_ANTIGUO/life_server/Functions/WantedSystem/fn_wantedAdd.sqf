/*
	File: fn_wantedAdd.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Adds or appends a unit to the wanted list.
*/
private["_uid","_type","_index","_data","_crimes","_val","_customBounty","_name"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
_name = [_this,1,"",[""]] call BIS_fnc_param;
_type = [_this,2,"",[""]] call BIS_fnc_param;
_customBounty = [_this,3,-1,[0]] call BIS_fnc_param;
if(_uid == "" OR _type == "" OR _name == "") exitWith {}; //Bad data passed.

//What is the crime?
switch(_type) do
{
	case "187V": {_type = ["Atropello",25000]};
	case "187": {_type = ["Asesinato",50000]};
	case "901": {_type = ["Fuga",50000]};
	case "261": {_type = ["Violacion",150000]}; //What type of sick bastard would add this?
	case "261A": {_type = ["Intento de violacion",50000]};
	case "215": {_type = ["Intento de robar coche",25000]};
	case "213": {_type = ["Uso ilegal de explosivos",60000]};
	case "211": {_type = ["Robo",25000]};
	case "207": {_type = ["Secuestro",40000]};
	case "207A": {_type = ["Intento de secuestro",25000]};
	case "487": {_type = ["Gran robo",60000]};
	case "488": {_type = ["Hurto",15000]};
	case "480": {_type = ["Atropello y fuga",60000]};
	case "481": {_type = ["Posesion de droga",30000]};
	case "482": {_type = ["Distribucion",25000]};
	case "483": {_type = ["Trafico de drogas",50000]};
	case "459": {_type = ["Asalto",50000]};
    case "1": {_type = ["Conducir sin licencia",10000]};
    case "2": {_type = ["Intento de robo",15000]};
    case "3": {_type = ["Intento de robo vehiculo",25000]};
    case "4": {_type = ["Conducir sin luces",350]};
    case "5": {_type = ["Exceso de velocidad",3500]};
    case "6": {_type = ["Conducir de forma peligrosa",10000]};
    case "7": {_type = ["Intento de robo vehículo de la Policía",50000]};
    case "8": {_type = ["Robo de vehículos de la policía",65000]};
    case "9": {_type = ["Aterrizaje en una zona de exclusión aérea",50000]};
    case "10": {_type = ["Conducir vehículos ilegales",100000]};
    case "11": {_type = ["Atropello",25000]};
    case "12": {_type = ["Huir de la policía",30000]};
    case "13": {_type = ["Überfahren eines anderen Spielers",25000]};
    case "14": {_type = ["Posesion de estupefacientes",30000]};
    case "15": {_type = ["Desorden civil",15000]};
    case "16": {_type = ["Nicht befolgen e.pol.Anordnung",5000]};
    case "17": {_type = ["Insultar a la policia",25000]};
    case "18": {_type = ["Acoso a un policia",30000]};
    case "19": {_type = ["Entrar en zona restringida",15000]};
    case "20": {_type = ["Asesinato de un policía",50000]};
    case "21": {_type = ["Asalto a la propiedad",25000]};
    case "22": {_type = ["La destrucción de la propiedad de la policía",25000]};
    case "23": {_type = ["Traficar drogas",50000]};
    case "24": {_type = ["Posesión de armas legales de fuego sin licencia",25000]};
    case "25": {_type = ["OpenCarry de armas",5000]};
    case "26": {_type = ["Posesión de un arma prohibida",25000]};
    case "27": {_type = ["Portar armas dentro de la ciudad",5000]};
    case "28": {_type = ["Tomar rehenes",30000]};
    case "29": {_type = ["Ataque a personas / vehículos",25000]};
    case "30": {_type = ["Robo de un banco",100000]};
    case "31": {_type = ["Asesinato",50000]};
    case "32": {_type = ["Levantamiento",35000]};
    case "33": {_type = ["Ataque rebelde",50000]};
    case "34": {_type = ["Ataque/asedio prolongado de ciudades principales",100000]};
    case "35": {_type = ["Aterrizar en zona restringida",50000]};
    case "36": {_type = ["Volar por debajo de 150m sobre Kavala",50000]};
    case "37": {_type = ["Escapar de la prisión",50000]};
    case "38": {_type = ["Volar sin licencia",20000]};
    case "39": {_type = ["ENEMIGO PUBLICO",500000]};
    case "40": {_type = ["Comercio de especies protegidas",25000]};
	default {_type = [];};
};

if(count _type == 0) exitWith {}; //Not our information being passed...
//Is there a custom bounty being sent? Set that as the pricing.
if(_customBounty != -1) then {_type set[1,_customBounty];};
//Search the wanted list to make sure they are not on it.
_index = [_uid,life_wanted_list] call TON_fnc_index;

if(_index != -1) then
{
    _data = life_wanted_list select _index;
    _crimes = _data select 2;
    _crimes pushBack (_type select 0);
    _val = _data select 3;
    life_wanted_list set[_index,[_name,_uid,_crimes,(_type select 1) + _val]];
    [[_name,_uid,_crimes,(_type select 1) + _val],_uid] spawn TON_fnc_saveBounties;
}
    else
{
    life_wanted_list pushBack [_name,_uid,[(_type select 0)],(_type select 1)];
    [[_name,_uid,[(_type select 0)],(_type select 1)],_uid] spawn TON_fnc_saveBounties;
};