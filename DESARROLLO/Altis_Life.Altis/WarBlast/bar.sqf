_vip = vip;
_snd = 0;
_pl = getPos player;

while {_pl distance _vip < 100} do {
	if (_snd == 0) then {
		_vip say "bar";
		sleep 41;
	};
};