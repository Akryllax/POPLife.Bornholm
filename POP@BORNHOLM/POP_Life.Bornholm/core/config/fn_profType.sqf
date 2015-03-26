/*
File: fn_profType
Author: Jacob "PapaBear" Tyler

Description:
Text changing
*/
//convert name to prof name
_type = [_this,0,"",[""]] call BIS_fnc_param;

if(_type == "" ) exitWith {[]};

_profName = "";
switch ( _type ) do
{
//text to license
case "heroin": {_profName = "Droga_Prof"; };
case "cocaine": { _profName = "Droga_Prof";};
case "marijuana": { _profName = "Droga_Prof";};
case "copper": { _profName = "Fundicion_Prof"; };
case "iron": { _profName = "Fundicion_Prof";};
case "salt": {_profName = "Fundicion_Prof"; };
case "sand": { _profName = "Fundicion_Prof";};
case "diamond": { _profName = "Geologo_Prof";};
case "oil": { _profName = "Geologo_Prof";};
case "cement": { _profName = "Geologo_Prof";};
case "maiz": { _profName = "Granjero_Prof"; };
case "peach": { _profName = "Granjero_Prof";};
case "heroinu": {_profName = "Droga_Prof"; };
case "cannabis": { _profName = "Droga_Prof";};
case "copperore": { _profName = "Fundicion_Prof"; };
case "ironore": { _profName = "Fundicion_Prof";};
case "oilu": { _profName = "Geologo_Prof";};
case "rock": { _profName = "Geologo_Prof";};

//license to text
case "Droga_Prof": {_profName = "Drogas"; };
case "Fundicion_Prof": { _profName = "Herrero"; };
case "Geologo_Prof": { _profName = "Geologia";};
case "Granjero_Prof": { _profName = "Granja"; };


case "Drogas": {_profName = "Droga_Prof"; };
case "Herrero": { _profName = "Fundicion_Prof"; };
case "Geologia": { _profName = "Geologo_Prof";};
case "Granja": { _profName = "Granjero_Prof"; };
default{""};
};



_profName;