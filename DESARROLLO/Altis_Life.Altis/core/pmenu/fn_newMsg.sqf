#include <macro.h>
/*
	
	file: fn_newMsg.sqf
	Author: Silex
	
*/

private["_to","_type","_playerData","_msg"];
disableSerialization;

_type = [_this,0,-1] call BIS_fnc_param;
_playerData = [_this,1,-1] call BIS_fnc_param;
_msg = [_this,2,"",[""]] call BIS_fnc_param;

_display = findDisplay 88888;
_cPlayerList = _display displayCtrl 88881;
_cMessageEdit = _display displayCtrl 88884;

switch(_type) do
{
	case 0:
	{
		life_smartphoneTarget = call compile format["%1",_playerData];
		ctrlSetText[88886, format["Mensaje para: %1",name life_smartphoneTarget]];
		if((__GETC__(life_adminlevel) < 1)) then
		{
			ctrlShow[888897,false];
		};
	};
	//normal message
	case 1:
	{
		if(isNUll life_smartphoneTarget) exitWith {hint format["Tienes que seleccionar el destinatario!"];};
		ctrlShow[88885, false];
		if(_msg == "") exitWith {hint "Tienes que escribir un mensaje!";ctrlShow[88885, true];};
		[[life_smartphoneTarget,_msg,player,0],"GHB_fnc_handleMessages",false] spawn life_fnc_MP;
		[[life_smartphoneTarget,_msg,player,0],"TON_fnc_handleMessages",false] spawn life_fnc_MP;
		hint format["Has mandado a %1 el mensaje: %2",name life_smartphoneTarget,_msg];	
		ctrlShow[88885, true];
		closeDialog 88883;
	};
	//copmessage
	case 2:
	{
		if(({side _x == west} count playableUnits) == 0) exitWith {hint format["No hay policias conectados."];};
		ctrlShow[888895,false];
		if(_msg == "") exitWith {hint "Tienes que escribir un mensaje!";ctrlShow[888895,true];};
		[[ObjNull,_msg,player,1],"GHB_fnc_handleMessages",false] spawn life_fnc_MP;
		[[ObjNull,_msg,player,1],"TON_fnc_handleMessages",false] spawn life_fnc_MP;
		_to = "la Policia";
		hint format["Has mandado a %1 el mensaje: %2",_to,_msg];
		ctrlShow[888895,true];
		closeDialog 887890;
	};
	//msgadmin
	case 3:
	{
		ctrlShow[888896,false];
		if(_msg == "") exitWith {hint "Tienes que escribir un mensaje!";ctrlShow[888896,true];};
		[[ObjNull,_msg,player,2],"GHB_fnc_handleMessages",false] spawn life_fnc_MP;
		[[ObjNull,_msg,player,2],"TON_fnc_handleMessages",false] spawn life_fnc_MP;
		_to = "los Administradores";
		hint format["Has mandado a %1 el mensaje: %2",_to,_msg];
		ctrlShow[888896,true];
		closeDialog 887890;
	};
	//emsrequest
	case 4:
	{
		if(({side _x == independent} count playableUnits) == 0) exitWith {hint format["No hay medicos conectados."];};
		ctrlShow[888899,false];
		if(_msg == "") exitWith {hint "Tienes que escribir un mensaje!";ctrlShow[888899,true];};
		[[ObjNull,_msg,player,3],"GHB_fnc_handleMessages",false] spawn life_fnc_MP;
		[[ObjNull,_msg,player,3],"TON_fnc_handleMessages",false] spawn life_fnc_MP;
		hint format["Has mandado un mensaje a emergencias.",_msg];
		ctrlShow[888899,true];
		closeDialog 887890;
	};
	//adminToPerson
	case 5:
	{
		if((call life_adminlevel) < 1) exitWith {hint "No eres admin!";};
		if(isNULL life_smartphoneTarget) exitWith {hint format["Tienes que seleccionar el destinatario!"];};
		if(_msg == "") exitWith {hint "Tienes que escribir un mensaje!";};
		[[life_smartphoneTarget,_msg,player,4],"GHB_fnc_handleMessages",false] spawn life_fnc_MP;
		[[life_smartphoneTarget,_msg,player,4],"TON_fnc_handleMessages",false] spawn life_fnc_MP;
		hint format["Mensaje del admin para: %1 - Mensaje: %2",name life_smartphoneTarget,_msg];
		closeDialog 88883;
	};
	//emergencyloading
	case 6:
	{
		if((__GETC__(life_adminlevel) < 1)) then
		{
			ctrlShow[888898,false];
			ctrlShow[888896,true];
		} else {
			ctrlShow[888898,true];
			ctrlShow[888896,false];
		};
	};
	//adminMsgAll
	case 7:
	{
		if((call life_adminlevel) < 1) exitWith {hint "No eres admin!";};
		if(_msg == "") exitWith {hint "Tienes que escribir un mensaje!";};
		[[ObjNull,_msg,player,5],"GHB_fnc_handleMessages",false] spawn life_fnc_MP;
		[[ObjNull,_msg,player,5],"TON_fnc_handleMessages",false] spawn life_fnc_MP;
		hint format["Mensaje de administrador para todos: %1",_msg];
		closeDialog 887890;
	};
	//to mercenaries
	case 8:
	{
		if(({side _x == east} count playableUnits) == 0) exitWith {hint format["No hay mercenarios conectados."];};
		ctrlShow[888895,false];
		if(_msg == "") exitWith {hint "Tienes que escribir un mensaje!";ctrlShow[888895,true];};
		[[ObjNull,_msg,player,6],"GHB_fnc_handleMessages",false] spawn life_fnc_MP;
		[[ObjNull,_msg,player,6],"TON_fnc_handleMessages",false] spawn life_fnc_MP;
		_to = "Mercenarios";
		hint format["Has mandado a %1 el mensaje: %2",_to,_msg];
		ctrlShow[888895,true];
		closeDialog 887890;
	};
	//copMsgAll
	case 9:
	{
		if((call life_coplevel) < 1) exitWith {hint "No eres Poli!";};
		if(_msg == "") exitWith {hint "Debe introducir un mensaje para enviar!";};
		[[ObjNull,_msg,player,7],"GHB_fnc_handleMessages",false] spawn life_fnc_MP;
		[[ObjNull,_msg,player,7],"TON_fnc_handleMessages",false] spawn life_fnc_MP;
		hint format["Policia mensaje a TODOS: %1",_msg];
		closeDialog 887890;
	};
	
};