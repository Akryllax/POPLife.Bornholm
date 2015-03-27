
class pesca {
	idd = -1;
	movingEnable = 0;
	onMouseZChanged = "_nil = ['tira'] execVM 'ica\farmeo\pesca.sqf'; ";
	onLoad = "abierto = true; ";
	onUnLoad = "if (count (ropes (vehicle player)) != 0) then {ropeDestroy (ropes (vehicle player) select 0)}; abierto = nil; ";
	
	class controls {
		class icaruk: RscText
		{
			idc = -1;
			text = "Icaruk"; //--- ToDo: Localize;
			x = 0.964445 * safezoneW + safezoneX;
			y = -0.0166667 * safezoneH + safezoneY;
			w = 0.0412603 * safezoneW;
			h = 0.055 * safezoneH;
			colorBackground[] = {0,0,0,0};
		};	
	};
};