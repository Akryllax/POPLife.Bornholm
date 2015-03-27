/*
Script hecho por Icaruk, si quieres usarlo sólo tienes que pedirme permiso en adri-rk@hotmail.com.
Script done by Icaruk, if you want to use it, you just have to ask me permission on adri-rk@hotmail.com.
*/

if (!isNil {ocupado}) exitWith {hint "Acabas de ver los documentos hace 1 segundo, ¿en serio es necesario volver a verlos?"};
[] spawn {
	ocupado = true;
	sleep 2;
	ocupado = nil;
};

["estadoPortatil"] call ica_dameVar; if !(call ica_editando) then { waitUntil {!isNil {paq}}; }; paq = nil;

createDialog "documentos";
_ui = uiNamespace getVariable "documentos";
(_ui displayCtrl 4095) ctrlSetText format ["%1",estadoPortatil select 1];
