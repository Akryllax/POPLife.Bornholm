/*
	poner objetos!!! scrpt by tonic edited by quick y nose que aleman !!!! xD
*/
private["_position","_object"];
if(!isNull life_object) exitWith {};
_type = _this select 0;

if(([false,_type,1] call life_fnc_handleInv)) then {
	//What are we placing today?
	_name = switch (_type) do
	{
		case "cono": {"RoadCone_L_F"};
		case "barrera": {"RoadBarrier_F"};		
		case "cajaMadera ": {"Land_WoodenBox_F"};
		case "palet": {"Land_Pallets_F"};		
		case "murallaPalets": {"Land_Pallets_stack_F"};
		case "murallaSacosGrande": {"Land_BagFence_Long_F"};
		case "murallaSacosPequeña": {"Land_BagFence_Short_F"};
		case "murallaPiedras": {"Land_Stone_4m_F"};		
		case "barrilBasura": {"	Land_GarbageBarrel_01_F"};
		case "barrilArena": {"Land_BarrelSand_grey_F"};		
		case "barrilArdiendo": {"MetalBarrel_burning_F"};
		case "pilaRuedas ": {"Land_Tyres_F"};
		case "defensaChasisCoche": {" Land_Wreck_Skodovka_F"};
		case "contenedorBasura": {"Land_GarbageContainer_open_F"};
	};

	_object = createVehicle [_name, [0,0,0], [], 0, "NONE"];  
	_object attachTo[player,[0,2,1]];
	_object setVariable["item","objectDeployed",true];

	life_action_objectDeploy = player addAction["Poner Objeto - Durara 10 minutos!",{if(!isNull life_object) then {detach life_object; life_object = ObjNull;}; player removeAction life_action_objectDeploy; life_action_objectDeploy = nil;},"",999,false,false,"",'!isNull life_object'];
	life_object = _object;
	waitUntil {isNull life_object};
	if(!isNil "life_action_objectDeploy") then {player removeAction life_action_objectDeploy;};
	if(isNull _object) exitWith {life_object = ObjNull;};
	_object setPos [(getPos _object select 0),(getPos _object select 1),0];
	_object enableSimulation false;
	_object addAction["Eliminar Objeto",QUICK_fnc_quitarObjeto,_object];
	//borrar item a los 10 minutos
	sleep 60*10;
	deleteVehicle _object;
	
};