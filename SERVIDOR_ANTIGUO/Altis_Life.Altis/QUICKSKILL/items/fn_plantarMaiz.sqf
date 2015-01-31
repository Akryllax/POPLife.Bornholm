private["_gather","_itemWeight","_diff","_itemName","_val"];

[] spawn {
hint "Has plantado maiz, madurara en 2:30 minutos";
_plantador = player;
_planta = "Sign_Arrow_Large_Yellow_F" createVehicle position _plantador;
_plantaPos = position _planta;	

_time = 160;
sleep _time;
hint "El maiz esta listo, tienes 2 minutos para recoger cada fardo"; 
deleteVehicle _planta;
_fruto = "Land_Sack_F" createVehicle _plantaPos;
_fruto enableSimulation false;
_fruto addAction["Recoger maiz",QUICK_recogerFrutosMaiz,_fruto];

sleep 120;
deleteVehicle _fruto;
};





QUICK_recogerFrutosMaiz = {

_gen = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
_caller =[_this,1,Objnull,[Objnull]] call BIS_fnc_param;
 _id = _this select 2; 
 _gen removeAction _id;
 _frutos = 2 + round random 8;
 _fruto =[_this,3,Objnull,[Objnull]] call BIS_fnc_param;



for "_i" from 0 to 2 do
{
	player playMove "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
	waitUntil{animationState player != "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";};
	sleep 1.5;
};

[true,"maiz",_frutos] call life_fnc_handleInv;

hint format["Has recogido %1 de maiz",_frutos]; 

sleep 2;

hint "";


};