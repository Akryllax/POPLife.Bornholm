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
	case "market": {["Mercado de Altis",["water","rabbit","apple","redgull","tbacon","lockpick","pickaxe","fuelF","peach","boltcutter","storagesmall","storagebig","semillasMaria","semillasCoca","semillasMaiz","semillasTomate","tomates","maiz","cb"]]};
	case "rebel": {["Mercado rebelde",["water","rabbit","apple","redgull","tbacon","lockpick","pickaxe","fuelF","peach","boltcutter","blastingcharge","esposas","llaveesposas","cb"]]};
	case "gang": {["Mercado de banda", ["water","rabbit","apple","redgull","tbacon","lockpick","pickaxe","fuelF","peach","blastingcharge","boltcutter"]]};
	case "wongs": {["Venta de tortugas",["turtlesoup","turtle"]]};
	case "coffee": {["Tienda nexpresso",["coffee","donuts"]]};
	case "heroin": {["Camello",["cocainep","heroinp","marijuana","meta","metilamina"]]};
	case "oil": {["Comprador de aceite",["oilp","pickaxe","fuelF","petroleo"]]};
	case "fishmarket": {["Pescaderia de Altis",["salema","ornate","mackerel","mullet","tuna","catshark"]]};
	case "glass": {["Tienda de vidrio",["glass"]]};
	case "iron": {["Tienda de metales",["iron_r","copper_r"]]};
	case "diamond": {["Tienda de diamantes",["diamond","diamondc"]]};
	case "salt": {["Tienda de sal",["salt_r"]]};
	case "cop": {["Tienda de policia",["donuts","coffee","spikeStrip","water","rabbit","apple","redgull","fuelF","defusekit","cb"]]};
	case "cement": {["Tienda de cemento",["cement"]]};
	case "gold": {["Comprador de oro",["goldbar"]]};
	case "retirado": {["Veterano de guerra",["centralita","trajesoldado","municionmilitar","kevlar","chatarra","piezasmotor","medallas"]]};
	case "tesoros": {["Comerciante de Tesoros",["pergamino","vasija","jarron","doblon","brazalete","catalejo","abrecartas","collar","cetro"]]};
	case "defensas": {["Objetos de bloqueo",["cono","barrera","cajaMadera","palet","murallaPalets","murallaSacosGrande","murallaSacosPequena","murallaPiedras","barrilBasura","barrilArena","barrilArdiendo","pilaRuedas","defensaChasisCoche","contenedorBasura"]]};
	/*case "illnesscenter":
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
				"cono",
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
	};*/
};