/*
File: prof.hpp
Author: Jacob "PapaBear" Tyler
Edited By: [midgetgrimm]
Description:
Dialog for new gui
*/
class Life_Prof_Dialog
{
idd = 7730;
name = "life_prof_dialog";
movingEnabled = false;
enableSimulation = true;

class controlsBackground
{
        class Frame2: Life_RscText
        {
            idc = -1;
            colorBackground[] = {0, 0, 0,0.7};
            x = 0.1; y = 0.15;
            w = 0.8;
            h = 0.51;
        };
        class Frame: life_RscTitle
        {
            idc = -1;
            text = "Sistema de Experiencia";
            colorBackground[] = {0,0,0.388,1};
            style=0x02;
            tooltip = "Más sabe el diablo por viejo que por diablo";
            //tooltipColorShade[] = {0.267,0.267,0.267,1};
            tooltipColorText[] = {1,1,1,1};
            tooltipColorBox[] = {1,1,1,1};
            x = 0.1;
            y = 0.15;
            w = 0.8;
            h = (1 / 25);
        };
        class Prof3Header : life_RscTitle
        {
            idc = -1;
            colorBackground[] = {0,0,0.388,1};
            text = "Exp actual";
            sizeEx = 0.04;
            style=0x02;
            x = 0.62; y = 0.2;
            w = 0.275; h = 0.04;
        };

        class Prof2Header : life_RscTitle
        {
            idc = -1;
            colorBackground[] = {0,0,0.388,1};
            text = "Nivel";
            sizeEx = 0.04;
            style=0x02;
            x = 0.336; y = 0.2;
            w = 0.275; h = 0.04;
        };

        class ProfHeader : life_RscTitle
        {
            idc = -1;
            colorBackground[] = {0,0,0.388,1};
            text = "Experiencias";
            sizeEx = 0.04;
            style=0x02;
            tooltip = "Para ver las estadisticas selecciona selecciona la deseada, si por algun casual no aparecen juega y apareceran automaticamente";
            //tooltipColorShade[] = {0.267,0.267,0.267,1};
            tooltipColorText[] = {1,1,1,1};
            tooltipColorBox[] = {1,1,1,1};
            x = 0.11; y = 0.2;
            w = 0.219; h = 0.04;
        };/*
        class currentExp: life_RscTitle
        {
            idc = -1;
            colorBackground[] = {0,0,0.388,1};
            text = "Current XP";
            sizeEx = 0.04;
            style=0x02;
            //onLBSelChanged = "";
            x = 0.62; y = 0.35;
            w = 0.275;h = 0.04;
        };*/
        class nextExp: life_RscTitle
        {
            idc = -1;
            colorBackground[] = {0,0,0.388,1};
            text = "Exp para subir";
            sizeEx = 0.04;
            style=0x02;
            x = 0.62; y = 0.41;
            w = 0.275;h = 0.04;
        };
};
class controls
{

        class Prof4_Text: life_RscListBox
        {
            idc = 7734;
            colorBackground[] = {0, 0, 0, 0};
            text = "";
            style = "0x02 + 0xC0";
            sizeEx = 0.085;
            x = 0.62; y = 0.46;
            w = 0.275;h = 0.135;
        };
        class Prof3_Text: life_RscListBox
        {
            idc = 7733;
            colorBackground[] = {0, 0, 0, 0};
            text = "";
            style = "0x02 + 0xC0";
            sizeEx = 0.085;
            //onLBSelChanged = "";
            x = 0.62; y = 0.25;
            w = 0.275;h = 0.15;
        };
        class Prof2_Text: life_RscListBox
        {
            idc = 7732;
            colorBackground[] = {0, 0, 0, 0};
            text = "";
            style = 0x02;
            sizeEx = 0.3;
            //onLBSelChanged = "";
            x = 0.336; y = 0.25;
            w = 0.275;h = 0.4;
        };
        class Prof_Text: life_RscListBox
        {
            idc = 7731;
            colorBackground[] = {0, 0, 0, 0};
            text="";
            style = 0x02;
            sizeEx = 0.04;
            onLBSelChanged = "[_this] spawn life_fnc_grabSkills";
            x = 0.11; y = 0.25;
            w = 0.219; h = 0.4;
        };
        class CloseBTN: Life_RscButtonMenu
        {
            idc = -1;
            style = "0x02 + 0xC0";
            text = "$STR_Global_Close";
            colorText[] = {0,0,0,1};
            colorBackground[] = {0.729,0,0,1};
            onButtonClick = "closeDialog 0;";
            x = 0.62;
            y = 0.61;
            w = 0.275;
            h = (1 / 25);
        };
};
};