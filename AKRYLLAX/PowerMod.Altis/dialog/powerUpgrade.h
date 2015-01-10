//CT TYPES
#define CT_STATIC 0
#define CT_BUTTON 1
#define CT_EDIT 2
#define CT_SLIDER 3
#define CT_COMBO 4
#define CT_LISTBOX 5
#define CT_TOOLBOX 6
#define CT_CHECKBOXES 7
#define CT_PROGRESS 8
#define CT_HTML 9
#define CT_STATIC_SKEW      10
#define CT_ACTIVETEXT 11
#define CT_TREE 12
#define CT_STRUCTURED_TEXT 13
#define CT_CONTEXT_MENU 14
#define CT_CONTROLS_GROUP 15
#define CT_SHORTCUTBUTTON 16
#define CT_XKEYDESC 40
#define CT_XBUTTON          41
#define CT_XLISTBOX 42
#define CT_XSLIDER 43
#define CT_XCOMBO 44
#define CT_ANIMATED_TEXTURE 45
#define CT_OBJECT 80
#define CT_OBJECT_ZOOM 81
#define CT_OBJECT_CONTAINER 82
#define CT_OBJECT_CONT_ANIM 83
#define CT_LINEBREAK 98
#define CT_ANIMATED_USER 99
#define CT_MAP              100
#define CT_MAP_MAIN 101
#define CT_LISTNBOX 102
#define CT_ITEMSLOT         103
#define CT_CHECKBOX         77 //Arma 3

//CT_STYLE

// Static styles
#define ST_POS 0x0F
#define ST_HPOS 0x03
#define ST_VPOS 0x0C
#define ST_LEFT 0x00
#define ST_RIGHT 0x01
#define ST_CENTER 0x02
#define ST_DOWN 0x04
#define ST_UP 0x08
#define ST_VCENTER 0x0c
#define ST_TYPE 0xF0
#define ST_SINGLE 0
#define ST_MULTI 16
#define ST_TITLE_BAR 32
#define ST_PICTURE 48
#define ST_FRAME 64
#define ST_BACKGROUND 80
#define ST_GROUP_BOX 96
#define ST_GROUP_BOX2 112
#define ST_HUD_BACKGROUND 128
#define ST_TILE_PICTURE 144 //tileH and tileW params required for tiled image
#define ST_WITH_RECT 160
#define ST_LINE 176
#define ST_SHADOW 0x100
#define ST_NO_RECT 0x200 // this style works for CT_STATIC in conjunction with ST_MULTI
#define ST_KEEP_ASPECT_RATIO 0x800
#define ST_TITLE ST_TITLE_BAR + ST_CENTER // Slider styles
#define SL_DIR 0x400
#define SL_VERT 0
#define SL_HORZ 1024
#define SL_TEXTURES 0x10 // progress bar
#define ST_VERTICAL 0x01
#define ST_HORIZONTAL 0 // Listbox styles
#define LB_TEXTURES 0x10
#define LB_MULTI 0x20
#define FontM "Zeppelin32" // The standard font in Arma 3 is "PuristaMedium" // Tree styles
#define TR_SHOWROOT 1
#define TR_AUTOCOLLAPSE 2 // MessageBox styles
#define MB_BUTTON_OK 1
#define MB_BUTTON_CANCEL 2
#define MB_BUTTON_USER 4


//Proportions
#define GUI_GRID_X	(0)
#define GUI_GRID_Y	(0)
#define GUI_GRID_W	(0.025)
#define GUI_GRID_H	(0.04)
#define GUI_GRID_WAbs	(1)
#define GUI_GRID_HAbs	(1)

class power_upgrade {
	idd = 6351;
	name= "power_upgrade";
	movingEnable = true;
	enableSimulation = true;
	onLoad = "";
	
