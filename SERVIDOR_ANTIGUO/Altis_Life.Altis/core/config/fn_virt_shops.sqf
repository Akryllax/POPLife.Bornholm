/*
	File: fn_virt_shops.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Config for virtual shops.
*/
private["_shop"];
_shop = _this select 0;

switch (_shop) do
{
	case "market": {["Altis Market",["water","biofruta","rabbit","redgull","tbacon","lockpick","pickaxe","fuelF","boltcutter","storagesmall","storagebig","semillasMaria","semillasCoca","semillasMaiz","semillasTomate","tomates","maiz"]]};
	case "rebel": {["Rebel Market",["water","biofruta","rabbit","redgull","tbacon","lockpick","pickaxe","spikeStrip","fuelF","boltcutter","blastingcharge","zipties"]]};
	case "gang": {["Gang Market", ["water","biofruta","rabbit","redgull","tbacon","lockpick","pickaxe","fuelF","blastingcharge","boltcutter"]]};
	case "wongs": {["Traficante de piel de tortuga",["piel"]]};
	case "coffee": {["Stratis Coffee Club",["coffee","donuts"]]};
	case "heroin": {["Drug Dealer",["cocainep","heroinp","marijuana"]]};
	case "oil": {["Oil Trader",["oilp","pickaxe","fuelF"]]};
	case "fishmarket": {["Mercado de pescado",["lataatun","surimi"]]};
	case "glass": {["Altis Glass Dealer",["glass"]]};
	case "iron": {["Altis Industrial Trader",["iron_r","copper_r"]]};
	case "diamond": {["Diamond Dealer",["diamond","diamondc"]]};
	case "salt": {["Salt Dealer",["salt_r"]]};
	case "cop": {["Cop Item Shop",["donuts","coffee","spikeStrip","water","rabbit","redgull","fuelF","defusekit","cono","barrera","barricada","valla","muro"]]};
	case "cement": {["Cement Dealer",["cement"]]};
	case "gold": {["Gold Buyer",["goldbar"]]};
	case "beer": {["Barkeeper",["water","biofruta","coffee","redgull"]]};
	case "terroristanuclear": {["Terrorista",["bombanuclear"]]}; 
	case "bountymarket": {
		[
			"Tienda cazarecompensas",
			[
				"water",
				"rabbit",
				"tbacon",
				"redgull",
				"spikeStrip",
				"fuelF",
				"zipties"
			]
		]
	};
	
	case "illnesscenter":
	{
		["Centro de Enf. Contag.",
			[
				"jerinHipotermia",
				"jerinCostipado",
				"jerinEbola",
				"jerinCeguera",
				"jerinTranquilizante",
				"medicCalor",
				"medicAntibiotico",
				"medicAnticuerpos"
			]
		]
	};
	
	case "farmacia":
	{
		["Farmacia",
			[
				"medicCalor",
				"medicAntibiotico",
				"medicAnticuerpos"
			]
		]
	};
};