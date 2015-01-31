/*
	File: fn_licensePrice.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Returns the license price.
*/
private["_type"];
_type = [_this,0,"",[""]] call BIS_fnc_param;
if(_type == "") exitWith {-1};

switch (_type) do
{
	case "driver": {500}; //Drivers License cost
	case "boat": {1000}; //Boating license cost
	case "pilot": {100000}; //Pilot/air license cost
	case "plane": {3500000};
	case "gun": {20000}; //Firearm/gun license cost
	case "dive": {15000}; //Diving license cost
	case "oil": {50000}; //Oil processing license cost
	case "cair": {15000}; //Cop Pilot License cost
	case "swat": {35000}; //Swat License cost
	case "cg": {8000}; //Coast guard license cost
	case "heroin": {100000}; //Heroin processing license cost
	case "marijuana": {50000}; //Marijuana processing license cost
	case "medmarijuana": {1500}; //Medical Marijuana processing license cost
	case "gang": {10000}; //Gang license cost
	case "rebel": {2000000}; //Rebel license cost
	case "truck": {20000}; //Truck license cost
	case "diamond": {35000};
	case "salt": {12000};
	case "cocaine": {150000}; //Licencia de cocaina
	case "sand": {35000};
	case "iron": {35000};
	case "copper": {35000};
	case "tortuga": {50000}; //Licencia para procesar las tortugas y conseguir carne de tortuga
	case "pelar": {100000}; //Licencia para sacar la piel a las tortugas
	case "cement": {35000};
	case "mair": {15000};
	case "home": {1000000};
	case "zumos": {100000}; //Licencia para hacer zumo de biofrutas
	case "fusion": {150000}; //Licencia para enriquecer Uranio
	case "licenciauranio": {150000}; //Licencia para hacer barras de uranio
	case "licenciabomba": {1000000}; //Licencia para fabricar la bomba nuclear
	case "bountyh": {500000}; //Licencia caza recompensas
	case "limpiarp": {50000}; //Limpiar pescado
	case "enlatarp": {50000}; //Enlatar pescado
	case "enlatara": {50000}; //Enlatar atun
	
};