	class controlsBackground {
		class bkgBoxMain: RscText
		{
			idc = 1000;
			x = -28.5 * GUI_GRID_W + GUI_GRID_X;
			y = -9 * GUI_GRID_H + GUI_GRID_Y;
			w = 11.5 * GUI_GRID_W;
			h = 2.5 * GUI_GRID_H;
			colorBackground[] = {0,0,0,0.45};
		};
		class bkgTimer: RscText
		{
			idc = 1001;
			x = -17 * GUI_GRID_W + GUI_GRID_X;
			y = -9.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 0.4 * GUI_GRID_W;
			h = 3.5 * GUI_GRID_H;
			colorBackground[] = {0,0,0,1};
		};
	};
	
	class controls {

	////////////////////////////////////////////////////////
	// GUI EDITOR OUTPUT START (by [CT]Akryllax, v1.063, #Himaco)
	////////////////////////////////////////////////////////

	class bkgPowerLevels: RscText
	{
		idc = 1000;
		x = -7 * GUI_GRID_W + GUI_GRID_X;
		y = -3.5 * GUI_GRID_H + GUI_GRID_Y;
		w = 57.5 * GUI_GRID_W;
		h = 28 * GUI_GRID_H;
		colorBackground[] = {0,0,0,0.9};
	};
	class logoBgk3: RscText
	{
		idc = 1001;
		x = -6.5 * GUI_GRID_W + GUI_GRID_X;
		y = -2 * GUI_GRID_H + GUI_GRID_Y;
		w = 14.5 * GUI_GRID_W;
		h = 2 * GUI_GRID_H;
		colorBackground[] = {0.039,0.239,0.439,0.4};
		sizeEx = 1.5 * GUI_GRID_H;
	};
	class logoBgk2: RscText
	{
		idc = 1002;
		x = -6.5 * GUI_GRID_W + GUI_GRID_X;
		y = -2.5 * GUI_GRID_H + GUI_GRID_Y;
		w = 14.5 * GUI_GRID_W;
		h = 0.25 * GUI_GRID_H;
		colorBackground[] = {0,0.498,1,0.4};
	};
	class logoBgk1: RscText
	{
		idc = 1003;
		x = -6.5 * GUI_GRID_W + GUI_GRID_X;
		y = -3.25 * GUI_GRID_H + GUI_GRID_Y;
		w = 14.5 * GUI_GRID_W;
		h = 0.5 * GUI_GRID_H;
		colorBackground[] = {0.035,0.322,0.612,0.4};
	};
	class bkgScrollTextUp: RscText
	{
		idc = 1005;
		x = 8.5 * GUI_GRID_W + GUI_GRID_X;
		y = -2.75 * GUI_GRID_H + GUI_GRID_Y;
		w = 40.5 * GUI_GRID_W;
		h = 0.25 * GUI_GRID_H;
		colorBackground[] = {0.7,0.7,0.7,0.5};
	};
	class bkgScrollTextDown: RscText
	{
		idc = 1006;
		x = 8.5 * GUI_GRID_W + GUI_GRID_X;
		y = -1 * GUI_GRID_H + GUI_GRID_Y;
		w = 40.5 * GUI_GRID_W;
		h = 0.25 * GUI_GRID_H;
		colorBackground[] = {0.7,0.7,0.7,0.5};
	};
	class bkgScrollText: RscText
	{
		idc = 1007;
		x = 8.5 * GUI_GRID_W + GUI_GRID_X;
		y = -2.5 * GUI_GRID_H + GUI_GRID_Y;
		w = 40.5 * GUI_GRID_W;
		h = 1.5 * GUI_GRID_H;
		colorBackground[] = {0.7,0.7,0.7,0.35};
	};
	class bkgRightMenu: RscText
	{
		idc = 1012;
		x = 35.15 * GUI_GRID_W + GUI_GRID_X;
		y = 12.11 * GUI_GRID_H + GUI_GRID_Y;
		w = 14.5 * GUI_GRID_W;
		h = 8 * GUI_GRID_H;
		colorBackground[] = {0.25,0.25,0.25,0.5};
	};
	class bkgLeftMenu: RscText
	{
		idc = 1008;
		x = -6.5 * GUI_GRID_W + GUI_GRID_X;
		y = 1.5 * GUI_GRID_H + GUI_GRID_Y;
		w = 9.5 * GUI_GRID_W;
		h = 14.5 * GUI_GRID_H;
		colorBackground[] = {0.25,0.25,0.25,0.5};
	};
	class imgTitle: RscPicture
	{
		idc = 1200;
		text = "img\crosshair.paa";
		colorBackground[] = {0,0,0,0};
		x = -6.5 * GUI_GRID_W + GUI_GRID_X;
		y = -2 * GUI_GRID_H + GUI_GRID_Y;
		w = 2.5 * GUI_GRID_W;
		h = 2 * GUI_GRID_H;
	};
	class tileTitle: RscText
	{
		idc = 1004;
		text = "PRI Internal Int."; //--- ToDo: Localize;
		x = -3.5 * GUI_GRID_W + GUI_GRID_X;
		y = -2 * GUI_GRID_H + GUI_GRID_Y;
		w = 11.5 * GUI_GRID_W;
		h = 2 * GUI_GRID_H;
		sizeEx = 0.8 * GUI_GRID_H;
	};
	class frameTreeView: RscFrame
	{
		idc = 1800;
		x = 3.5 * GUI_GRID_W + GUI_GRID_X;
		y = 1 * GUI_GRID_H + GUI_GRID_Y;
		w = 31 * GUI_GRID_W;
		h = 20 * GUI_GRID_H;
		colorBackground[] = {0,0,0,1};
	};
	class strucStats: RscStructuredText
	{
		idc = 1100;
		text = "STATS\nEXP: 51548418"; //--- ToDo: Localize;
		onLoad = "((findDisplay 6351) displayCtrl 1100) ctrlSetText (parseText ""STARTS<br/>EXP: <t color=#F00>515151</t>"")";
		x = 35 * GUI_GRID_W + GUI_GRID_X;
		y = 1 * GUI_GRID_H + GUI_GRID_Y;
		w = 14.5 * GUI_GRID_W;
		h = 10.5 * GUI_GRID_H;
		colorText[] = {1,1,1,1};
		colorBackground[] = {0,0,0,0.3};
		colorActive[] = {0,0,0,0.3};
		sizeEx = 1 * GUI_GRID_H;
	};
	class objContainer: RscText
	{
		idc = 1017;
		text = "CT_OBJECTCONTAINER"; //--- ToDo: Localize;
		x = -6 * GUI_GRID_W + GUI_GRID_X;
		y = 16.5 * GUI_GRID_H + GUI_GRID_Y;
		w = 8.5 * GUI_GRID_W;
		h = 6 * GUI_GRID_H;
	};
	class FrameView {
		idd = 1785;
		x = 3.5 * GUI_GRID_W + GUI_GRID_X;
		y = 1 * GUI_GRID_H + GUI_GRID_Y;
		w = 31 * GUI_GRID_W;
		h = 20 * GUI_GRID_H;
		colorBackground[] = {0,0,0,1};
		movingEnable = false;
		enableSimulation = true;
		
