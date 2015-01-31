/*
	File: fn_raceConf.sqf
	Author: Akryllax
	Desc:
*/

private["_trackID"];

_trackID = [_this, 0, "", [""]] call BIS_fnc_param;

_ret = switch (_trackID) do {
	
	case "race_01": {
		[
				   0,	//modo
			   80000,	//precio
		 [150000,15],   //1er premio / tiempo
  		  [85000,18],   //2o  premio / tiempo
		  [50000,23]    //3er premio / tiempo
		]
	};
	default {
		[]
	};
};

_ret