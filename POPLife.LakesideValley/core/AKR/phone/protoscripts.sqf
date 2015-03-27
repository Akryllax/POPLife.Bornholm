/*
	Statuses: 
		0 - Empty/Aviable
		1 - In standby
		2 - Calling
		3 - In call
		4 - Reserved
		
	P2P Vars:
		phoneRequesting : Waits until server response.
		celltowerResponse:
		   -1 - Denied.
			0 - No response.
		    1 - Accepted.
		celltowerData:
			[
				accepted: true/false
				line: Integer.
			]
 */
#define EMPTY 0
#define STANDBY 1
#define CALLING 2
#define INCALL 3
#define RESERVED 4

phoneRequesting = false;
phoneStatus = 0;
phoneLine = 0;
celltowerData = [];
celltowerResponse = 0;

EMPTY = 0;
STANDBY = 1;
CALLING = 2;
INCALL = 3;
RESERVED = 4;
CALLING_DENIED = 5;
CALLING_ACCEPTED = 6;
CALLING_ENDED = 7;

CELLTOWER_DENIED = -1;
CELLTOWER_WAIT = 0;
CELLTOWER_ACCEPT = 1;

PHONE_OFFLINE = -1;
PHONE_WAITING = 0;
PHONE_CALLREADY = 1;
PHONE_CALLING = 2;
PHONE_ESTABLISHED = 3;
PHONE_RINGING = 4;


AKR_fnc_getCallStatus = {
	_index = [_this, 0, -1, [0]] call BIS_fnc_param;
	_status = -1;
	
	if(_index < 1 ) exitWith { -1 };
	
	{
		if((_x select 1) isEqualTo _index) then {
			_status = (_x select 2) select 2;
		};
	} forEach AKR_fnc_phoneLines;
	
	_status
};

AKR_fnc_setCallStatus = {
	_index = [_this, 0, -1, [0]] call BIS_fnc_param;
	_param = [_this, 1, 0, [0]] call BIS_fnc_param;
	
	if(_index < 1 ) exitWith { objNull };
	
	{
		if((_x select 1) == _index) then {
			_phoneLineData = (_x);
			_metadata = (_phoneLineData select 2);
			
			_metadata set[2, _param];
			_phoneLineData set [2, _metadata];
			AKR_fnc_phoneLines set[_forEachIndex, _phoneLineData];
		};
	} forEach AKR_fnc_phoneLines;
	
	publicVariable "AKR_fnc_phoneLines";
};

AKR_fnc_getCaller = {
	_index = [_this, 0, -1, [0]] call BIS_fnc_param;
	_caller = objNull;
	
	if(_index < 1 ) exitWith { objNull };
	
	{
		if((_x select 1) isEqualTo _index) then {
			_caller = (_x select 2) select 0;
		};
	} forEach AKR_fnc_phoneLines;
	
	_caller
};

AKR_fnc_setCaller = {
	_index = [_this, 0, -1, [0]] call BIS_fnc_param;
	_param = [_this, 1, objNull, [objNull]] call BIS_fnc_param;
	
	if(_index < 1 ) exitWith { objNull };
	
	{
		if((_x select 1) == _index) then {
			_phoneLineData = (_x);
			_metadata = (_phoneLineData select 2);
			
			_metadata set[0, _param];
			_phoneLineData set [2, _metadata];
			AKR_fnc_phoneLines set[_forEachIndex, _phoneLineData];
		};
	} forEach AKR_fnc_phoneLines;
	
	publicVariable "AKR_fnc_phoneLines";
	
	_param
};

AKR_fnc_getDestiny = {
	_index = [_this, 0, -1, [0]] call BIS_fnc_param;
	_destiny = objNull;

	if(_index < 1 ) exitWith { objNull };
	
	{
		if((_x select 1) isEqualTo _index) then {
			_destiny = (_x select 2) select 1;
			getDestinyVar = _destiny;
		};
	} forEach AKR_fnc_phoneLines;
	
	_destiny
};

AKR_fnc_setDestiny = {
	_index = [_this, 0, -1, [0]] call BIS_fnc_param;
	_param = [_this, 1, objNull, [objNull]] call BIS_fnc_param;
	
	if(_index < 1 ) exitWith { objNull };
	
	{
		if((_x select 1) == _index) then {
			_phoneLineData = (_x);
			_metadata = (_phoneLineData select 2);
			
			_metadata set[1, _param];
			_phoneLineData set [2, _metadata];
			AKR_fnc_phoneLines set[_forEachIndex, _phoneLineData];
		};
	} forEach AKR_fnc_phoneLines;
	
	publicVariable "AKR_fnc_phoneLines";
	
	_param
};

