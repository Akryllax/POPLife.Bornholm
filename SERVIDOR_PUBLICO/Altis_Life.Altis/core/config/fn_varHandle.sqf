/*
	File: fn_varHandle.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master handler for getting a variables name, short name, etc.
*/
private["_var","_mode"];
_var = [_this,0,"",[""]] call BIS_fnc_param;
_mode = [_this,1,-1,[0]] call BIS_fnc_param;
if(_var == "" OR _mode == -1) exitWith {""};

switch (_mode) do
{
	case 0:
	{
		switch (_var) do
		{
			case "oilu": {"life_inv_oilu"};
			case "oilp": {"life_inv_oilp"};
			case "heroinu": {"life_inv_heroinu"};
			case "heroinp": {"life_inv_heroinp"};
			case "cannabis": {"life_inv_cannabis"};
			case "marijuana": {"life_inv_marijuana"};
			case "apple": {"life_inv_apple"};
			case "pear": {"life_inv_pear"};
			case "water": {"life_inv_water"};
			case "rabbit": {"life_inv_rabbit"};
			case "salema": {"life_inv_salema"};
			case "ornate": {"life_inv_ornate"};
			case "mackerel": {"life_inv_mackerel"};
			case "mullet": {"life_inv_mullet"};
			case "tuna": {"life_inv_tuna"};
			case "salemap": {"life_inv_salemap"};
			case "ornatep": {"life_inv_ornatep"};
			case "mackerelp": {"life_inv_mackerelp"};
			case "mulletp": {"life_inv_mulletp"};
			case "tunap": {"life_inv_tunap"};
			case "surimi": {"life_inv_surimi"};
			case "lataatun": {"life_inv_lataatun"};
			case "catshark": {"life_inv_catshark"};
			case "turtle": {"life_inv_turtle"};
			case "carne_t": {"life_inv_carne_t"};
			case "piel": {"life_inv_piel"};
			case "fishing": {"life_inv_fishingpoles"};
			case "coffee": {"life_inv_coffee"};
			case "donuts": {"life_inv_donuts"};
			case "fuelE": {"life_inv_fuelE"};
			case "fuelF": {"life_inv_fuelF"};
			case "money": {"life_cash"};
			case "pickaxe": {"life_inv_pickaxe"};
			case "copperore": {"life_inv_copperore"};
			case "ironore": {"life_inv_ironore"};
			case "iron_r": {"life_inv_ironr"};
			case "copper_r": {"life_inv_copperr"};
			case "salt": {"life_inv_salt"};
			case "salt_r": {"life_inv_saltr"};
			case "sand": {"life_inv_sand"};
			case "glass": {"life_inv_glass"};
			case "tbacon": {"life_inv_tbacon"};
			case "lockpick": {"life_inv_lockpick"};
			case "redgull": {"life_inv_redgull"};
			case "peach": {"life_inv_peach"};
			case "diamond": {"life_inv_diamond"};
			case "diamondc": {"life_inv_diamondr"};
			case "cocaine": {"life_inv_coke"};
			case "cocainep": {"life_inv_cokep"};
			case "spikeStrip": {"life_inv_spikeStrip"};
			case "cement": {"life_inv_cement"};
			case "rock": {"life_inv_rock"};
			case "goldbar": {"life_inv_goldbar"};
			case "blastingcharge": {"life_inv_blastingcharge"};
			case "boltcutter": {"life_inv_boltcutter"};
			case "defusekit": {"life_inv_defusekit"};
			case "storagesmall": {"life_inv_storagesmall"};
			case "storagebig": {"life_inv_storagebig"};
			case "zipties": {"life_inv_zipties"};
			case "biofruta": {"life_inv_biofruta"};
			case "u234": {"life_inv_u234"};
			case "u235": {"life_inv_u235"};
			case "u238": {"life_inv_u238"};
			case "bu234": {"life_inv_bu234"};
			case "bu235": {"life_inv_bu235"};
			case "bu238": {"life_inv_bu238"};
			case "uenriquecido": {"life_inv_uenriquecido"};
			case "bombanuclear": {"life_inv_bombanuclear"};
			case "goldbarp": {"life_inv_goldbarp"};
			case "underwatercharge": {"life_inv_underwatercharge"};
			case "jerinCostipado": {"life_inv_jerinCostipado"};
			case "jerinEbola": {"life_inv_jerinEbola"};
			case "jerinCeguera": {"life_inv_jerinCeguera"};
			case "jerinTranquilizante": {"life_inv_jerinTranquilizante"};
			case "jerinHipotermia": {"life_inv_jerinHipotermia"};
			case "medicCalor": {"life_inv_medicCalor"};
			case "medicAntibiotico": {"life_inv_medicAntibiotico"};
			case "medicAnticuerpos": {"life_inv_medicAnticuerpos"};
			case "gpsEspia": {"life_inv_gpsEspia"};
			case "semillasMaria": {"life_inv_semillasMaria"};
			case "semillasCoca": {"life_inv_semillasCoca"};
			case "semillasMaiz": {"life_inv_semillasMaiz"};
			case "semillasTomate": {"life_inv_semillasTomate"};
			case "tomates": {"life_inv_tomates"};
			case "maiz": {"life_inv_maiz"};
			//HERRAMIENTAS POLICIA
			case "cono": {"life_inv_cono"};
			case "barrera": {"life_inv_barrera"};
			case "barricada": {"life_inv_barricada"};
			case "valla": {"life_inv_valla"};
			case "muro": {"life_inv_muro"};

			default {"not found"};
		};
	};
	
	case 1:
	{
		switch (_var) do
		{
			case "life_inv_oilu": {"oilu"};
			case "life_inv_oilp": {"oilp"};
			case "life_inv_heroinu": {"heroinu"};
			case "life_inv_heroinp": {"heroinp"};
			case "life_inv_cannabis": {"cannabis"};
			case "life_inv_marijuana": {"marijuana"};
			case "life_inv_apple": {"apple"};
			case "life_inv_pear": {"pear"};
			case "life_inv_water": {"water"};
			case "life_inv_rabbit": {"rabbit"};
			case "life_inv_salema": {"salema"};
			case "life_inv_ornate": {"ornate"};
			case "life_inv_mackerel": {"mackerel"};
			case "life_inv_mullet": {"mullet"};
			case "life_inv_tuna": {"tuna"};
			case "life_inv_salemap": {"salemap"};
			case "life_inv_ornatep": {"ornatep"};
			case "life_inv_mackerelp": {"mackerelp"};
			case "life_inv_mulletp": {"mulletp"};
			case "life_inv_tunap": {"tunap"};
			case "life_inv_surimi": {"surimi"};
			case "life_inv_lataatun": {"lataatun"};			
			case "life_inv_catshark": {"catshark"};
			case "life_inv_turtle": {"turtle"};
			case "life_inv_carne_t": {"carne_t"};
			case "life_inv_piel": {"piel"};
			case "life_inv_fishingpoles": {"fishing"};
			case "life_inv_coffee": {"coffee"};
			case "life_inv_donuts": {"donuts"};
			case "life_inv_fuelE": {"fuelE"};
			case "life_inv_fuelF": {"fuelF"};
			case "life_cash": {"money"};
			case "life_inv_pickaxe": {"pickaxe"};
			case "life_inv_copperore": {"copperore"};
			case "life_inv_ironore": {"ironore"};
			case "life_inv_ironr": {"iron_r"};
			case "life_inv_copperr": {"copper_r"};
			case "life_inv_sand": {"sand"};
			case "life_inv_salt": {"salt"};
			case "life_inv_glass": {"glass"};
			case "life_inv_redgull": {"redgull"};
			case "life_inv_lockpick": {"lockpick"};
			case "life_inv_tbacon": {"tbacon"};
			case "life_inv_peach": {"peach"};
			case "life_inv_diamond": {"diamond"};
			case "life_inv_diamondr": {"diamondc"};
			case "life_inv_saltr": {"salt_r"};
			case "life_inv_coke": {"cocaine"};
			case "life_inv_cokep": {"cocainep"};
			case "life_inv_spikeStrip": {"spikeStrip"};
			case "life_inv_cement": {"cement"};
			case "life_inv_rock": {"rock"};
			case "life_inv_goldbar": {"goldbar"};
			case "life_inv_blastingcharge": {"blastingcharge"};
			case "life_inv_boltcutter": {"boltcutter"};
			case "life_inv_defusekit": {"defusekit"};
			case "life_inv_storagesmall": {"storagesmall"};
			case "life_inv_storagebig": {"storagebig"};
			case "life_inv_zipties": {"zipties"};
			case "life_inv_biofruta": {"biofruta"};
			case "life_inv_u234": {"u234"};
			case "life_inv_u235": {"u235"};
			case "life_inv_u238": {"u238"};
			case "life_inv_bu234": {"bu234"};
			case "life_inv_bu235": {"bu235"};
			case "life_inv_bu238": {"bu238"};
			case "life_inv_uenriquecido": {"uenriquecido"};		
			case "life_inv_bombanuclear": {"bombanuclear"};	
			case "life_inv_goldbarp": {"goldbarp"};
			case "life_inv_underwatercharge": {"underwatercharge"};
			case "life_inv_jerinCostipado": {"jerinCostipado"};
			case "life_inv_jerinEbola": {"jerinEbola"};
			case "life_inv_jerinCeguera": {"jerinCeguera"};
			case "life_inv_jerinTranquilizante": {"jerinTranquilizante"};
			case "life_inv_jerinHipotermia": {"jerinHipotermia"};
			case "life_inv_medicAntibiotico": {"medicAntibiotico"};
			case "life_inv_medicAnticuerpos": {"medicAnticuerpos"};
			case "life_inv_medicCalor": {"medicCalor"};	
			case "life_inv_gpsEspia":{"gpsEspia"};	
			case "life_inv_semillasMaria":{"semillasMaria"};
			case "life_inv_semillasCoca": {"semillasCoca"};
			case "life_inv_semillasMaiz": {"semillasMaiz"};
			case "life_inv_semillasTomate": {"semillasTomate"};
			case "life_inv_tomates": {"tomates"};
			case "life_inv_maiz": {"maiz"};
			//D. HERRAMIENTAS POLICIA
			case "life_inv_cono": {"cono"};
			case "life_inv_barrera": {"barrera"};
			case "life_inv_barricada": {"barricada"};
			case "life_inv_valla": {"valla"};
			case "life_inv_muro": {"muro"};
			default {"not found"};
		};
	};
};