/*
	casinoPlay.sqf
	
	Author: Alexander Montero
	Desc: Plays the slot machine, gives reward if necesary.
	Date: 16/10/2014
*/

/*
		--- FUNCTION DEFINITIONS ---
*/
	//Generates a random natural number between 0 and 6, both inclusive.
	FNC_generateRandomSymbol = compileFinal "_k = abs (floor (random 7)); _k";

	/*
		Simulates a slot machine. Generates a 3x3 Matrix with all the elements between 0 and 6 (inclusive),
		and looks for rows/diagonals with the same elements, and give rewards if they are found (acumulative).
		Rules:
			-No column shall have duplicated elements.
	*/
	FNC_casino_simulatePlay = 
	{
		private["_money"];
		_money = _this select 0;
		
		_result = 0;
		
		// Simulates a matrix
		_x00 = [] call FNC_generateRandomSymbol;
		_x01 = [] call FNC_generateRandomSymbol;
		_x02 = [] call FNC_generateRandomSymbol;
		_x10 = [] call FNC_generateRandomSymbol; // _x00 _x01 _x02
		_x11 = [] call FNC_generateRandomSymbol; // _x10 _x11 _x12
		_x12 = [] call FNC_generateRandomSymbol; // _x20 _x21 _x22
		_x20 = [] call FNC_generateRandomSymbol;
		_x21 = [] call FNC_generateRandomSymbol;
		_x22 = [] call FNC_generateRandomSymbol;
		
		if((_x00 == _x10) OR (_x10 == _x20) OR (_x00 == _x20)) then {
			while {((_x00 == _x10) OR (_x10 == _x20) OR (_x00 == _x20))} do {
				_x10 = [] call FNC_generateRandomSymbol;
				_x20 = [] call FNC_generateRandomSymbol;
			};
		};
		if((_x01 == _x11) OR (_x11 == _x21) OR (_x01 == _x21)) then {
			while {((_x01 == _x11) OR (_x11 == _x21) OR (_x01 == _x21))} do {
				_x11 = [] call FNC_generateRandomSymbol;
				_x21 = [] call FNC_generateRandomSymbol;
			};
		};
		if((_x02 == _x12) OR (_x12 == _x22) OR (_x02 == _x22)) then {
			while {((_x02 == _x12) OR (_x12 == _x22) OR (_x02 == _x22))} do {
				_x12 = [] call FNC_generateRandomSymbol;
				_x22 = [] call FNC_generateRandomSymbol;
			};
		};

		hint format["Te ha salido:\n-%1-%2-%3-\n-%4-%5-%6-\n-%7-%8-%9-", _x00, _x01, _x02, _x10, _x11, _x12, _x20, _x21, _x22];
		
		if((_x00 == _x01) AND (_x01 == _x02)) then {_result = _result + _money * 5 + _x00 * _money;};
		if((_x10 == _x11) AND (_x11 == _x12)) then {_result = _result + _money * 7 + _x10 * _money;};
		if((_x20 == _x21) AND (_x21 == _x22)) then {_result = _result + _money * 5 + _x20 * _money;};
		if((_x00 == _x11) AND (_x11 == _x22)) then {_result = _result + _money * 2.5 + _x00 * _money;};
		if((_x20 == _x11) AND (_x11 == _x02)) then {_result = _result + _money * 2.5 + _x20 * _money;};
		
		_result
	};

/*
		--- END OF FUNCTION DEFINITIONS ---
*/


disableSerialization;

_handle = uiNameSpace getVariable "Casino_dialog"; //Gets the slotMachine display.

_status = _handle displayCtrl 9952; //Status string handle.
_historyList = _handle displayCtrl 9451; //History Listbox handle.
_wallet = _handle displayCtrl 1155; //Handle to the wallet string

_button = _handle displayCtrl 1669; //Handle to the PLAY button.

_editBox = _handle displayCtrl 1390; //Handle to the EditBox for money quantity.
_value = parseNumber (ctrlText _editBox); //EditBox numeric value.

if(!isNil "_value") then { //Safety check, in case theres a parsing error.
		if(_value <= 0) then{
			hint "Valor no valido.";
		} else {
		if(life_cash - _value >= 0) then { //Checks we have enought money.
		
			intentos = intentos + 1;
			life_cash = life_cash - _value;
			
			_button ctrlEnable false;
			hint format["Apostando %1", _value];
			_status ctrlSetText "JUGANDO!";
			_status ctrlSetTextColor [0.7,0.7,0,1];

			_wallet ctrlSetText format["%1", life_cash];
			
			_winning = [_value] call FNC_casino_simulatePlay;
			
			sleep 2;
			
			if(_winning > 0) then {
				//WIN
				hint format["Has ganado %1€!!!!", _winning];
				[_handle, 2] execVM "core\casino\slotFXWin.sqf";

				_historyList lbAdd format["#%1 - Jugado %2: GANADO %3", intentos, _value, _winning];
				_historyList lbSetCurSel (lbSize _historyList);
				
				_status ctrlSetText "PREMIO!";
				_status ctrlSetTextColor [0,1,0,1];
				life_cash = life_cash + _winning;
				_wallet ctrlSetText format["%1", life_cash];			
			} else {
				//LOST
				hint "Has perdido.\n ¡Suerte la proxima vez!";
				[_handle, 2] execVM "core\casino\slotFXLoss.sqf";
				
				_historyList lbAdd format["#%1 - Jugado %2: PERDIDO", intentos, _value];
				_historyList lbSetCurSel (lbSize _historyList);
				
				_status ctrlSetText "PERDIDO";
				_status ctrlSetTextColor [1,0.2,0.2,1];		
			}
		} else {
			hint "No tienes suficiente dinero :(";
		}
	};
} else {
	_status ctrlSetText "Fallo...";
	hint "Ha habido un error. Contacte con un administrador y digale: 'ERROR EN EL PARSER'. Gracias :)";
};

sleep 1.5;

_button ctrlEnable true;
_status ctrlSetTextColor [1,1,1,1];
_status ctrlSetText "Esperando...";