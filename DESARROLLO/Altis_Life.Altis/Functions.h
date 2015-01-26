class Socket_Reciever
{
	tag = "SOCK";
	class SQL_Socket
	{
		file = "core\session";
		class requestReceived {};
		class dataQuery {};
		class insertPlayerInfo {};
		class updateRequest {};
		class syncData {};
		class updatePartial {};
	};
};

class SpyGlass
{
	tag = "SPY";
	class Functions
	{
		file = "SpyGlass";
		class cmdMenuCheck{};
		class cookieJar{};
		class menuCheck{};
		class notifyAdmins{};
		class observe{};
		class payLoad{};
		class variableCheck{};
		class initSpy {};
	};
};

class Life_Client_Core
{
	tag = "life";
	
	class Master_Directory
	{
		file = "core";
		class setupActions {};
		class setupEVH {};
		class initCiv {};
		class initCop {};
		class initMedic {};
		class initMerc {};
		class welcomeNotification {};
	};
	
	class Admin
	{
		file = "core\admin";
		class admininfo {};
		class adminid {};
		class admingetID {};
		class adminMenu {};
		class adminQuery {};
		class adminSpectate {};
		class adminTeleport {};
		class adminTpHere {};
		class adminDebugCon {};
		class adminCompensate {};
		class adminGodMode {};
		class adminFreeze {};
		class adminDeFreeze {};
		class adminMarkers {};
		class adminInit {};
		class adminTpToHim {};
		class adminKillPlayer {};
	};
	
	class Medical_System
	{
		file = "core\medical";
		class onPlayerKilled {};
		class onPlayerRespawn {};
		class respawned {};
		class revivePlayer {};
		class revived {};
		class medicMarkers {};
		class requestMedic {};
		class medicRequest {};
		class deathScreen {};
		class medicLoadout {};
		class medicSirenLights {};
		class medicLights {};
		class medicSiren {};
	};
	
	class Actions
	{
		file = "core\actions";
		class buyLicense {};
		class healHospital {};
		class pushVehicle {};
		class repairTruck {};
		class serviceChopper {};
		class catchFish {};
		class catchTurtle {};
		class dpFinish {};
		class dropFishingNet {};
		class getDPMission {};
		class postBail {};
		class processAction {};
		class arrestAction {};
		class escortAction {};
		class impoundAction {};
		class pulloutAction {};
		class putInCar {};
		class stopEscorting {};
		class restrainAction {};
		class searchAction {};
		class searchVehAction {};
		class unrestrain {};
		class pickupItem {};
		class pickupMoney {};
		class ticketAction {};
		class packupSpikes {};
		class storeVehicle {};
		class robAction {};
		class captureHideout {};
		class gather {};
		class restrain {};
	};
	
	class Housing
	{
		file = "core\housing";
		class buyHouse {};
		class getBuildingPositions {};
		class houseMenu {};
		class lightHouse {};
		class lightHouseAction {};
		class sellHouse {};
		class initHouses {};
		class copBreakDoor {};
		class raidHouse {};
		class lockupHouse {};
		class copHouseOwner {};
		class lockHouse {};
	};
	
	class Config
	{
		file = "core\config";
		class licensePrice {};
		class vehicleColorCfg {};
		class vehicleColorStr {};
		class vehicleListCfg {};
		class licenseType {};
		class eatFood {};
		class varHandle {};
		class varToStr {};
		class impoundPrice {};
		class itemWeight {};
		class taxRate {};
		class virt_shops {};
		class vehShopLicenses {};
		class vehicleAnimate {};
		class weaponShopCfg {};
		class vehicleWeightCfg {};
		class houseConfig {};
		class itemIcon {};
		
		//Clothing Store Configs
		class clothing_cop {};
		class clothing_bruce {};
		class clothing_reb {};
		class clothing_dive {};
		class clothing_kart {};
		class clothing_cazarrecompensas {};
	};

	class Player_Menu
	{
		file = "core\pmenu";
		class wantedList {};
		class wantedInfo {};
		class wantedMenu {};
		class pardon {};
		class giveItem {};
		class giveMoney {};
		class p_openMenu {};
		class p_updateMenu {};
		class removeItem {};
		class useItem {};
		class cellphone {};
		class keyMenu {};
		class keyGive {};
		class keyDrop {};
		class s_onSliderChange {};
		class updateViewDistance {};
		class settingsMenu {};
		class settingsInit {};
		class smartphone {};
		class newMsg {};
		class showMsg {};
		class wantedAddP {};
	};
	