		controlsBackground[] = {habilityDesc,treeViewFrameLeft,treeViewFrameDown,treeViewFrameRight,treeViewFrameUp};
		
		controls[] = {};
		
		class treeViewFrameLeft: RscText
		{
			idc = 1013;
			x = 3.5 * GUI_GRID_W + GUI_GRID_X;
			y = 1 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 20 * GUI_GRID_H;
			colorBackground[] = {0.45,0.45,0.45,1};
		};
		class treeViewFrameDown: RscText
		{
			idc = 1014;
			x = 7.5 * GUI_GRID_W + GUI_GRID_X;
			y = 18.5 * GUI_GRID_H + GUI_GRID_Y;
			w = 23.5 * GUI_GRID_W;
			h = 2.5 * GUI_GRID_H;
			colorBackground[] = {0.45,0.45,0.45,1};
		};
		class treeViewFrameRight: RscText
		{
			idc = 1015;
			x = 30.5 * GUI_GRID_W + GUI_GRID_X;
			y = 1 * GUI_GRID_H + GUI_GRID_Y;
			w = 4 * GUI_GRID_W;
			h = 20 * GUI_GRID_H;
			colorBackground[] = {0.45,0.45,0.45,1};
		};
		class treeViewFrameUp: RscText
		{
			idc = 1016;
			x = 7.5 * GUI_GRID_W + GUI_GRID_X;
			y = 1 * GUI_GRID_H + GUI_GRID_Y;
			w = 23.5 * GUI_GRID_W;
			h = 2.5 * GUI_GRID_H;
			colorBackground[] = {0.45,0.45,0.45,1};
		};
		class habilityDesc: RscText
		{
			idc = 1011;
			text = "LVL: 1/5"; //--- ToDo: Localize;
			x = -22.5 * GUI_GRID_W + GUI_GRID_X;
			y = 2 * GUI_GRID_H + GUI_GRID_Y;
			w = 5.5 * GUI_GRID_W;
			h = 1.5 * GUI_GRID_H;
			sizeEx = 0.65 * GUI_GRID_H;
			
