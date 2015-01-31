disableSerialization;

private ["_handle", "_t"];

_handle = _this select 0;
_t = _this select 1;

_bkg = _handle displayCtrl 59;

_b = true;

_j = 0;
while{_j < _t} do {
	_b = !_b;
	if(_b) then {
		_bkg ctrlSetBackgroundColor [0,0.35,0, 0.9];
	} else {
		_bkg ctrlSetBackgroundColor [0,0.65,0, 0.9];
	};
	sleep 0.2;
	_j = _j + (0.2 * (100/60));
};

_bkg ctrlSetBackgroundColor [0.2,0.2,0.2, 0.9];