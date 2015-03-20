/*
	File: fn_dropItems.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Called on death, player drops any 'virtual' items they may be carrying.
*/
private["_obj","_unit","_item","_value"];
_unit = _this select 0;

{
	_item = _x;
	_value = missionNamespace getVariable _item;
	
	switch(_item) do
	{
		case "life_inv_water":
		{
			if(_value > 0) then
			{
				_var = [_item,1] call life_fnc_varHandle;
				_pos = _unit modelToWorld[0,3,0];
				_pos = [_pos select 0, _pos select 1, 0];
//				_obj = "Land_BottlePlastic_V1_F" createVehicle _pos; //NDJ 20May14 deprecated createVehicle mode - use createVehicle array
				_obj = createVehicle ["Land_BottlePlastic_V1_F", _pos, [], 0, "NONE"];  
				//_obj setVariable["water",_value,true];
//				[[_obj],"life_fnc_simDisable",nil,true] spawn life_fnc_MP; //NDJ Jun14 - stopped using this because suitcases weren't pick-uppable anymore!
				_obj setPos _pos;
				_obj setVariable["item",[_var,_value],true];
				missionNamespace setVariable[_x,0];
			};
		};
		
		case "life_inv_tbacon":
		{
			if(_value > 0) then
			{
				_var = [_item,1] call life_fnc_varHandle;
				_pos = _unit modelToWorld[0,3,0];
				_pos = [_pos select 0, _pos select 1, 0];
//				_obj = "Land_TacticalBacon_F" createVehicle _pos; //NDJ 20May14 deprecated createVehicle mode - use createVehicle array
				_obj = createVehicle ["Land_TacticalBacon_F", _pos, [], 0, "NONE"];  
//				[[_obj],"life_fnc_simDisable",nil,true] spawn life_fnc_MP; //NDJ Jun14 - stopped using this because suitcases weren't pick-uppable anymore!
				_obj setPos _pos;
				_obj setVariable["item",[_var,_value],true];
				missionNamespace setVariable[_x,0];
			};
		};
		
		case "life_inv_redgull":
		{
			if(_value > 0) then
			{
				_var = [_item,1] call life_fnc_varHandle;
				_pos = _unit modelToWorld[0,3,0];
				_pos = [_pos select 0, _pos select 1, 0];
//				_obj = "Land_Can_V3_F" createVehicle _pos; //NDJ 20May14 deprecated createVehicle mode - use createVehicle array
				_obj = createVehicle ["Land_Can_V3_F", _pos, [], 0, "NONE"];  
//				[[_obj],"life_fnc_simDisable",nil,true] spawn life_fnc_MP; //NDJ Jun14 - stopped using this because suitcases weren't pick-uppable anymore!
				_obj setPos _pos;
				_obj setVariable["item",[_var,_value],true];
				missionNamespace setVariable[_x,0];
			};
		};
		
		case "life_inv_fuelE":
		{
			if(_value > 0) then
			{
				_var = [_item,1] call life_fnc_varHandle;
				_pos = _unit modelToWorld[0,3,0];
				_pos = [_pos select 0, _pos select 1, 0];
//				_obj = "Land_CanisterFuel_F" createVehicle _pos; //NDJ 20May14 deprecated createVehicle mode - use createVehicle array
				_obj = createVehicle ["Land_CanisterFuel_F", _pos, [], 0, "NONE"];  
//				[[_obj],"life_fnc_simDisable",nil,true] spawn life_fnc_MP; //NDJ Jun14 - stopped using this because suitcases weren't pick-uppable anymore!
				_obj setPos _pos;
				_obj setVariable["item",[_var,_value],true];
				missionNamespace setVariable[_x,0];
			};
		};
		
		case "life_inv_fuelF":
		{
			if(_value > 0) then
			{
				_var = [_item,1] call life_fnc_varHandle;
				_pos = _unit modelToWorld[0,3,0];
				_pos = [_pos select 0, _pos select 1, 0];
//				_obj = "Land_CanisterFuel_F" createVehicle _pos; //NDJ 20May14 deprecated createVehicle mode - use createVehicle array
				_obj = createVehicle ["Land_CanisterFuel_F", _pos, [], 0, "NONE"];  
//				[[_obj],"life_fnc_simDisable",nil,true] spawn life_fnc_MP; //NDJ Jun14 - stopped using this because suitcases weren't pick-uppable anymore!
				_obj setPos _pos;
				_obj setVariable["item",[_var,_value],true];
				missionNamespace setVariable[_x,0];
			};
		};
		
		case "life_inv_coffee":
		{
			if (_value > 0) then
			{
				_var = [_item,1] call life_fnc_varHandle;
				_pos = _unit modelToWorld[0,3,0];
				_pos = [_pos select 0, _pos select 1, 0];
//				_obj = "Land_Can_V3_F" createVehicle _pos; //NDJ 20May14 deprecated createVehicle mode - use createVehicle array
				_obj = createVehicle ["Land_Can_V3_F", _pos, [], 0, "NONE"];  
//				[[_obj],"life_fnc_simDisable",nil,true] spawn life_fnc_MP; //NDJ Jun14 - stopped using this because suitcases weren't pick-uppable anymore!
				_obj setPos _pos;
				_obj setVariable["item",[_var,_value],true];
				missionNamespace setVariable[_x,0];
			};
		};
		
		case "ALUK_wonga":
		{
			if(ALUK_wonga > 0) then
			{
				_pos = _unit modelToWorld[0,3,0];
				_pos = [_pos select 0, _pos select 1, 0];
//				_obj = "Land_Money_F" createVehicle _pos; //NDJ 20May14 deprecated createVehicle mode - use createVehicle array
				_obj = createVehicle ["Land_Money_F", _pos, [], 0, "NONE"];  
				_obj setVariable["item",["money",_value],true];
				_obj setPos _pos;
//				[[_obj],"life_fnc_simDisable",nil,true] spawn life_fnc_MP; //NDJ Jun14 - stopped using this because suitcases weren't pick-uppable anymore!
				missionNamespace setVariable[_x,0];
			};
		};
		
		default
		{
			if(_value > 0) then
			{
				_var = [_item,1] call life_fnc_varHandle;
				_pos = _unit modelToWorld[0,3,0];
				_pos = [_pos select 0, _pos select 1, 0];
//				_obj = "Land_Suitcase_F" createVehicle _pos; //NDJ 20May14 deprecated createVehicle mode - use createVehicle array
				_obj = createVehicle ["Land_Suitcase_F", _pos, [], 0, "NONE"];  
//				[[_obj],"life_fnc_simDisable",nil,true] spawn life_fnc_MP; //NDJ Jun14 - stopped using this because suitcases weren't pick-uppable anymore!
				_obj setPos _pos;
				_obj setVariable["item",[_var,_value],true];
				missionNamespace setVariable[_x,0];
			};
		};
	};
} foreach (life_inv_items + ["ALUK_wonga"]);