////////funcion poner item muyayo bu quick!!
     QUICK_ponerItemtoWorld = {


		_gen = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
		_caller =[_this,1,Objnull,[Objnull]] call BIS_fnc_param;
 		_id = _this select 2; 
 		_gen removeAction _id;

     	 _object =[_this,3,Objnull,[Objnull]] call BIS_fnc_param;

      	detach _object;
		_object setPos [(getPos _object select 0),(getPos _object select 1),0];
		_object enableSimulation false;

		//opcion de eliminar manualmente
		_object addAction["Eliminar Objeto",QUICK_fnc_quitarObjeto,_object];
		//borrar item a los 10 minutos o si nos alejamos 50 metros de el
		_timerVidaObj = 60 *10;
		while {_timerVidaObj > 1} do {

			_metrosEntreEllos =  _gen distance _object;

			if(_metrosEntreEllos> 50)then{

				_timerVidaObj = 0;
			};

	  
	 		 _timerVidaObj = _timerVidaObj -1;
	 		 sleep 1;


		};//end while

		if(_timerVidaObj<1)then {

		deleteVehicle _object;

		};
	
	  };//end funcion ponerItem

/*
	poner objetos!!! script  by quick !!!! xD
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
		case "barrilBasura": {"Land_GarbageBarrel_01_F"};
		case "barrilArena": {"Land_BarrelSand_grey_F"};		
		case "barrilArdiendo": {"MetalBarrel_burning_F"};
		case "pilaRuedas ": {"Land_Tyres_F"};
		case "defensaChasisCoche": {"Land_Wreck_Skodovka_F"};
		case "contenedorBasura": {"Land_GarbageContainer_open_F"};
	};
   
	_object = createVehicle [_name, [0,0,0], [], 0, "NONE"]; 
	_object enableSimulation false;
	_object attachTo[player,[0,2,1]];
	_object setVariable["item","objectDeployed",true];

     player addAction["Poner Objeto - Durara 10 minutos!",QUICK_ponerItemtoWorld,_object];




	
};///end tenemos el item en el inventario