			controlsBackground[] = {habilityBkg};
			controls[] = {habilityTitle};
			
			class habilityBkg: RscText
			{
				idc = 1010;
				x = -23 * GUI_GRID_W + GUI_GRID_X;
				y = 0.5 * GUI_GRID_H + GUI_GRID_Y;
				w = 6.5 * GUI_GRID_W;
				h = 3.5 * GUI_GRID_H;
				colorBackground[] = {1,1,1,0.4};
			};
			class habilityTitle: RscText
			{
				idc = 1009;
				text = "Firebreather"; //--- ToDo: Localize;
				x = -23 * GUI_GRID_W + GUI_GRID_X;
				y = 0.5 * GUI_GRID_H + GUI_GRID_Y;
				w = 6.5 * GUI_GRID_W;
				h = 1 * GUI_GRID_H;
				colorBackground[] = {0.612,0.035,0.035,1};
			};
		};
			
	};
	class buttonClass1: RscButton
	{
		idc = 1600;
		text = "Social"; //--- ToDo: Localize;
		x = -6 * GUI_GRID_W + GUI_GRID_X;
		y = 2 * GUI_GRID_H + GUI_GRID_Y;
		w = 8.5 * GUI_GRID_W;
		h = 1.5 * GUI_GRID_H;
		colorBackground[] = {0,0.749,1,1};
		colorActive[] = {0,0.749,1,1};
	};
	class buttonClass2: RscButton
	{
		idc = 1601;
		text = "Guerrero"; //--- ToDo: Localize;
		x = -6 * GUI_GRID_W + GUI_GRID_X;
		y = 4 * GUI_GRID_H + GUI_GRID_Y;
		w = 8.5 * GUI_GRID_W;
		h = 1.5 * GUI_GRID_H;
		colorBackground[] = {0,0.749,1,1};
		colorActive[] = {0,0.749,1,1};
	};
	class buttonClass3: RscButton
	{
		idc = 1602;
		text = "Criminal"; //--- ToDo: Localize;
		x = -6 * GUI_GRID_W + GUI_GRID_X;
		y = 6 * GUI_GRID_H + GUI_GRID_Y;
		w = 8.5 * GUI_GRID_W;
		h = 1.5 * GUI_GRID_H;
		colorBackground[] = {0,0.749,1,1};
		colorActive[] = {0,0.749,1,1};
	};
	class buttonClass4: RscButton
	{
		idc = 1603;
		text = "Psicopata"; //--- ToDo: Localize;
		x = -6 * GUI_GRID_W + GUI_GRID_X;
		y = 8 * GUI_GRID_H + GUI_GRID_Y;
		w = 8.5 * GUI_GRID_W;
		h = 1.5 * GUI_GRID_H;
		colorBackground[] = {0,0.749,1,1};
		colorActive[] = {0,0.749,1,1};
	};
	class buttonClass5: RscButton
	{
		idc = 1604;
		text = "Tecnocrata"; //--- ToDo: Localize;
		x = -6 * GUI_GRID_W + GUI_GRID_X;
		y = 10 * GUI_GRID_H + GUI_GRID_Y;
		w = 8.5 * GUI_GRID_W;
		h = 1.5 * GUI_GRID_H;
		colorBackground[] = {0,0.749,1,1};
		colorActive[] = {0,0.749,1,1};
	};
	class buttonClass6: RscButton
	{
		idc = 1605;
		text = "Medium"; //--- ToDo: Localize;
		x = -6 * GUI_GRID_W + GUI_GRID_X;
		y = 12 * GUI_GRID_H + GUI_GRID_Y;
		w = 8.5 * GUI_GRID_W;
		h = 1.5 * GUI_GRID_H;
		colorBackground[] = {0,0.749,1,1};
		colorActive[] = {0,0.749,1,1};
	};
	class btnClose: RscButton
	{
		idc = 1606;
		text = "CERRAR"; //--- ToDo: Localize;
		onClick = "closeDialog 0";
		x = 35.5 * GUI_GRID_W + GUI_GRID_X;
		y = 21.5 * GUI_GRID_H + GUI_GRID_Y;
		w = 13.5 * GUI_GRID_W;
		h = 2.5 * GUI_GRID_H;
	};
	class btnRght1: RscButton
	{
		idc = 1607;
		text = "1"; //--- ToDo: Localize;
		x = 35.5 * GUI_GRID_W + GUI_GRID_X;
		y = 12.5 * GUI_GRID_H + GUI_GRID_Y;
		w = 6.5 * GUI_GRID_W;
		h = 2 * GUI_GRID_H;
	};
	class btnRght2: RscButton
	{
		idc = 1608;
		text = "2"; //--- ToDo: Localize;
		x = 42.5 * GUI_GRID_W + GUI_GRID_X;
		y = 12.5 * GUI_GRID_H + GUI_GRID_Y;
		w = 6.5 * GUI_GRID_W;
		h = 2 * GUI_GRID_H;
	};
	class btnRght3: RscButton
	{
		idc = 1609;
		text = "3"; //--- ToDo: Localize;
		x = 35.5 * GUI_GRID_W + GUI_GRID_X;
		y = 15 * GUI_GRID_H + GUI_GRID_Y;
		w = 6.5 * GUI_GRID_W;
		h = 2 * GUI_GRID_H;
	};
	class btnRght5: RscButton
	{
		idc = 1610;
		text = "5"; //--- ToDo: Localize;
		x = 35.5 * GUI_GRID_W + GUI_GRID_X;
		y = 17.5 * GUI_GRID_H + GUI_GRID_Y;
		w = 6.5 * GUI_GRID_W;
		h = 2 * GUI_GRID_H;
	};
	class btnRght4: RscButton
	{
		idc = 1611;
		text = "4"; //--- ToDo: Localize;
		x = 42.5 * GUI_GRID_W + GUI_GRID_X;
		y = 15 * GUI_GRID_H + GUI_GRID_Y;
		w = 6.5 * GUI_GRID_W;
		h = 2 * GUI_GRID_H;
	};
	class btnRght6: RscButton
	{
		idc = 1612;
		text = "6"; //--- ToDo: Localize;
		x = 42.5 * GUI_GRID_W + GUI_GRID_X;
		y = 17.5 * GUI_GRID_H + GUI_GRID_Y;
		w = 6.5 * GUI_GRID_W;
		h = 2 * GUI_GRID_H;
	};
	class buttonClass7: RscButton
	{
		idc = 1613;
		text = "###########################"; //--- ToDo: Localize;
		x = -6 * GUI_GRID_W + GUI_GRID_X;
		y = 14 * GUI_GRID_H + GUI_GRID_Y;
		w = 8.5 * GUI_GRID_W;
		h = 1.5 * GUI_GRID_H;
		colorBackground[] = {0,0.749,1,1};
		colorActive[] = {0,0.749,1,1};
	};
	////////////////////////////////////////////////////////
	// GUI EDITOR OUTPUT END
	////////////////////////////////////////////////////////
	
		
	};
};