AKR_fnc_setMetadata = {
	_index = [_this, 0, -1, [0]] call BIS_fnc_param;
	_param1 = [_this, 1, objNull, [objNull]] call BIS_fnc_param;
	_param2 = [_this, 2, objNull, [objNull]] call BIS_fnc_param;
	_param3 = [_this, 3, 0, [0]] call BIS_fnc_param;
	
	if(_index < 1 ) exitWith { nil };
	
	{
		if((_x select 1) == _index) then {
			_phoneLineData = (_x);
			_metadata = (_phoneLineData select 2);
			
			_metadata set[0, _param1];
			_metadata set[1, _param2];
			_metadata set[2, _param3];
			_phoneLineData set [2, _metadata];
			AKR_fnc_phoneLines set[_forEachIndex, _phoneLineData];
		};
	} forEach AKR_fnc_phoneLines;
	
	publicVariable "AKR_fnc_phoneLines";
	
	nil
};

AKR_fnc_requestPhoneline = {
	_caller = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
	_index = -1;
		
	{
		if(([_forEachIndex] call AKR_fnc_getCallStatus) == EMPTY) exitWith {
			_res = _forEachIndex;
			[_res, STANDBY] call AKR_fnc_setCallStatus;
			[_res, _caller] call AKR_fnc_setCaller;
			
			_index = _res;
			_res
		};
	} forEach (AKR_fnc_phoneLines);
	
	_index
};

AKR_fnc_callTo = {
	_this spawn {
		_caller = player;
		_dest = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
		_line = [_this, 1, 0,[0]] call BIS_fnc_param;
		
		KHCaller = _caller;
		KHLine = _line;

		phoneStatus = PHONE_CALLING;
		[phoneLine, _dest] call AKR_fnc_setDestiny;
		[phoneLine, CALLING] call AKR_fnc_setCallStatus;
		phoneLine radioChannelAdd [player];
		[[_caller, phoneLine], "AKR_fnc_notifyCall", _dest] call BIS_fnc_MP;
		[] spawn {
			_timeStamp = time;
			waitUntil {_timeStamp + 30 < time || (phoneStatus != PHONE_CALLING)};
			if(_timeStamp + 30 < time || (phoneStatus == PHONE_CALLING)) then {
				[] call AKR_fnc_endCall;
			};
		};
		while {[phoneLine] call AKR_fnc_getCallStatus == CALLING} do {
			playSound ["PhoneCalling", true];
			sleep 4.036;
		};

		if([phoneLine] call AKR_fnc_getCallStatus == INCALL) then {
			phoneStatus = PHONE_ESTABLISHED;
			waitUntil {([phoneLine] call AKR_fnc_getCallStatus != INCALL)};
		};

		[] call AKR_fnc_endCall;
		KHCaller = objNull;
		KHLine = 0;
	};
};

AKR_fnc_notifyCall = {
	_this spawn {
		
		_clr = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
		_pLine = [_this, 1, 0, [0]] call BIS_fnc_param;
		
		KHCaller = _clr;
		KHLine = _pLine;
		
		if(phoneStatus == PHONE_WAITING) then {
			phoneStatus = PHONE_RINGING;
			
			phoneLine = _pLine;
			
			while {[phoneLine] call AKR_fnc_getCallStatus == CALLING} do {
				playSound ["PhoneRingtone1", true];
				sleep 2.364;
			};
			
			if ([phoneLine] call AKR_fnc_getCallStatus != CALLING_ACCEPTED) then {
				phoneStatus = PHONE_WAITING;
			} else {
				phoneStatus = PHONE_ESTABLISHED;
				phoneLine = _pLine;
				phoneLine radioChannelAdd [player];
				
				waitUntil {([phoneLine] call AKR_fnc_getCallStatus != INCALL)};
				
				[] call AKR_fnc_endCall;
			};
			
		} else {
			[_pLine, CALLING_DENIED] call AKR_fnc_setCallStatus;
		};
		
		KHCaller = objNull;
		KHLine = 0;
	};
};

AKR_fnc_acceptCall = {

	_clr = KHCaller;
	_pLine = KHLine;
	
	if(phoneStatus == PHONE_RINGING) then {
	
		hint "Estas intentando coger la llamada";
		
		phoneStatus = PHONE_ESTABLISHED;
		phoneLine = KHLine;
		phoneLine radioChannelAdd [player];
		[phoneLine, INCALL] call AKR_fnc_setCallStatus;
		[phoneLine, player] call AKR_fnc_setDestiny;
	} else {
		hint "Tu telefono no esta sonando";
	};
};

AKR_fnc_hangCall = {
	phoneLine radioChannelRemove [player];
	
	_temp = [phoneLine] call AKR_fnc_getCaller;
	[[], "AKR_fnc_endCall", _temp] call BIS_fnc_MP;
	if(_temp != player) then {
		playSound ["PhoneEndCall", true];
	};
};

