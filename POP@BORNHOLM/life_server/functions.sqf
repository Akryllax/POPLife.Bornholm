life_fnc_sidechat =
compileFinal "
	if(life_sidechat) then {life_sidechat = false;} else {life_sidechat = true;};
	[[player,life_sidechat,playerSide],""TON_fnc_managesc"",false,false] spawn life_fnc_MP;
	[] call life_fnc_settingsMenu;
";

publicVariable "life_fnc_sidechat";

TON_fnc_index =
compileFinal "
	private[""_item"",""_stack""];
	_item = _this select 0;
	_stack = _this select 1;
	_return = -1;

	{
		if(_item in _x) exitWith {
			_return = _forEachIndex;
		};
	} foreach _stack;

	_return;
";

TON_fnc_player_query =
compileFinal "
	private[""_ret""];
	_ret = _this select 0;
	if(isNull _ret) exitWith {};
	if(isNil ""_ret"") exitWith {};

	[[life_atmcash,life_cash,owner player,player],""life_fnc_admininfo"",_ret,false] spawn life_fnc_MP;
";
publicVariable "TON_fnc_player_query";

publicVariable "TON_fnc_index";

TON_fnc_clientWireTransfer =
compileFinal "
	private[""_unit"",""_val"",""_from""];
	_val = _this select 0;
	_from = _this select 1;
	if(!([str(_val)] call TON_fnc_isnumber)) exitWith {};
	if(_from == """") exitWith {};
	life_atmcash = life_atmcash + _val;
	hint format[""%1 te ha transferido $%2."",_from,[_val] call life_fnc_numberText];

";
publicVariable "TON_fnc_clientWireTransfer";

TON_fnc_isnumber =
compileFinal "
	private[""_valid"",""_value"",""_compare""];
	_value = _this select 0;
	_valid = [""0"",""1"",""2"",""3"",""4"",""5"",""6"",""7"",""8"",""9""];
	_array = [_value] call KRON_StrToArray;
	_return = true;

	{
		if(_x in _valid) then
		{}
		else
		{
			_return = false;
		};
	} foreach _array;
	_return;
";

publicVariable "TON_fnc_isnumber";

TON_fnc_clientGangKick =
compileFinal "
	private[""_unit"",""_group""];
	_unit = _this select 0;
	_group = _this select 1;
	if(isNil ""_unit"" OR isNil ""_group"") exitWith {};
	if(player == _unit && (group player) == _group) then
	{
		life_my_gang = ObjNull;
		[player] joinSilent (createGroup civilian);
		hint ""Te han echado de la banda."";

	};
";
publicVariable "TON_fnc_clientGangKick";

TON_fnc_clientGetKey =
compileFinal "
	private[""_vehicle"",""_unit"",""_giver""];
	_vehicle = _this select 0;
	_unit = _this select 1;
	_giver = _this select 2;
	if(isNil ""_unit"" OR isNil ""_giver"") exitWith {};
	if(player == _unit && !(_vehicle in life_vehicles)) then
	{
		_name = getText(configFile >> ""CfgVehicles"" >> (typeOf _vehicle) >> ""displayName"");
		hint format[""%1 te ha dado las llaves de %2"",_giver,_name];
		life_vehicles pushBack _vehicle;
		[[getPlayerUID player,playerSide,_vehicle,1],""TON_fnc_keyManagement"",false,false] spawn life_fnc_MP;
	};
";

publicVariable "TON_fnc_clientGetKey";

TON_fnc_clientGangLeader =
compileFinal "
	private[""_unit"",""_group""];
	_unit = _this select 0;
	_group = _this select 1;
	if(isNil ""_unit"" OR isNil ""_group"") exitWith {};
	if(player == _unit && (group player) == _group) then
	{
		player setRank ""COLONEL"";
		_group selectLeader _unit;
		hint ""Te han promocionado a lider."";
	};
";

publicVariable "TON_fnc_clientGangLeader";

//Cell Phone Messaging
/*
	-fnc_cell_textmsg
	-fnc_cell_textcop
	-fnc_cell_textadmin
	-fnc_cell_adminmsg
	-fnc_cell_adminmsgall
*/

//To EMS
TON_fnc_cell_emsrequest =
compileFinal "
private[""_msg"",""_to""];
	ctrlShow[3022,false];
	_msg = ctrlText 3003;
	_to = ""Emergencias"";
	if(_msg == """") exitWith {hint ""Tienes que escribir un mensaje!"";ctrlShow[3022,true];};

	[[_msg,name player,5],""TON_fnc_clientMessage"",independent,false] spawn life_fnc_MP;
	[] call life_fnc_cellphone;
	hint format[""Has mandado un mensaje a emergencias."",_to,_msg];
	ctrlShow[3022,true];
";
//To One Person
TON_fnc_cell_textmsg =
compileFinal "
	private[""_msg"",""_to""];
	ctrlShow[3015,false];
	_msg = ctrlText 3003;
	if(lbCurSel 3004 == -1) exitWith {hint ""Tienes que seleccionar el destinatario!""; ctrlShow[3015,true];};
	_to = call compile format[""%1"",(lbData[3004,(lbCurSel 3004)])];
	if(isNull _to) exitWith {ctrlShow[3015,true];};
	if(isNil ""_to"") exitWith {ctrlShow[3015,true];};
	if(_msg == """") exitWith {hint ""Tienes que escribir un mensaje!"";ctrlShow[3015,true];};

	[[_msg,name player,0],""TON_fnc_clientMessage"",_to,false] spawn life_fnc_MP;
	[] call life_fnc_cellphone;
	hint format[""Has mandado a %1 el mensaje: %2"",name _to,_msg];
	ctrlShow[3015,true];
";
//To All Cops
TON_fnc_cell_textcop =
compileFinal "
	private[""_msg"",""_to""];
	ctrlShow[3016,false];
	_msg = ctrlText 3003;
	_to = ""la Policia"";
	if(_msg == """") exitWith {hint ""Tienes que escribir un mensaje!"";ctrlShow[3016,true];};

	[[_msg,name player,1],""TON_fnc_clientMessage"",true,false] spawn life_fnc_MP;
	[] call life_fnc_cellphone;
	hint format[""Has mandado a %1 el mensaje: %2"",_to,_msg];
	ctrlShow[3016,true];
";
//To All Admins
TON_fnc_cell_textadmin =
compileFinal "
	private[""_msg"",""_to"",""_from""];
	ctrlShow[3017,false];
	_msg = ctrlText 3003;
	_to = ""los Administradores"";
	if(_msg == """") exitWith {hint ""Tienes que escribir un mensaje!"";ctrlShow[3017,true];};

	[[_msg,name player,2],""TON_fnc_clientMessage"",true,false] spawn life_fnc_MP;
	[] call life_fnc_cellphone;
	hint format[""Has mandado a %1 el mensaje: %2"",_to,_msg];
	ctrlShow[3017,true];
";
//Admin To One Person
TON_fnc_cell_adminmsg =
compileFinal "
	if(isServer) exitWith {};
	if((call life_adminlevel) < 1) exitWith {hint ""No eres admin!"";};
	private[""_msg"",""_to""];
	_msg = ctrlText 3003;
	_to = call compile format[""%1"",(lbData[3004,(lbCurSel 3004)])];
	if(isNull _to) exitWith {};
	if(_msg == """") exitWith {hint ""Tienes que escribir un mensaje!"";};

	[[_msg,name player,3],""TON_fnc_clientMessage"",_to,false] spawn life_fnc_MP;
	[] call life_fnc_cellphone;
	hint format[""Mensaje de admin para: %1 - Mensaje: %2"",name _to,_msg];
";

TON_fnc_cell_adminmsgall =
compileFinal "
	if(isServer) exitWith {};
	if((call life_adminlevel) < 1) exitWith {hint ""No eres admin!"";};
	private[""_msg"",""_from""];
	_msg = ctrlText 3003;
	if(_msg == """") exitWith {hint ""Tienes que escribir un mensaje!"";};

	[[_msg,name player,4],""TON_fnc_clientMessage"",true,false] spawn life_fnc_MP;
	[] call life_fnc_cellphone;
	hint format[""Mensaje de administrador: %1"",_msg];
";
//To Mercenaries
TON_fnc_cell_mercrequest =
compileFinal "
private[""_msg"",""_to""];
	ctrlShow[3023,false];
	_msg = ctrlText 3003;
	_to = ""Mercenarios"";
	if(_msg == """") exitWith {hint ""Tienes que escribir un mensaje!"";ctrlShow[3023,true];};

	[[_msg,name player,6],""TON_fnc_clientMessage"",east,false] spawn life_fnc_MP;
	[] call life_fnc_cellphone;
	hint format[""Has mandado un mensaje a los mercenarios."",_to,_msg];
	ctrlShow[3023,true];
";
//Cop To All
TON_fnc_cell_copmsgall =
compileFinal "
	if(isServer) exitWith {};
	if((call life_coplevel) < 1) exitWith {hint ""No eres policia!"";};
	private[""_msg"",""_from""];
	_msg = ctrlText 3003;
	if(_msg == """") exitWith {hint ""Debes introducir un mensaje!"";};
	[[_msg,name player,7],""TON_fnc_clientMessage"",true,false] spawn life_fnc_MP;
	[] call life_fnc_cellphone;
	hint format[""Mensaje de policias a todos: %1"",_msg];
";

publicVariable "TON_fnc_cell_textmsg";
publicVariable "TON_fnc_cell_textcop";
publicVariable "TON_fnc_cell_textadmin";
publicVariable "TON_fnc_cell_adminmsg";
publicVariable "TON_fnc_cell_adminmsgall";
publicVariable "TON_fnc_cell_emsrequest";
publicVariable "TON_fnc_cell_mercrequest";
publicVariable "TON_fnc_cell_copmsgall";
//Client Message
/*
	0 = private message
	1 = police message
	2 = message to admin
	3 = message from admin
	4 = admin message to all
*/
TON_fnc_clientMessage =
compileFinal "
	if(isServer) exitWith {};
	private[""_msg"",""_from"", ""_type""];
	_msg = _this select 0;
	_from = _this select 1;
	_type = _this select 2;
	if(_from == """") exitWith {};
	switch (_type) do
	{
		case 0 :
		{
			private[""_message""];
			_message = format[""*** Mensaje de %1: %2 ***"",_from,_msg];
			hint parseText format [""<t color='#FFCC00'><t size='2'><t align='center'>Nuevo mensaje<br/><br/><t color='#33CC33'><t align='left'><t size='1'>Para: <t color='#ffffff'>Ti<br/><t color='#33CC33'>De: <t color='#ffffff'>%1<br/><br/><t color='#33CC33'>Mensaje:<br/><t color='#ffffff'>%2"",_from,_msg];

			[""TextMessage"",[format[""Has recibido un mensaje privado de %1"",_from]]] call bis_fnc_showNotification;
			systemChat _message;
		};

		case 1 :
		{
			if(side player != west) exitWith {};
			private[""_message""];
			_message = format[""*** Llamada a policia de %1: %2 ***"",_from,_msg];
			hint parseText format [""<t color='#316dff'><t size='2'><t align='center'>Aviso para la polcia<br/><br/><t color='#33CC33'><t align='left'><t size='1'>Para: <t color='#ffffff'>La policia<br/><t color='#33CC33'>De: <t color='#ffffff'>%1<br/><br/><t color='#33CC33'>Mensaje:<br/><t color='#ffffff'>%2"",_from,_msg];

			[""PoliceDispatch"",[format[""Aviso a la policia de: %1"",_from]]] call bis_fnc_showNotification;
			systemChat _message;
		};

		case 2 :
		{
			if((call life_adminlevel) < 1) exitWith {};
			private[""_message""];
			_message = format[""*** Se requiere admin de parte de %1: %2 ***"",_from,_msg];
			hint parseText format [""<t color='#ffcefe'><t size='2'><t align='center'>Aviso para administradores<br/><br/><t color='#33CC33'><t align='left'><t size='1'>Para: <t color='#ffffff'>Admins<br/><t color='#33CC33'>De: <t color='#ffffff'>%1<br/><br/><t color='#33CC33'>Mensaje:<br/><t color='#ffffff'>%2"",_from,_msg];

			[""AdminDispatch"",[format[""%1 requiere un admin!"",_from]]] call bis_fnc_showNotification;
			systemChat _message;
		};

		case 3 :
		{
			private[""_message""];
			_message = format[""*** Mensaje de Admin: %1 ***"",_msg];
			_admin = format[""Mandado por admin: %1"", _from];
			hint parseText format [""<t color='#FF0000'><t size='2'><t align='center'>Mensaje de admin<br/><br/><t color='#33CC33'><t align='left'><t size='1'>Para: <t color='#ffffff'>Ti<br/><t color='#33CC33'>De: <t color='#ffffff'>Admin<br/><br/><t color='#33CC33'>Mensaje:<br/><t color='#ffffff'>%1"",_msg];

			[""AdminMessage"",[""Has recibido un mensaje de un admin!""]] call bis_fnc_showNotification;
			systemChat _message;
			if((call life_adminlevel) > 0) then {systemChat _admin;};
		};

		case 4 :
		{
			private[""_message"",""_admin""];
			_message = format[""*** Mensaje de Admin: %1 ***"",_msg];
			_admin = format[""Mandado por admin: %1"", _from];
			hint parseText format [""<t color='#FF0000'><t size='2'><t align='center'>Mensaje de admin<br/><br/><t color='#33CC33'><t align='left'><t size='1'>Para: <t color='#ffffff'>Jugadores<br/><t color='#33CC33'>De: <t color='#ffffff'>Admin<br/><br/><t color='#33CC33'>Mensaje:<br/><t color='#ffffff'>%1"",_msg];

			[""AdminMessage"",[""Has recibido un mensaje de un admin!""]] call bis_fnc_showNotification;
			systemChat _message;
			if((call life_adminlevel) > 0) then {systemChat _admin;};
		};

		case 5: {
			private[""_message""];
			_message = format[""*** Llamada a Emergencias: %1 ***"",_msg];
			hint parseText format [""<t color='#FFCC00'><t size='2'><t align='center'>Llamada a emergencias<br/><br/><t color='#33CC33'><t align='left'><t size='1'>Para: <t color='#ffffff'>Ti<br/><t color='#33CC33'>De: <t color='#ffffff'>%1<br/><br/><t color='#33CC33'>Mensaje:<br/><t color='#ffffff'>%2"",_from,_msg];

			[""TextMessage"",[format[""Llamada a emergencias de %1"",_from]]] call bis_fnc_showNotification;
		};

		case 6: {
			private[""_message""];
			_message = format[""*** Se solicitan mercenarios: %1 ***"",_msg];
			hint parseText format [""<t color='#FFCC00'><t size='2'><t align='center'>Solicitud de mercenarios<br/><br/><t color='#33CC33'><t align='left'><t size='1'>Para: <t color='#ffffff'>Ti<br/><t color='#33CC33'>De: <t color='#ffffff'>%1<br/><br/><t color='#33CC33'>Mensaje:<br/><t color='#ffffff'>%2"",_from,_msg];

			[""TextMessage"",[format[""Solicitud de mercenario de %1"",_from]]] call bis_fnc_showNotification;
		};

		case 7 : {
			private[""_message"",""_admin""];
			_message = format[""*** MENSAJE DE LA POLICIA ***: %1"",_msg];
			_admin = format[""Enviado por la policia: %1"", _from];
			hint parseText format [""<t color='#316dff'><t size='2'><t align='center'>Mensaje de la policia<br/><br/><t color='#33CC33'><t align='left'><t size='1'>A: <t color='#ffffff'>Todos<br/><t color='#33CC33'>De: <t color='#ffffff'>La Policia<br/><br/><t color='#33CC33'>Mensaje:<br/><t color='#ffffff'>%1"",_msg];

			[""AdminMessage"",[""Has recibido un mensaje de la policia!""]] call bis_fnc_showNotification;
			systemChat _message;
			if((call life_adminlevel) > 0) then {systemChat _admin;};
		};
	};
";
publicVariable "TON_fnc_clientMessage";
