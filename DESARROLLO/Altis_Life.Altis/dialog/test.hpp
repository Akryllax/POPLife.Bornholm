class test
{
    idd = -1;
    duration = 99999999999;
    movingEnable = 0;
    onLoad = "uiNamespace setVariable ['test', _this select 0]; abierto = true;";
    onUnLoad = "uiNamespace setVariable ['test', nil]; abierto = nil";
    objects[]={};

    class controls 
    {



		class texto: RscText
		{
			idc = -1;
			text = "ola k ase"; //--- ToDo: Localize;
			x = 0.443281 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.0825 * safezoneW;
			h = 0.0418 * safezoneH;
		};



    };
};