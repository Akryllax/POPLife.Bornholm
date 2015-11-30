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
			case "water": {"life_inv_water"};
			case "rabbit": {"life_inv_rabbit"};
			case "salema": {"life_inv_salema"};
			case "ornate": {"life_inv_ornate"};
			case "mackerel": {"life_inv_mackerel"};
			case "tuna": {"life_inv_tuna"};
			case "mullet": {"life_inv_mullet"};
			case "catshark": {"life_inv_catshark"};
			case "turtle": {"life_inv_turtle"};
			case "fishing": {"life_inv_fishingpoles"};
			case "coffee": {"life_inv_coffee"};
			case "turtlesoup": {"life_inv_turtlesoup"};
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
			// Helicrash
			case "centralita": {"life_inv_centralita"};
			case "trajesoldado": {"life_inv_trajesoldado"};
			case "chatarra": {"life_inv_chatarra"};
			case "piezasmotor": {"life_inv_piezasmotor"};
			case "municionmilitar": {"life_inv_municionmilitar"};
			case "medallas": {"life_inv_medallas"};
			case "kevlar": {"life_inv_kevlar"};
			// Naufragio
			case "pergamino": {"life_inv_pergamino"};
			case "vasija": {"life_inv_vasija"};
			case "jarron": {"life_inv_jarron"};
			case "doblon": {"life_inv_doblon"};
			case "brazalete": {"life_inv_brazalete"};
			case "catalejo": {"life_inv_catalejo"};
			case "abrecartas": {"life_inv_abrecartas"};
			case "collar": {"life_inv_collar"};
			case "cetro": {"life_inv_cetro"};
			//esposas
			case "esposas": {"life_inv_esposas"};
            case "llaveesposas": {"life_inv_llaveesposas"};
            //trabajos
            case "metilamina":{"life_inv_metilamina"};
            case "meta":{"life_inv_meta"};
            case  "petroleo":{"life_inv_petroleo"};
            //items quick
            case "gpsEspia": {"life_inv_gpsEspia"};
			case "semillasMaria": {"life_inv_semillasMaria"};
			case "semillasCoca": {"life_inv_semillasCoca"};
			case "semillasMaiz": {"life_inv_semillasMaiz"};
			case "semillasTomate": {"life_inv_semillasTomate"};
			case "tomates": {"life_inv_tomates"};
			case "maiz": {"life_inv_maiz"};
			//defensas
            case "cono": {"life_inv_cono"};
	        case "barrera": {"life_inv_barrera"};
	        case "cajaMadera": {"life_inv_cajaMadera"};
	        case "palet": {"life_inv_palet"};
	        case "murallaPalets": {"life_inv_murallaPalets"};
	        case "murallaSacosGrande": {"life_inv_murallaSacosGrande"};
	        case "murallaSacosPequena": {"life_inv_murallaSacosPequena"};
	        case "murallaPiedras": {"life_inv_murallaPiedras"};
	        case "barrilBasura": {"life_inv_barrilBasura"};
	        case "barrilArena": {"life_inv_barrilArena"};
	        case "barrilArdiendo": {"life_inv_barrilArdiendo"};
	        case "pilaRuedas": {"life_inv_pilaRuedas"};
	        case "defensaChasisCoche": {"life_inv_defensaChasisCoche"};
	        case "contenedorBasura": {"life_inv_contenedorBasura"};
			//items Rosen
			case "llave_casino": {"life_inv_llave_casino"};
			case "maletin_casino": {"life_inv_maletin_casino"};
			//Tarjeta de Credito
			 case "cb": {"life_inv_cb"};
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
			case "life_inv_water": {"water"};
			case "life_inv_rabbit": {"rabbit"};
			case "life_inv_salema": {"salema"};
			case "life_inv_ornate": {"ornate"};
			case "life_inv_mackerel": {"mackerel"};
			case "life_inv_tuna": {"tuna"};
			case "life_inv_mullet": {"mullet"};
			case "life_inv_catshark": {"catshark"};
			case "life_inv_turtle": {"turtle"};
			case "life_inv_fishingpoles": {"fishing"};
			case "life_inv_coffee": {"coffee"};
			case "life_inv_turtlesoup": {"turtlesoup"};
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
			// Helicrash
			case "life_inv_centralita": {"centralita"};
			case "life_inv_trajesoldado": {"trajesoldado"};
			case "life_inv_chatarra": {"chatarra"};
			case "life_inv_piezasmotor": {"piezasmotor"};
			case "life_inv_municionmilitar": {"municionmilitar"};
			case "life_inv_medallas": {"medallas"};
			case "life_inv_kevlar": {"kevlar"};
			// Naufragio
			case "life_inv_pergamino": {"pergamino"};
			case "life_inv_vasija": {"vasija"};
			case "life_inv_jarron": {"jarron"};
			case "life_inv_doblon": {"doblon"};
			case "life_inv_brazalete": {"brazalete"};
			case "life_inv_catalejo": {"catalejo"};
			case "life_inv_abrecartas": {"abrecartas"};
			case "life_inv_collar": {"collar"};
			case "life_inv_cetro": {"cetro"};
			case "life_inv_esposas": {"esposas"};
            case "life_inv_llaveesposas": {"llaveesposas"};
            //trabajos
            case "life_inv_metilamina":{"metilamina"};
            case "life_inv_meta":{"meta"};
            case  "life_inv_petroleo":{"petroleo"};
            //items quick
            case "life_inv_gpsEspia":{"gpsEspia"};
			case "life_inv_semillasMaria":{"semillasMaria"};
			case "life_inv_semillasCoca": {"semillasCoca"};
			case "life_inv_semillasMaiz": {"semillasMaiz"};
			case "life_inv_semillasTomate": {"semillasTomate"};
			case "life_inv_tomates": {"tomates"};
			case "life_inv_maiz": {"maiz"};
			//defensas
            case "life_inv_cono": {"cono"};
	        case "life_inv_barrera": {"barrera"};
	        case "life_inv_cajaMadera": {"cajaMadera"};
	        case "life_inv_palet": {"palet"};
	        case "life_inv_murallaPalets": {"murallaPalets"};
	        case "life_inv_murallaSacosGrande": {"murallaSacosGrande"};
	        case "life_inv_murallaSacosPequena": {"murallaSacosPequena"};
	        case "life_inv_murallaPiedras": {"murallaPiedras"};
	        case "life_inv_barrilBasura": {"barrilBasura"};
	        case "life_inv_barrilArena": {"barrilArena"};
	        case "life_inv_barrilArdiendo": {"barrilArdiendo"};
	        case "life_inv_pilaRuedas": {"pilaRuedas"};
	        case "life_inv_defensaChasisCoche": {"defensaChasisCoche"};
	        case "life_inv_contenedorBasura": {"contenedorBasura"};
			//items Rosen
			case "llave_casino": {"life_inv_llave_casino"};
			case "maletin_casino": {"life_inv_maletin_casino"};
			//Tarjeta de Credito  
			case "cb": {"life_inv_cb"};
			default {"not found"};
		};
	};
};