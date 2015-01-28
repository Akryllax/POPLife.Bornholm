/*
        bar.sqf
        Autor:WarBlat
*/
_vip = vip;
_snd = 0;
_pl = getPos player;

while {_pl distance _vip < 200} do
	{
	  if (_snd == 0) then
		{
		   _vip say "bar";
		   _snd = 1;
	};
	  if (_snd == 1) then
		{
		   sleep 40;
		   _snd = 0
	};
};