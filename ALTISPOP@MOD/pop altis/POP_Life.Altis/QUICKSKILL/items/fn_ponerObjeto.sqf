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
