
[] execVM "WarBlast\IgiLoad\IgiLoadInit.sqf";

[] execVM "WarBlast\fpsFix\vehicleManager.sqf";

[] execVM "WarBlast\zlt_fastrope.sqf";

//[] execVM "WarBlast\weather\DynamicWeatherEffects.sqf";

//[] execVM "WarBlast\module_cleanup\init.sqf";

[
		4*60, // seconds to delete dead bodies (0 means don't delete)
		3*60, // seconds to delete dead vehicles (0 means don't delete)
		0,// seconds to delete immobile vehicles (0 means don't delete)
		1*60, // seconds to delete dropped weapons (0 means don't delete)
		10*60, // seconds to deleted planted explosives (0 means don't delete)
		0 // seconds to delete dropped smokes/chemlights (0 means don't delete)
] execVM "WarBlast\repetitive_cleanup.sqf";