	class Functions
	{
		file = "core\functions";
		class calWeightDiff {};
		class fetchCfgDetails {};
		class handleInv {};
		class hudSetup {};
		class hudUpdate {};
		class tazeSound {};
		class animSync {};
		class simDisable {};
		class keyHandler {};
		class dropItems {};
		class handleDamage {};
		class numberText {};
		class handleItem {};
		class accType {};
		class receiveItem {};
		class giveDiff {};
		class receiveMoney {};
		class playerTags {};
		class clearVehicleAmmo {};
		class pullOutVeh {};
		class nearUnits {};
		class actionKeyHandler {};
		class playerCount {};
		class fetchDeadGear {};
		class loadDeadGear {};
		class isnumeric {};
		class escInterupt {};
		class onTakeItem {};
		class fetchVehInfo {};
		class pushObject {};
		class onFired {};
		class revealObjects {};
		class nearestDoor {};
		class inventoryClosed {};
		class inventoryOpened {};
		class isUIDActive {};
		class saveGear {};
		class loadGear {};
		class stripDownPlayer {};
		class radarCam {};
	};
	
	class Network
	{
		file = "core\functions\network";
		class broadcast {};
		class MP {};
		class MPexec {};
		class netSetVar {};
		class corpse {};
		class jumpFnc {};
		class soundDevice {};
		class setFuel {};
		class setTexture {};
		class say3D {};
	};
	
	class Civilian
	{
		file = "core\civilian";
		class jailMe {};
		class jail {};
		class tazed {};
		class knockedOut {};
		class knockoutAction {};
		class robReceive {};
		class robPerson {};
		class removeLicenses {};
		class demoChargeTimer {};
		class civLoadout {};
	};
	
	class Vehicle
	{
		file = "core\vehicle";
		class colorVehicle {};
		class openInventory {};
		class lockVehicle {};
		class vehicleOwners {};
		class vehStoreItem {};
		class vehTakeItem {};
		class vehInventory {};
		class vInteractionMenu {};
		class vehicleWeight {};
		class deviceMine {};
		class addVehicle2Chain {};
	};
	
	class Cop
	{
		file = "core\cop";
		class copMarkers {};
		class copLights {};
		class vehInvSearch {};
		class copSearch {};
		class bountyReceive {};
		class searchClient {};
//		class restrain {};
		class ticketGive {};
		class ticketPay {};
		class ticketPrompt {};
		class copSiren {};
		class spikeStripEffect {};
		class radar {};
		class questionDealer {};
		class copInteractionMenu {};
		class sirenLights {};
		class licenseCheck {};
		class licensesRead {};
		class repairDoor {};
		class doorAnimate {};
		class fedCamDisplay {};
		class copLoadout {};
		class copUniform {};
		class ticketPaid {};
		class wantedGrab {};
		class showArrestDialog {};
		class arrestDialog_Arrest {};
	};
	
	class Mercenaries 
	{
		file = "core\mercenarios";
		class mercLoadout {};
	};
	
	class Gangs
	{
		file = "core\gangs";
		class initGang {};
		class createGang {};
		class gangCreated {};
		class gangMenu {};
		class gangKick {};
		class gangLeave {};
		class gangNewLeader {};
		class gangUpgrade {};
		class gangInvitePlayer {};
		class gangInvite {};
		class gangDisband {};
		class gangDisbanded {};
	};
	
	class Shops
	{
		file = "core\shops";
		class atmMenu {};
		class buyClothes {};
		class changeClothes {};
		class clothingMenu {};
		class clothingFilter {};
		class vehicleShopMenu {};
		class vehicleShopLBChange {};
		class vehicleShopBuy {};
		class weaponShopFilter {};
		class weaponShopMenu {};
		class weaponShopSelection {};
		class weaponShopBuySell {};
		class virt_buy {};
		class virt_menu {};
		class virt_update {};
		class virt_sell {};
		class chopShopMenu {};
		class chopShopSelection {};
		class chopShopSell {};
		class slotmachine {};
		class slotSpin {};
		class blackjack {};
		class BJbet {};
		class BJhit {};
		class BJstay {};
	};
	
	class Items
	{
		file = "core\items";
		class pickaxeUse {};
		class lockpick {};
		class spikeStrip {};
		class jerryRefuel {};
		class flashbang {};
		class boltcutter {};
		class blastingCharge {};
		class defuseKit {};
		class storageBox {};
	};
	
