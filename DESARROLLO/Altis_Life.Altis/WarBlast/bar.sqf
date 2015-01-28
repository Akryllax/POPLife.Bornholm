/*
        bar.sqf
        Autor:WarBlat
*/
_vip = vip;
_pl = getPos player;

while {_pl distance _vip < 200} do
	{
	  if (!life_sonido) then
		{
		   _vip say "bar";
		   life_sonido = true;
	};
	  if (life_sonido) then
		{
		   sleep 40;
		   _snd = 0
	};
};