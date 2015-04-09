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
	case "market": {["Mercado de Altis",["water","rabbit","maiz","redgull","tbacon","lockpick","pickaxe","fuelF","peach","boltcutter","storagesmall","storagebig","semillasMaria","semillasCoca","semillasMaiz","semillasTomate","tomates","maiz"]]};
	case "rebel": {["Mercado rebelde",["water","rabbit","maiz","redgull","tbacon","lockpick","pickaxe","fuelF","peach","boltcutter","blastingcharge","esposas","llaveesposas"]]};
	case "gang": {["Mercado de banda", ["water","rabbit","maiz","redgull","tbacon","lockpick","pickaxe","fuelF","peach","blastingcharge","boltcutter"]]};
	case "wongs": {["Venta de tortugas",["turtlesoup","turtle"]]};
	case "coffee": {["Tienda nexpresso",["coffee","donuts"]]};
	case "heroin": {["Camello",["cocainep","heroinp","marijuana","meta","metilamina"]]};
	case "platino": {["Comprador de aceite",["platinos","pickaxe","fuelF","petroleo"]]};
	case "fishmarket": {["Pescaderia de Altis",["salema","ornate","mackerel","mullet","tuna","catshark"]]};
	case "carbons": {["Tienda de vidrio",["carbons"]]};
	case "iron": {["Tienda de metales",["iron_r","copper_r"]]};
	case "diamond": {["Tienda de diamantes",["diamond","diamondc"]]};
	case "oro": {["Tienda de oro",["oros"]]};
	case "cop": {["Tienda de policia",["donuts","coffee","spikeStrip","water","rabbit","maiz","redgull","fuelF","defusekit"]]};
	case "granitos": {["Tienda de granito",["granitos"]]};
	case "gold": {["Comprador de oro",["oros"]]};
	case "retirado": {["Veterano de guerra",["centralita","trajesoldado","municionmilitar","kevlar","chatarra","piezasmotor","medallas"]]};
	case "tesoros": {["Comerciante de Tesoros",["pergamino","vasija","jarron","doblon","brazalete","catalejo","abrecartas","collar","cetro"]]};
	case "defensas": {["Objetos de bloqueo",["cono","barrera","cajaMadera","palet","murallaPalets","murallaSacosGrande","murallaSacosPequena","murallaPiedras","barrilBasura","barrilArena","barrilArdiendo","pilaRuedas","defensaChasisCoche","contenedorBasura"]]};
};