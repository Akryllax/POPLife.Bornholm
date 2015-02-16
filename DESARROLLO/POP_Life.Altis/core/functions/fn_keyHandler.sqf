#include <macro.h>
#include <Keycodes.h>
/*
	File: fn_keyHandler.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Main key handler for event 'keyDown'
*/
private ["_handled","_shift","_alt","_code","_ctrl","_alt","_ctrlKey","_veh","_locked","_interactionKey","_mapKey","_interruptionKeys"];
_ctrl = _this select 0;
_code = _this select 1;
_shift = _this select 2;
_ctrlKey = _this select 3;
_alt = _this select 4;
_speed = speed cursorTarget;
_handled = false;

_interactionKey = if(count (actionKeys "User10") == 0) then {219} else {(actionKeys "User10") select 0};
_mapKey = actionKeys "ShowMap" select 0;
//hint str _code;
_interruptionKeys = [17,30,31,32]; //A,S,W,D
_tiempo = serverTime;

//Vault handling...
if((_code in (actionKeys "GetOver") || _code in (actionKeys "salute")) && {(player getVariable ["restrained",false])}) exitWith {
	true;
};

if(life_action_inUse) exitWith {
	if(!life_interrupted && _code in _interruptionKeys) then {life_interrupted = true;};
	_handled;
};

//Hotfix for Interaction key not being able to be bound on some operation systems.
if(count (actionKeys "User10") != 0 && {(inputAction "User10" > 0)}) exitWith {
	//Interaction key (default is Left Windows, can be mapped via Controls -> Custom -> User Action 10)
	if(!life_action_inUse) then {
		[] spawn
		{
			private["_handle"];
			_handle = [] spawn life_fnc_actionKeyHandler;
			waitUntil {scriptDone _handle};
			life_action_inUse = false;
		};
	};
	true;
};