AKR_fnc_requestConnectionClient = {

	if(phoneStatus != PHONE_WAITING) exitWith { hint "Telefono en uso"};

	_this spawn {
		_caller = player;
		_callTarget = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
		
		if(isNull _callTarget) exitWith { hint """_calTarget"" is null"};

		celltowerResponse = CELLTOWER_WAIT;
		phoneRequesting = true;
		phoneStatus = PHONE_CALLING;
		phoneLine = 0;
		[[_caller], "AKR_fnc_requestConnectionServer", false] call BIS_fnc_MP;
		waitUntil {!phoneRequesting};
		
		switch (celltowerResponse) do {
			case CELLTOWER_DENIED: {
				playSound ["PhoneNoLine", true];
				sleep 5;
				[] call AKR_fnc_endCall;
			};
			case CELLTOWER_WAIT: {
				[[], "AKR_callDenied", _caller] call BIS_fnc_MP;
				phoneStatus = PHONE_WAITING;
			};
			case CELLTOWER_ACCEPT: {
				[_callTarget, phoneLine] call AKR_fnc_callTo;
			};
		};
		
		celltowerResponse = CELLTOWER_WAIT;
	};
};

AKR_fnc_requestConnectionServer = {
	_requester = [_this, 0, objNull, [objNull]] call BIS_fnc_param;

	_indexer = [] call AKR_fnc_requestPhoneline;

	if(_indexer > 0) exitWith {
		diag_log "REQUEST SUCCEDED :)";
		
		[_indexer, STANDBY] call AKR_fnc_setCallStatus;
		[_requester, "celltowerResponse", CELLTOWER_ACCEPT] call AKR_setVariableRemote;
		[_requester, "phoneRequesting", false] call AKR_setVariableRemote;
		[_requester, "phoneLine", _indexer] call AKR_setVariableRemote;
		
		[_indexer, _requester] call AKR_fnc_setCaller;
	};

	diag_log "REQUEST FAILED :(";
	[_requester, "celltowerResponse", CELLTOWER_DENIED] call AKR_setVariableRemote;
	[_requester, "phoneRequesting", false] call AKR_setVariableRemote;
	[_requester, "phoneLine", -1] call AKR_setVariableRemote;
};

AKR_fnc_getVariableRemote = {
	varPackAKR = nil;
	_callback = [_this, 2, "", [""]] call BIS_fnc_param;
	
	if(count _callback > 0) then {
		missionNamespace setVariable [_callback, nil];
	};
	
	_this spawn {
		_target = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
		_varName = [_this, 1, "", [""]] call BIS_fnc_param;
		_callback = [_this, 2, "", [""]] call BIS_fnc_param;
		
		[[_varName, player, _callback], "AKR_fnc_getVariableLocal", owner _target] call BIS_fnc_MP;
	};
	
	nil
};

AKR_fnc_getVariableLocal = {
	_varName = [_this, 0, "", [""]] call BIS_fnc_param;
	_caller = [_this, 1, objNull, [objNull]] call BIS_fnc_param;
	_callback = [_this, 2, _varName, [""]] call BIS_fnc_param;
	if(count _callback == 0) then {
		_callback = _varName;
	};
	
	[_caller, _callback, missionNamespace getVariable _varName] call AKR_setVariableRemote;
};

AKR_setVariableRemote = {
	_target = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
	_varName = [_this, 1, "", [""]] call BIS_fnc_param;
	_varData = _this select 2;
	
	[[_varName, _varData], "AKR_setVariableLocal", owner _target] call BIS_fnc_MP;
};


AKR_setVariableLocal = {
	_varName = [_this, 0, "", [""]] call BIS_fnc_param;
	_varData = _this select 1;
	
	missionNamespace setVariable [_varName, _varData];
};

AKR_fnc_endCall = {
	if(phoneStatus in [PHONE_CALLING, PHONE_CALLREADY, PHONE_ESTABLISHED]) then {
		[phoneLine] call AKR_fnc_resetLine;
		phoneRequesting = false;
		phoneStatus = PHONE_WAITING;
		phoneLine = 0;
		phoneLine radioChannelRemove [player];
		playSound ["PhoneEndCall", true];
	};
};

AKR_fnc_stopCalling = {
	phoneStatus = PHONE_WAITING;
};

AKR_callDenied = {
	playSound ["PhoneDenied", true];
};

AKR_fnc_resetLine = {
	_this spawn {
		_pLine = [_this, 0, 0, [0]] call BIS_fnc_param;
		
		_pLine radioChannelRemove playableUnits;
		[_pLine, objNull, objNull, 0] call AKR_fnc_setMetadata;
	};
};

AKR_fnc_isDestinyPlayer = {
	_pLine = [_this, 0, 0, [0]] call BIS_fnc_MP;
	
	_dest = [] call AKR_fnc_getDestiny;
	if(typeName _dest != "OBJECT") exitWith {false};
	_res = if(!isNull _dest) then [{isPlayer _dest},{false}];
	_res
};

AKR_fnc_isCallerPlayer = {
	_pLine = [_this, 0, 0, [0]] call BIS_fnc_MP;
	
	_clr = [] call AKR_fnc_getCaller;
	if(typeName _clr != "OBJECT") exitWith {false};
	_res = if(!isNull _clr) then [{isPlayer _clr},{false}];
	_res
};

player addAction ["Call target", {[cursorTarget] call AKR_fnc_requestConnectionClient;}];