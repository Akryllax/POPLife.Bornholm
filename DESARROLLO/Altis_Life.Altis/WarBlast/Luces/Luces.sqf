/*
   luz.sqf
   Autor: WarBlast
   Descripcion: Luces dinamicas
*/


_luz1 = "#lightpoint" createVehicle getpos Luz1;
_luz1 setLightBrightness 0.2;
_luz1 setLightColor[0, 0, 0];
_luz1 lightAttachObject [Luz1, [0,0,-5]];

_luz2 = "#lightpoint" createVehicle getpos Luz2;
_luz2 setLightBrightness 0.1;
_luz2 setLightColor[0, 0, 0];
_luz2 lightAttachObject [Luz2, [0,0,7]];

_luz3 = "#lightpoint" createVehicle getpos Luz3;
_luz3 setLightBrightness 0.1;
_luz3 setLightColor[0,0,0];
_luz3 lightAttachObject [Luz3, [0,0,7]];
/*
_luz4 = "#lightpoint" createVehicle getpos Luz4;
_luz4 setLightBrightness 0.1;
_luz4 setLightAmbient[0.7, 0.7, 0.7];
_luz4 setLightColor[229,22,22];
_luz4 lightAttachObject [Luz4, [0,0,1]];

_luz5 = "#lightpoint" createVehicle getpos Luz5;
_luz5 setLightBrightness 0.1;
_luz5 setLightAmbient[0.7, 0.7, 0.7];
_luz5 setLightColor[0,0,255];
_luz5 lightAttachObject [Luz5, [0,0,1]];

_luz6 = "#lightpoint" createVehicle getpos Luz6;
_luz6 setLightBrightness 0.1;
_luz6 setLightAmbient[0.7, 0.7, 0.7];
_luz6 setLightColor[229,22,22];
_luz6 lightAttachObject [Luz6, [0,0,1]];
*/
if (!isServer) then
{
	while {true} do
	{
	       _color = floor (Random 6);
	       _color = round _color;

	     if(_color == 0) then {
	        _luz1 setLightAmbient[0,0,500];
	        _luz2 setLightAmbient[60,0,122];
	        _luz3 setLightAmbient[122,0,60];
	     };
	     if(_color == 1) then {
	        _luz1 setLightAmbient[60,0,122];
	        _luz2 setLightAmbient[0,0,500];
	        _luz3 setLightAmbient[0,500,0];
	     };
	     if(_color == 2) then {
	        _luz1 setLightAmbient[122,0,60];
	        _luz2 setLightAmbient[0,500,0];
	        _luz3 setLightAmbient[0,0,500];
	     };
	    if(_color == 3) then {
	       _luz1 setLightAmbient[0,122,60];
	       _luz2 setLightAmbient[500,0,0];
	       _luz3 setLightAmbient[60,0,122];
	     };
	    if(_color == 4) then {
	       _luz1 setLightAmbient[0,500,0];
	       _luz2 setLightAmbient[60,0,122];
	       _luz3 setLightAmbient[500,0,0];
	     };
	    if(_color == 5) then {
	       _luz1 setLightAmbient[500,0,0];
	       _luz2 setLightAmbient[122,0,60];
	       _luz3 setLightAmbient[0,122,60];
	     };
	     sleep 0.3;
    };
