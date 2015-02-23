/**
* Archivo: fn_menuPresidente.sqf
* Autor: Rosen
* Descripcion: Menu del presidente.
*
**/

class presidente
{
        idd = 1900;
        name= "life_presidente_menu";
        movingEnable = false;
        enableSimulation = true;
       
 
        class Boton1: RscButton
                {
                        idc = -1;
                        text = "Legalizar Marihuana"; 
                        onButtonClick = "[marijuana] spawn AKR_fnc_makeLegal;";
                        x = 0.37625 * safezoneW + safezoneX;
                        y = 0.566 * safezoneH + safezoneY;
                        w = 0.0979687 * safezoneW;
                        h = 0.033 * safezoneH;
                };
        class Boton2: RscButton
                {
                        idc = -1;
                        text = "Boton2"; 
                        x = 0.37625 * safezoneW + safezoneX;
                        y = 0.522 * safezoneH + safezoneY;
                        w = 0.0979687 * safezoneW;
                        h = 0.033 * safezoneH;
                };
        class Boto3: RscButton
                {
                        idc = -1;
                        text = "Boton3"; 
                        x = 0.37625 * safezoneW + safezoneX;
                        y = 0.478 * safezoneH + safezoneY;
                        w = 0.0979687 * safezoneW;
                        h = 0.033 * safezoneH;
                };
        class Boton4: RscButton
                {
                        idc = -1;
                        text = "Boton4"; 
                        x = 0.37625 * safezoneW + safezoneX;
                        y = 0.434 * safezoneH + safezoneY;
                        w = 0.0979687 * safezoneW;
                        h = 0.033 * safezoneH;
                };
        class Boton5: RscButton
                {
                        idc = -1;
                        text = "Ilegalizar Marihuana"; 
                        onButtonClick = "[marijuana,2000] spawn AKR_fnc_makeIlegal;";
                        x = 0.5 * safezoneW + safezoneX;
                        y = 0.566 * safezoneH + safezoneY;
                        w = 0.0979687 * safezoneW;
                        h = 0.033 * safezoneH;
                };
        class Boton6: RscButton
                {
                        idc = -1;
                        text = "Boton6"; 
                        x = 0.5 * safezoneW + safezoneX;
                        y = 0.522 * safezoneH + safezoneY;
                        w = 0.0979687 * safezoneW;
                        h = 0.033 * safezoneH;
                };
        class Boton7: RscButton
                {
                        idc = -1;
                        text = "Boton7"; 
                        x = 0.5 * safezoneW + safezoneX;
                        y = 0.478 * safezoneH + safezoneY;
                        w = 0.0979687 * safezoneW;
                        h = 0.033 * safezoneH;
                };
        class Boton8: RscButton
                {
                        idc = -1;
                        text = "Boton8"; 
                        x = 0.5 * safezoneW + safezoneX;
                        y = 0.434 * safezoneH + safezoneY;
                        w = 0.0979687 * safezoneW;
                        h = 0.033 * safezoneH;
                };
        class IGUIBack_2200: IGUIBack
                {
                        idc = -1;
                        x = 0.360781 * safezoneW + safezoneX;
                        y = 0.401 * safezoneH + safezoneY;
                        w = 0.252656 * safezoneW;
                        h = 0.209 * safezoneH;
                };
        class textopresidente: RscText
                {
                        idc = -1;
                        text = "Menu del presidente"; 
                        x = 0.432969 * safezoneW + safezoneX;
                        y = 0.39 * safezoneH + safezoneY;
                        w = 0.103125 * safezoneW;
                        h = 0.044 * safezoneH;
                };
        };
};