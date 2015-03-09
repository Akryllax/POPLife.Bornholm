/*
   luz.sqf
   Autor: WarBlast e Icaruk
   Descripcion: Luces dinamicas
*/

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

_luz15 = "#lightpoint" createVehicle getpos Luz15;
_luz15 setLightBrightness 1;
_luz15 setLightColor[0,0,0];
_luz15 lightAttachObject [Luz15, [0,0,20]];

while {true} do { // compruebas si es de día o de noche
        if (((date select 3) >= 20) OR ((date select 3) <= 7)) then { // 8pm - 7am

           _luz7 setLightAmbient[10,10,10];
           _luz8 setLightAmbient[10,10,10];
           _luz9 setLightAmbient[10,10,10];
           _luz10 setLightAmbient[10,10,10];
           _luz11 setLightAmbient[10,10,10];
           _luz12 setLightAmbient[10,10,10];
           _luz13 setLightAmbient[10,10,10];
           _luz14 setLightAmbient[10,10,10];
           _luz15 setLightAmbient[10,10,10];

                while {true} do { // compruebo cada minuto si deja de ser de noche
                        if !(((date select 3) >= 20) OR ((date select 3) <= 7)) exitWith {}; // deja de ser de noche y voy al else
                        sleep 60;
                };
        } else {
                while {true} do { // compruebo cada minuto si deja de ser de día
                        if (((date select 3) >= 20) OR ((date select 3) <= 7)) exitWith {}; // deja de ser de día y doy la vuelta
                        sleep 60;
                };
        };
};

