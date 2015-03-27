////
//// Intro Pop Life
///


if !(call ica_editando) then {
	//Sonido de la intro
	playsound "Intro";


	// MSM a la Intro 

	_txt = [
			[
				["PoP Life", "<t align = 'center' size = '0.9'>%1</t><br/>"],
				["Creado por:", "<t align = 'center' size = '0.5'>%1</t><br/>"],
				["Icaruk, PKE, Akryllax, ACJ, Warblast", "<t align = 'center' size = '0.5'>%1</t><br/>"],
				["Web: www.plataoplomo.wtf", "<t align = 'center' size = '0.4'>%1</t><br/>"],
				["TS: 5.196.15.68", "<t align = 'center' size = '0.5'>%1</t><br/>"],
				["Rol o BAN", "<t align = 'center' size = '1'>%1</t><br/>"]
			]
		] spawn BIS_fnc_typeText;
		
};