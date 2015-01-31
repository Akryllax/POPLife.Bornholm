/*
	casinoInit.sqf
	
	Author: Alexander Montero
	Desc: Initializes the slot machine.
	Date: 16/10/2014

*/
disableSerialization;

intentos = 0;
casino_firstSpawn = uiNameSpace getVariable "casinoReady";

waitUntil{createDialog "Casino_dialog"};

sleep 1;

_handle = findDisplay 9451;
_wallet = _handle displayCtrl 1155;
_wallet ctrlSetText format["%1", life_cash];

if(isNil "casino_firstSpawn") then {
	//Constructor (Only called once)
};