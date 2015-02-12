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

_luz4 = "#lightpoint" createVehicle getpos Luz4;
_luz4 setLightBrightness 0.1;
_luz4 setLightColor[0,0,0];
_luz4 lightAttachObject [Luz4, [0,0,7]];

_luz5 = "#lightpoint" createVehicle getpos Luz5;
_luz5 setLightBrightness 0.1;
_luz5 setLightColor[0,0,0];
_luz5 lightAttachObject [Luz5, [0,0,7]];

_luz6 = "#lightpoint" createVehicle getpos Luz6;
_luz6 setLightBrightness 0.1;
_luz6 setLightColor[0,0,0];
_luz6 lightAttachObject [Luz6, [0,0,7]];

_luz7 = "#lightpoint" createVehicle getpos Luz7;
_luz7 setLightBrightness 1;
_luz7 setLightColor[0,0,0];
_luz7 lightAttachObject [Luz7, [0,0,20]];

_luz8 = "#lightpoint" createVehicle getpos Luz8;
_luz8 setLightBrightness 1;
_luz8 setLightColor[0,0,0];
_luz8 lightAttachObject [Luz8, [0,0,12]];

_luz9 = "#lightpoint" createVehicle getpos Luz9;
_luz9 setLightBrightness 1;
_luz9 setLightColor[0,0,0];
_luz9 lightAttachObject [Luz9, [0,0,40]];

_luz10 = "#lightpoint" createVehicle getpos Luz10;
_luz10 setLightBrightness 1;
_luz10 setLightColor[0,0,0];
_luz10 lightAttachObject [Luz10, [0,0,30]];

_luz11 = "#lightpoint" createVehicle getpos Luz11;
_luz11 setLightBrightness 1;
_luz11 setLightColor[0,0,0];
_luz11 lightAttachObject [Luz11, [0,0,30]];

_luz12 = "#lightpoint" createVehicle getpos Luz12;
_luz12 setLightBrightness 1;
_luz12 setLightColor[0,0,0];
_luz12 lightAttachObject [Luz12, [0,0,30]];

_luz13 = "#lightpoint" createVehicle getpos Luz13;
_luz13 setLightBrightness 1;
_luz13 setLightColor[0,0,0];
_luz13 lightAttachObject [Luz13, [0,0,20]];

_luz14 = "#lightpoint" createVehicle getpos Luz14;
_luz14 setLightBrightness 1;
_luz14 setLightColor[0,0,0];
_luz14 lightAttachObject [Luz14, [0,0,20]];

if (((date select 3) >= 20) OR ((date select 3) <= 7)) then
{

	while {true} do
	{
	if !(((date select 3) >= 20) OR ((date select 3) <= 7)) exitWith {};

	       _color = floor (Random 6);
	       _color = round _color;

           _luz7 setLightAmbient[1,1,1];
           _luz8 setLightAmbient[1,1,1];
           _luz9 setLightAmbient[1,1,1];
           _luz10 setLightAmbient[1,1,1];
           _luz11 setLightAmbient[1,1,1];
           _luz12 setLightAmbient[1,1,1];
           _luz13 setLightAmbient[1,1,1];
           _luz14 setLightAmbient[1,1,1];

	     if(_color == 0) then {
	        _luz1 setLightAmbient[0,0,500];
	        _luz2 setLightAmbient[60,0,122];
	        _luz3 setLightAmbient[122,0,60];
	        _luz4 setLightAmbient[0,0,500];
	        _luz5 setLightAmbient[60,0,122];
	        _luz6 setLightAmbient[122,0,60];
	     };
	     if(_color == 1) then {
	        _luz1 setLightAmbient[60,0,122];
	        _luz2 setLightAmbient[0,0,500];
	        _luz3 setLightAmbient[0,500,0];
	        _luz4 setLightAmbient[60,0,122];
	        _luz5 setLightAmbient[0,0,500];
	        _luz6 setLightAmbient[0,500,0];
	     };
	     if(_color == 2) then {
	        _luz1 setLightAmbient[122,0,60];
	        _luz2 setLightAmbient[0,500,0];
	        _luz3 setLightAmbient[0,0,500];
	        _luz4 setLightAmbient[122,0,60];
	        _luz5 setLightAmbient[0,500,0];
	        _luz6 setLightAmbient[0,0,500];
	     };
	    if(_color == 3) then {
	        _luz1 setLightAmbient[0,122,60];
	        _luz2 setLightAmbient[500,0,0];
	        _luz3 setLightAmbient[60,0,122];
	        _luz4 setLightAmbient[0,122,60];
	        _luz5 setLightAmbient[500,0,0];
	        _luz6 setLightAmbient[60,0,122];
	     };
	    if(_color == 4) then {
	        _luz1 setLightAmbient[0,500,0];
	        _luz2 setLightAmbient[60,0,122];
	        _luz3 setLightAmbient[500,0,0];
	        _luz4 setLightAmbient[0,500,0];
	        _luz5 setLightAmbient[60,0,122];
	        _luz6 setLightAmbient[500,0,0];
	     };
	    if(_color == 5) then {
	        _luz1 setLightAmbient[500,0,0];
	        _luz2 setLightAmbient[122,0,60];
	        _luz3 setLightAmbient[0,122,60];
	        _luz4 setLightAmbient[500,0,0];
	        _luz5 setLightAmbient[122,0,60];
	        _luz6 setLightAmbient[0,122,60];
	     };
	     sleep 0.3;
    };
    sleep 1*60;
};