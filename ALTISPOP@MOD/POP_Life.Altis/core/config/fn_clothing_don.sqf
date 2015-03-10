#include <macro.h>
/*
        File: fn_clothing_cop.sqf
        Author: Bryan "Tonic" Boardwine

        Description:
        Master config file for Cop clothing store.
*/
private ["_filter", "_ret"];
_filter = [_this, 0, 0, [0]] call BIS_fnc_param;
// Classname, Custom Display name (use nil for Cfg->DisplayName, price

// Shop Title Name
ctrlSetText [3103, "DonDonDingDon"];

_ret = [];
switch (_filter) do {
	// Uniforms
	case 0: {
		_ret =
			[]
		;
	};

	// Hats
	case 1: {
		if (__GETC__(life_donator) > 1) then
			{
				_ret pushBack ["kio_vfv_mask", nil, 15000],
				_ret pushBack ["Kio_Capital_Hat", nil, 15000],
				_ret pushBack ["casco_moto", nil, 15000],
				_ret pushBack ["H_Orel_Mask_Dead", nil, 15000],
				_ret pushBack ["H_Orel_FireFighter", nil, 15000],
				_ret pushBack ["H_Orel_FireFighter_Gaz", nil, 15000],
				_ret pushBack ["Kio_No1_Hat", nil, 15000],
				_ret pushBack ["Kio_Pirate_Hat", nil, 15000],
				_ret pushBack ["Kio_Santa_Hat", nil, 15000],
				_ret pushBack ["H_Soccer_Orange", nil, 15000],
				_ret pushBack ["Kio_Spinning_Hat", nil, 15000],
				_ret pushBack ["H_Spliff", nil, 15000],
				_ret pushBack ["H_Orel_Swat", nil, 15000],
				_ret pushBack ["Kio_Hat", nil, 15000],
			};
	};

	// Glasses
	case 2: {
		_ret =
			[]
		;
	};

	// Vest
	case 3: {};

	// Backpacks
	case 4: {
		_ret =
			[]

		;
	};
	};

_ret;