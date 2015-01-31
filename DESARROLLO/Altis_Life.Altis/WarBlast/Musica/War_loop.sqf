// Prueba 1 looop!
_obj = _this select 0;
_sonido = _this select 1;
_duracion = _this select 2;
_loops = _this select 3;

_distancia = 250;

_i = 0;
while { (alive _obj) and ((_i < _loops) or (_loops == -1)) } do
{
	if ((_obj distance player) < _distancia) then
	{
		_obj say3D _sound;
	};
	sleep _duracion;
	_i = _i + 1;
};