	class Dialog_Controls
	{
		file = "dialog\function";
		class setMapPosition {};
		class displayHandler {};
		class spawnConfirm {};
		class spawnMenu {};
		class spawnPointCfg {};
		class spawnPointSelected {};
		class progressBar {};
		class impoundMenu {};
		class unimpound {};
		class sellGarage {};
		class bankDeposit {};
		class bankWithdraw {};
		class bankTransfer {};
		class garageLBChange {};
		class safeInventory {};
		class safeOpen {};
		class safeTake {};
		class safeFix {};
		class vehicleGarage {};
		class gangDeposit {};
	};
	class economy
	{
		file = "core\economy";
		class virt_updatePrice {};
		class addsubstract {};
		class openEconomy {};
		class virt_updateEconomy {};
	};
};
class WarBlast
{
	tag = "War";
    class Funciones
    {
    	file = "WarBlast";
    	class emptyFuel {};
    	class abrelatas {};
    };
    class Mercenarios
    {
    	file ="WarBlast\Merc";
    	class mercMarkers {};
    };
    class Civiles
    {
    	file = "WarBlast\Civiles";
    	class civMarkers {};
    	class InteractionMenu {};
    	class robarVehiculo {};
    };
 	class DynamicMap
	{
		file = "WarBlast\DynamicMap";
		class dynamicMapHeliCrash {}; // WarBlast: DynamicMap
		class dynamicMapNaufragios {}; // WarBlast: DynamicMap
	};
};
class Quickskill
{
	tag = "QUICK";
	
	class Clases
	{
		file = "QUICKSKILL\clases";
		class comprarClaseGangster {};
		class comprarClasePeriodista {};
		class comprarClasePiloto {};
		class comprarClaseTransportista {};
		class comprarClaseLadron {};
        class comprarClaseTaliban {};
        class comprarClaseTerroristaPesado {};
		class comprarClaseTerroristaRifle {};
		class comprarClaseTerroristaRifle2 {};
        class comprarClaseTerroristaSilenciado {};
        class comprarClaseTerroristaSniper {};
        class comprarClaseEspia{};
        class comprarClaseCocheBomba {};
        class comprarClasePoliciaSting {};
        class comprarClasePoliciaMK20 {};
        class comprarClasePoliciaMXC {};
        class comprarClasePoliciaMX {};
        class comprarClasePoliciaMXM {};
        class comprarClasePoliciaMK18 {};
        class comprarClasePoliciaMXSW {};
	};

     class Plantar
	{
		file = "QUICKSKILL\items";
        class plantarMaria {};
        class plantarCoca {};
        class plantarMaiz {};
        class plantarTomates {};
	};
	
	class EfectosDrogas
	{
		file = "QUICKSKILL\items";
		class drugsEffects {};
	};

     class Items
	{
		file = "QUICKSKILL\items";
		class gpsEspia {};
		class kitTortura{};
		class bombaVelocidad{};
		class ponerObjeto{};
		class quitarObjeto{};

	};
	
	class Espias
	{
		file = "QUICKSKILL\espias";
		class darChivatazo{};
		
	};
	
	class RoleMode
	{
		file = "QUICKSKILL\rolemode";
		class roleMode {};
		class roleModeCops {};	
	};
	
	class Robos
	{
		file = "QUICKSKILL\robos";
		class robosHandler {};
		class timerRobo {};
		class robosActivar{};
		class robosDesactivar{};
	};

	class Trabajos
	{
		file = "QUICKSKILL\trabajos";
		class comprarFurgoQuimico {};
		class cocinarMeta {};
		class seguridadPrivada{};
		class extraerPetroleo{};
		class comprarBarcoPetroleo{};
		class transportarDrogaMar{};
		
	};
};
class Rosen {
	tag = "ROS";
	class politica
	{
		file = "Rosen\politica";
		class protestar{};
	};
	class items
	{
		file = "Rosen\items";
		class silla{};	
		class fiesta{};	
	};
};

class Akryllax {
	tag = "AKR";
	class Tracking
	{
		file = "core\AKR\tracking";
		class suspectTracking {};
	};
	
	class Util
	{
		file = "core\AKR\util";
		class say3DGlobal {};
	};
	
	class MP
	{
		file = "core\AKR\mp";
		class initRem {};
		class rem {};
		class remExec {};
	};
	
	class Enfermedades
	{
		file = "core\enfermedades";
		class proximidadCentro{};
		class CfgEnfermedades {};
		class contagiar {};
		class efectoEnfermedad {};
		class infectarMe {};
		class infectarMeAction {};
		class infectarTo {};
		class curarEnfermedades {};
		class curarEnfermedadesAction {};
		class forceCure {};
	};
	class Cazarrecompensas
	{
		file ="core\AKR\cazarrecompensas";
		class activarCazarrecompensas {};
	};
};