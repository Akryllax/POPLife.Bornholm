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
#define FontM "EtelkaMonospacePro" // The standard font in Arma 3 is "PuristaMedium" // Tree styles
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

class RscText { 
	type = CT_STATIC;
	idc = -1;
	style = ST_LEFT; 
	colorBackground[] = {0, 0, 0, 1}; 
	colorText[] = {1, 1, 1, 1}; 
	font = FontM; 
	sizeEx = 0.04; 
	h = 0.04; 
	text = ""; 
};

class RscPicture
{
    access = 0;
    idc = -1;
    type = CT_STATIC;
    style = ST_PICTURE;
    colorBackground[] = {0,0,0,0};
    colorText[] = {1,1,1,1};
    font = FontM;
    sizeEx = 0;
    lineSpacing = 0;
    text = "";
    fixedWidth = 0;
    shadow = 0;
    x = 0;
    y = 0;
    w = 0.2;
    h = 0.15;
};


class RscFrame
{
	type = CT_STATIC;
	idc = -1;
	style = ST_FRAME;
	colorBackground[] = {1, 1, 1, 1};
	colorText[] = {1, 1, 1, 1}; 
	font = FontM; 
	sizeEx = 0.04; 
	h = 0.04; 
	text = ""; 
};

class RscStructuredText
{
	type = CT_STATIC;
	idc = -1;
	style = ST_MULTI;
	colorBackground[] = {1, 1, 1, 1};
	colorText[] = {1, 1, 1, 1}; 
	font = FontM; 
	sizeEx = 0.04;
	lineSpacing = 0.01;
	h = 0.04; 
	text = ""; 
};

class RscButton
{
	type = CT_BUTTON;
	idc = -1;
	style = ST_SINGLE;
	colorBackground[] = {1, 1, 1, 1};
	colorText[] = {1, 1, 1, 1}; 
	font = FontM; 
	sizeEx = 0.04; 
	h = 0.04; 
	text = ""; 
};