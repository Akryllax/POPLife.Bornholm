/*
	Archivo: fn_fiesta.sqf
	Autor Rosen
	
	Descripción: Dance dance revolution!
*/

[] spawn {
	if (life_bailando) exitWith {};
	life_bailando = true;
	closeDialog 0;
	titleText["¡Eres un fiera!","PLAIN"];
	//player say3D "bailar";
	player playMove "AmovPercMstpSnonWnonDnon_exerciseKata";
	sleep 60;
	life_bailando = false;	
};
