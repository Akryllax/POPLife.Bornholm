/*
	File: fn_itemWeight.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Gets the items weight and returns it.
*/
private["_item"];
_item = [_this,0,"",[""]] call BIS_fnc_param;
if(_item == "") exitWith {};

switch (_item) do
{
	case "oilu": {7};
	case "oilp": {6};
	case "heroinu": {6};
	
	case "frogleg": {3};
	case "lsd": {4};

	case "heroinp": {4};
	case "cannabis": {4};
	case "marijuana": {3};
	case "ephedrine": {15};
	case "crystalmeth": {15};
	
	case "clam": {8};
	case "pearl": {8};

	case "apple": {1};
	case "cider": {1};
	case "water": {1};
	case "rabbit": {1};
	case "salema": {2};
	case "ornate": {2};
	case "mackerel": {4};
	case "tuna": {6};
	case "mullet": {4};
	case "catshark": {6};
	case "turtle": {6};
	case "fishing": {2};
	case "turtlesoup": {2};
	case "donuts": {1};
	case "wood": {5};
	case "woodp": {5};

	case "coffee": {1};
	case "fuelE": {2};
	case "fuelF": {5};
	case "money": {0};
	case "pickaxe": {2};
	case "copperore": {4};
	case "ironore": {5};
	case "copper_r": {3};
	case "iron_r": {3};
	case "sand": {3};
	case "salt": {3};
	case "salt_r": {1};
	case "glass": {1};
	case "diamond": {4};
	case "diamondc": {2};
	case "cocaine": {6};
	case "cocainep": {4};
	case "spikeStrip": {15};
	case "rock": {6};
	case "cement": {5};
	case "goldbar": {12};
	case "blastingcharge": {15};
	case "boltcutter": {5};
	case "defusekit": {2};
	case "storagesmall": {5};
	case "storagebig": {10};
	case "zipties": {2};
	case "beer": {2};
	case "whisky": {2};
	case "shandy": {2};

	//Ship Wreck Items
	case "roundobject": {3};
	case "squareobject":  {4};
	case "brokenstatue": {6};
	case "oldpottery": {4};
	case "stonetablet": {8};
	case "brokenbell": {4};
	case "emptybottle": {1};
	case "strangeobject": {6};
	case "rustediron": {6};
	case "foolsgold": {5};
	case "oldgoldbar": {8};
	case "excavator": {5};

	case "chicken": {2};
	case "goat": {4};
	case "sheep": {4};
	case "dog": {3};

	case "roadcone": {2};
	case "roadbarrier": {5};
	case "tapesign": {5};
	case "tapesignwarning": {5};
	case "tapesignsm": {5};
	case "portablebarrier": {10};
	case "arrowleft": {3};
	case "arrowright": {3};

	default {1};
};
