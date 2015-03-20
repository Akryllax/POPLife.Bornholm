class life_skill_dialog {
	idd = 3500;
	name= "life_skill_dialog";
	movingEnable = false;
	enableSimulation = true;
	
	class controls {
		class MenuTitle: Life_RscText
		{
			idc = 1000;
			text = "AltisLife.co.uk Skills Menu"; //--- ToDo: Localize;
			x = 0.1;
			y = 0.16;
			w = 0.8;
			h = 0.04;
			colorBackground[] = {0.338829,0,1,0.937124};
		};
		class Background: Life_RscText
		{
			idc = 1001;
			x = 0.1;
			y = 0.2;
			w = 0.8;
			h = 0.64;
			colorText[] = {-1,-1,-1,0.7};
			colorBackground[] = {-1,-1,-1,0.7};
			colorActive[] = {-1,-1,-1,0.7};
		};
		class CloseButton: Life_RscButtonMenu
		{
			idc = 1600;
			text = "Close"; //--- ToDo: Localize;
			x = 0.1;
			y = 0.84;
			w = 0.125;
			h = 0.04;
			onButtonClick = "closeDialog 0;";
		};

		class RespecButton: Life_RscButtonMenu
		{
			idc = 1600;
			text = "Respec"; //--- ToDo: Localize;
			x = 0.230;
			y = 0.84;
			w = 0.125;
			h = 0.04;
			onButtonClick = "[] spawn life_fnc_respec;";
		};
		
		class LearnButton: Life_RscButtonMenu
		{
			idc = 1601;
			text = "Learn"; //--- ToDo: Localize;
			x = 0.425;
			y = 0.74;
			w = 0.45;
			h = 0.06;
			onButtonClick = "[] call life_fnc_buyTalent;";
		};
		class TalentList: Life_RscListbox
		{
			sizeEx = 0.035;
			idc = 1500;
			x = 0.125;
			y = 0.22;
			w = 0.275;
			h = 0.58;
			onLBSelChanged = "[] call life_fnc_skillUpdate;";
		};
		class TextInfo_Properties: Life_RscStructuredText
		{
			idc = 1100;
			text = "Please select a talent in order to investigate its properties, then click Learn to get that talent!"; //--- ToDo: Localize;
			x = 0.425;
			y = 0.22;
			w = 0.45;
			h = 0.5;
		};
	};
};