switch (_code) do
{



	//Map Key
	case _mapKey:
	{
		switch (playerSide) do
		{
			case west: {if(!visibleMap) then {[] spawn life_fnc_copMarkers;}};
			case independent: {if(!visibleMap) then {[] spawn life_fnc_medicMarkers;}};
			case civilian: {if(!visibleMap) then {[] spawn War_fnc_civMarkers;}};
			case opfor: {if(!visibleMap) then {[] spawn War_fnc_mercMarkers;}};
		};
	};

	//Holster / recall weapon.
	case DIK_H:
	{
		if(_shift && !_ctrlKey && currentWeapon player != "") then {
			life_curWep_h = currentWeapon player;
			player action ["SwitchWeapon", player, player, 100];
			player switchcamera cameraView;
		};

		if(!_shift && _ctrlKey && !isNil "life_curWep_h" && {(life_curWep_h != "")}) then {
			if(life_curWep_h in [primaryWeapon player,secondaryWeapon player,handgunWeapon player]) then {
				player selectWeapon life_curWep_h;
			};
		};
	};

	//Interaction key (default is Left Windows, can be mapped via Controls -> Custom -> User Action 10)
	case _interactionKey:
	{
		if(!life_action_inUse) then {
			[] spawn
			{
				private["_handle"];
				_handle = [] spawn life_fnc_actionKeyHandler;
				waitUntil {scriptDone _handle};
				life_action_inUse = false;
			};
		};
	};

  // O, abrelatas
    case DIK_O:
	{
		if (!_shift && !_alt && !_ctrlKey  && (vehicle player != player)) then {
			[] call War_fnc_abrelatas;
		};
	};
	//Restraining (Shift + R)
	case DIK_R:
    {
        if(_shift) then {_handled = true;};
        switch (playerSide) do
        {
            case west:
            {
            if(_shift && !(player getVariable["restrained",false]) && !isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && (side cursorTarget in [civilian,independent,opfor]) && alive cursorTarget && cursorTarget distance player < 3.5 && !(cursorTarget getVariable "Escorting") && !(cursorTarget getVariable "restrained") && !life_knockout&& speed cursorTarget < 1) then
                    {
                        [] call life_fnc_restrainAction;
                        systemChat localize "STR_NOTF_RestrainedPerson";

                    };
            };
            case civilian:
            {
            if(_shift && !(player getVariable["restrained",false]) && !isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && (side cursorTarget in [west,civilian,independent,opfor]) && alive cursorTarget && cursorTarget distance player < 3.5 && !(cursorTarget getVariable "Escorting") && !(cursorTarget getVariable "restrained") && !life_knockout&& speed cursorTarget < 1) then
                {
                    if([false,"esposas",1] call life_fnc_handleInv) then
                    {
                        [] call life_fnc_restrainAction;
                        life_inv_esposas = life_inv_esposas - 1;
                        systemChat localize "STR_NOTF_RestrainedPerson";
                    }else{
                        systemChat localize "STR_NOTF_NoHandcuffs";
                    };
                };
            };
            case east:
            {
            if(_shift && !(player getVariable["restrained",false]) && !isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && (side cursorTarget in [west,civilian,independent,opfor]) && alive cursorTarget && cursorTarget distance player < 3.5 && !(cursorTarget getVariable "Escorting") && !(cursorTarget getVariable "restrained") && !life_knockout&& speed cursorTarget < 1) then
                 {
                   if([false,"esposas",1] call life_fnc_handleInv) then
                   	{
                   	[] call life_fnc_restrainAction;
                   	life_inv_esposas = life_inv_esposas - 1;
                   	systemChat localize "STR_NOTF_RestrainedPerson";
                   }else{
                   systemChat localize "STR_NOTF_NoHandcuffs";
                   };
                };
            };
        };
    };


	//Knock out, this is experimental and yeah...
    case DIK_G:
	{
		if(_shift) then {_handled = true;};
	    switch (playerSide) do
	    {
	    case civilian:
	    {
		if(_shift && playerSide == civilian && !isNull cursorTarget && cursorTarget isKindOf "Man" && isPlayer cursorTarget && alive cursorTarget && cursorTarget distance player < 4 && speed cursorTarget < 1) then
		    {
			if((animationState cursorTarget) != "Incapacitated" && (currentWeapon player == primaryWeapon player OR currentWeapon player == handgunWeapon player) && currentWeapon player != "" && !life_knockout && !(player getVariable["restrained",false]) && !life_istazed) then
			   {
				[cursorTarget] spawn life_fnc_knockoutAction;
			   };
		    };
	    };
	    case west:
        {
		if(_shift && playerSide == west && !isNull cursorTarget && cursorTarget isKindOf "Man" && isPlayer cursorTarget && alive cursorTarget && cursorTarget distance player < 4 && speed cursorTarget < 1) then
		    {
			if((animationState cursorTarget) != "Incapacitated" && (currentWeapon player == primaryWeapon player OR currentWeapon player == handgunWeapon player) && currentWeapon player != "" && !life_knockout && !(player getVariable["restrained",false]) && !life_istazed) then
			   {
				[cursorTarget] spawn life_fnc_knockoutAction;
			   };
		    };
	    };
	    case opfor:
        {
		if(_shift && playerSide == opfor && !isNull cursorTarget && cursorTarget isKindOf "Man" && isPlayer cursorTarget && alive cursorTarget && cursorTarget distance player < 4 && speed cursorTarget < 1) then
		    {
			if((animationState cursorTarget) != "Incapacitated" && (currentWeapon player == primaryWeapon player OR currentWeapon player == handgunWeapon player) && currentWeapon player != "" && !life_knockout && !(player getVariable["restrained",false]) && !life_istazed) then
			   {
				[cursorTarget] spawn life_fnc_knockoutAction;
			   };
		    };
	    };
	};
 };

	//T Key (Trunk)
	case DIK_T:
	{
		if(!_alt && !_ctrlKey) then
		{
			if(vehicle player != player && alive vehicle player) then
			{
				if((vehicle player) in life_vehicles) then
				{
					[vehicle player] call life_fnc_openInventory;
				};
			}
				else
			{
				if((cursorTarget isKindOf "Car" OR cursorTarget isKindOf "Air" OR cursorTarget isKindOf "Ship" OR cursorTarget isKindOf "House_F") && player distance cursorTarget < 7 && vehicle player == player && alive cursorTarget) then
				{
					if(cursorTarget in life_vehicles OR {!(cursorTarget getVariable ["locked",true])}) then
					{
						[cursorTarget] call life_fnc_openInventory;
					};
				};
			};
		};
	};
	//L Key?
	case DIK_L:
	{
		//If cop run checks for turning lights on.
		if(_shift && playerSide in [west,independent]) then {
			if(vehicle player != player && (typeOf vehicle player) in ["C_Offroad_01_F","B_MRAP_01_F","C_SUV_01_F","C_Hatchback_01_sport_F","C_Hatchback_01_F","B_Heli_Light_01_F","B_Heli_Transport_01_F","I_Heli_light_03_unarmed_F","I_MRAP_03_hmg_F","I_MRAP_03_F","B_MRAP_01_hmg_F","B_MRAP_01_F"]) then {
				if(!isNil {vehicle player getVariable "lights"}) then {
					if(playerSide == west) then {
						[vehicle player] call life_fnc_sirenLights;
					} else {
						[vehicle player] call life_fnc_medicSirenLights;
					};
					_handled = true;
				};
			};
		};
		if(!_alt && !_ctrlKey) then { [] call life_fnc_radar; };
	};
	//Y Player Menu
	case DIK_Y:
	{
		if(!_alt && !_ctrlKey && !dialog) then
		{
			[] call life_fnc_p_openMenu;
		};
	};

	//F Key
	case DIK_F:
	{
		if(playerSide in [west,independent] && vehicle player != player && !life_siren_active && ((driver vehicle player) == player)) then
		{
			[] spawn
			{
				life_siren_active = true;
				sleep 11;
				life_siren_active = false;
			};
			_veh = vehicle player;
			if(isNil {_veh getVariable "siren"}) then {_veh setVariable["siren",false,true];};
			if((_veh getVariable "siren")) then
			{
				titleText [localize "STR_MISC_SirensOFF","PLAIN"];
				_veh setVariable["siren",false,true];
			}
				else
			{
				titleText [localize "STR_MISC_SirensON","PLAIN"];
				_veh setVariable["siren",true,true];
				if(playerSide == west) then {
					[[_veh],"life_fnc_copSiren",nil,true] spawn life_fnc_MP;
				} else {
					//I do not have a custom sound for this and I really don't want to go digging for one, when you have a sound uncomment this and change medicSiren.sqf in the medical folder.
					[[_veh],"life_fnc_medicSiren",nil,true] spawn life_fnc_MP;
				};
			};
		};
	};
	//U Key
	case DIK_U:
	{
		if(!_alt && !_ctrlKey) then {
			if(vehicle player == player) then {
				_veh = cursorTarget;
			} else {
				_veh = vehicle player;
			};

			if(_veh isKindOf "House_F" && playerSide == civilian) then {
				if(_veh in life_vehicles && player distance _veh < 8) then {
					_door = [_veh] call life_fnc_nearestDoor;
					if(_door == 0) exitWith {hint localize "STR_House_Door_NotNear"};
					_locked = _veh getVariable [format["bis_disabled_Door_%1",_door],0];
					if(_locked == 0) then {
						_veh setVariable[format["bis_disabled_Door_%1",_door],1,true];
						_veh animate [format["door_%1_rot",_door],0];
						systemChat localize "STR_House_Door_Lock";
					} else {
						_veh setVariable[format["bis_disabled_Door_%1",_door],0,true];
						_veh animate [format["door_%1_rot",_door],1];
						systemChat localize "STR_House_Door_Unlock";
					};
				};
			} else {
				_locked = locked _veh;
				if(_veh in life_vehicles && player distance _veh < 8) then {
					if(_locked == 2) then {
						if(local _veh) then {
							_veh lock 0;
						} else {
							[[_veh,0],"life_fnc_lockVehicle",_veh,false] spawn life_fnc_MP;
						};
						systemChat localize "STR_MISC_VehUnlock";
					} else {
						if(local _veh) then {
							_veh lock 2;
						} else {
							[[_veh,2],"life_fnc_lockVehicle",_veh,false] spawn life_fnc_MP;
						};
						systemChat localize "STR_MISC_VehLock";
					};
				};
			};
		};
	};
	//rendirse shift + 3
	case DIK_3:
	{
		if(_shift) then {_handled = true;};

		if (_shift) then
		{
			if (vehicle player == player && !(player getVariable ["restrained", false]) && (animationState player) != "Incapacitated" && !life_istazed) then
			{
				if (player getVariable ["surrender", false]) then
				{
					player setVariable ["surrender", false, true];
				} else
				{
					[] spawn life_fnc_surrender;
				};
			};
		};
	};

        //ANTI ALT + F4
        case DIK_F4:
        {
                if(_alt && !_shift) then {
                        life_atmcash = life_atmcash - (life_atmcash * 0.15);
                        _player setDamage 1;
                        [[3,format["AVISO DE ALTF4: %1 ha usado ALT+F4 para desconectarse.",_player getVariable["realname",name _player]]],"life_fnc_broadcast",nil,false] spawn life_fnc_MP;
                        [[1,format["AVISO DEL SERVIDOR: %1 ha usado ALT+F4 para desconectarse. Reportalo a un administrador.",_player getVariable["realname",name _player]]],"life_fnc_broadcast",nil,false] spawn life_fnc_MP;
                        [[0,format["AVISO DEL SERVIDOR: %1 ha usado ALT+F4 para desconectarse. Reportalo a un administrador.",_player getVariable["realname",name _player]]],"life_fnc_broadcast",nil,false] spawn life_fnc_MP;
                        [] call SOCK_fnc_updateRequest;
                };
        };

        // ANTI CTRL + ALT + DEL
        case DIK_DELETE:
        {
                if(_ctrlKey && _alt)  then {
                	    life_atmcash = life_atmcash - (life_atmcash * 0.15);
                        [[3,format["AVISO DE CTRLALTSUPR: %1 ha usado CTRL+ALT+SUPR para desconectarse.",_player getVariable["realname",name _player]]],"life_fnc_broadcast",nil,false] spawn life_fnc_MP;
                        [[1,format["AVISO DEL SERVIDOR: %1 ha usado CTRL+ALT+SUPR para desconectarse. Reportalo a un administrador.",_player getVariable["realname",name _player]]],"life_fnc_broadcast",nil,false] spawn life_fnc_MP;
                        [[0,format["AVISO DEL SERVIDOR: %1 ha usado CTRL+ALT+SUPR para desconectarse. Reportalo a un administrador.",_player getVariable["realname",name _player]]],"life_fnc_broadcast",nil,false] spawn life_fnc_MP;
                        [] call SOCK_fnc_updateRequest;
                };
        };

        // ANTI CTRL + ESC
        case DIK_ESCAPE:
        {
                if( _ctrlKey )  then
                {
                life_atmcash = life_atmcash - (life_atmcash * 0.15);
                [[3,format["AVISO DE ALTF4: %1 ha usado ALT+F4 para desconectarse.",_player getVariable["realname",name _player]]],"life_fnc_broadcast",nil,false] spawn life_fnc_MP;
                [[1,format["AVISO DEL SERVIDOR: %1 ha usado ALT+F4 para desconectarse. Reportalo a un administrador.",_player getVariable["realname",name _player]]],"life_fnc_broadcast",nil,false] spawn life_fnc_MP;
                [[0,format["AVISO DEL SERVIDOR: %1 ha usado ALT+F4 para desconectarse. Reportalo a un administrador.",_player getVariable["realname",name _player]]],"life_fnc_broadcast",nil,false] spawn life_fnc_MP;
                [] call SOCK_fnc_updateRequest;
                };
        };
        // Tabulando
        case DIK_TAB:
        {
        if(_alt) then {
        	diag_log format ["SERVIDOR POPLIFE: %1 usando ALT+TABULADOR SOSPECHOSO....",(_tiempo),player getVariable["realname",name player]];
        };
    };

	case DIK_F1:// F1 - TAPONES
	{

		if (soundVolume == 0.05) then {
			0.05 fadeSound 1;
			hint "Te has quitado los tapones";
		} else {
			0.05 fadeSound 0.05;
			hint "Te has puesto los tapones";
		};
	};

	case DIK_F1: // F1
	{
		if(__GETC__(life_adminlevel) < 1) exitWith {
			hint "Desactivado";
			closeDialog 0;
		};
		_handled = false;
	};

	case DIK_F2: // F2
	{
		if(__GETC__(life_adminlevel) < 1) exitWith {
			hint "Desactivado";
			closeDialog 0;
		};
		if(__GETC__(life_adminlevel) >= 4) then {
			[] call life_fnc_adminDebugCon;
		};
		_handled = false;
	};
	case DIK_F3:
	{
		if (vehicle player == player) then {
			[] call ROS_fnc_fiesta;
		};
	};

	case DIK_F5: // F5
	{
		if(__GETC__(life_adminlevel) < 1) exitWith {
			hint "Desactivado";
			closeDialog 0;
		};
		_handled = false;
	};

	case DIK_F6: //F6 key
	{
		if(__GETC__(life_adminlevel) < 1) exitWith {
			hint "Desactivado";
			closeDialog 0;
		};
		_handled = false;
	};

	case DIK_F7: // F7 Key
	{
		if(__GETC__(life_adminlevel) < 1) exitWith {
			hint "Desactivado";
			closeDialog 0;
		};
		_handled = false;
	};

	case DIK_F8: //F8 key
	{
		if(__GETC__(life_adminlevel) < 1) exitWith {
			hint "Desactivado";
			closeDialog 0;
		};
		_handled = false;
	};

	case DIK_F9: //F9 key
	{
		if(__GETC__(life_adminlevel) < 1) exitWith {
			hint "Desactivado";
			closeDialog 0;
		};
		_handled = false;
	};

	case DIK_F10: //10 key
	{
		if(__GETC__(life_adminlevel) < 1) exitWith {
			hint "Desactivado";
			closeDialog 0;
		};
		_handled = false;
	};

	case DIK_F11: //DELETE key
	{
		if(__GETC__(life_adminlevel) < 1) exitWith {
			hint "Desactivado";
			closeDialog 0;
		};
		_handled = false;
	};
};

_handled;