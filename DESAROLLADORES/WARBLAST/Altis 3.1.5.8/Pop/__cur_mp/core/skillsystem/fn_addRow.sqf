#include <macro.h>
/*
	File: fn_addRow.sqf
	Author: Ciaran Langton
	
	Desc:
	Adds to the dialog with the parent and indentation done. ----ALTISLIFE.CO.UK ONLY----
*/
disableSerialization;
_list = [_this,0,controlNull,[controlNull]] call BIS_fnc_param;
_parent = [_this,1,0,[0]] call BIS_fnc_param;
_depth = [_this,2,0,[0]] call BIS_fnc_param;

{
	_skill = _x;
	//If it is the correct side, and it is the right parent then go!
	if((str(playerSide) == _skill select 1 || _skill select 1 == "ALL") && _skill select 3 == _parent) then {
		_skillID = _skill select 0;
		_labelText = _skill select 2;

		//Loop through and figure out our amount of indentation
		for "_b" from 0 to _depth do {
			_labelText = format["-%1",_labelText];
		};

		_list lbAdd _labelText;
		_list lbSetData [(lbSize _list)-1,str(_skillID)];

		if(_skillID in (life_skills select 0)) then {
			//This is in their possession
			_list lbSetColor[(lbSize _list)-1,[0,1,0,0.5]];
		};
		_script = [_list,_skillID, (_depth + 1)] spawn life_fnc_addRow;
		waitUntil {scriptDone _script};
	};
} forEach (call life_skillCfg);