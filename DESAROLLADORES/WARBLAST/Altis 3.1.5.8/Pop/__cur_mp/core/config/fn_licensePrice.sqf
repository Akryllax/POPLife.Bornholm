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
	case "driver": {5000}; //Drivers License cost                            			//NDJ was case "driver": {500}; //Drivers License cost
	case "boat": {10000}; //Boating license cost                             			//NDJ was case "boat": {1000}; //Boating license cost
	case "pilot": {20000}; //Pilot/air license cost                          			//NDJ was case "pilot": {25000}; //Pilot/air license cost
	case "gun": {50000}; //Firearm/gun license cost                          			//NDJ was case "gun": {10000}; //Firearm/gun license cost
	case "dive": {2500}; //Diving license cost                               			//NDJ was case "dive": {2000}; //Diving license cost
	case "oil": {25000}; //Oil processing license cost                       			//NDJ was case "oil": {10000}; //Oil processing license cost
	case "cair": {50000}; //Cop Pilot License cost                           			//NDJ was case "cair": {15000}; //Cop Pilot License cost
	case "swat": {50000}; //Swat License cost                                			//NDJ was case "swat": {35000}; //Swat License cost
	case "cg": {20000}; //Coast guard license cost                           			//NDJ was case "cg": {8000}; //Coast guard license cost
	case "heroin": {100000}; //Heroin processing license cost                			//NDJ was case "heroin": {25000}; //Heroin processing license cost
	case "marijuana": {25000}; //Marijuana processing license cost           			//NDJ was case "marijuana": {19500}; //Marijuana processing license cost
	case "medmarijuana": {25000}; //Medical Marijuana processing license cost			//NDJ was case "medmarijuana": {1500}; //Medical Marijuana processing license cost
	case "gang": {1000}; //Gang license cost                                 			//NDJ was case "gang": {10000}; //Gang license cost
	case "rebel": {500000}; //Rebel license cost                             			//NDJ was case "rebel": {75000}; //Rebel license cost  
	case "rebrun": {5000}; //Rebel license repurchase cost                   			//NDJ new item
	case "truck": {20000}; //Truck license cost                              			//NDJ was case "truck": {20000}; //Truck license cost
	case "diamond": {70000};                                                 			//NDJ was case "diamond": {35000};
	case "salt": {20000};                                                    			//NDJ was case "salt": {12000};
	case "cocaine": {100000};                                                			//NDJ was case "cocaine": {30000};
	case "sand": {10000};                                                    			//NDJ was case "sand": {14500};
	case "iron": {50000};                                                    			//NDJ was case "iron": {9500};
	case "copper": {10000};                                                  			//NDJ was case "copper": {8000};
	case "cement": {10000};                                                  			//NDJ was case "cement": {6500};
	case "mair": {15000};
	case "home": {75000};
	case "bounty": {2000000};
	case "meth": {150000};
	case "taxi": {1000000};
	case "arac": {1000000};
};