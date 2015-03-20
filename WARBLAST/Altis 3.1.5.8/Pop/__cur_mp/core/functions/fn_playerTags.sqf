#include <macro.h>
/*
	File: fn_playerTags.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Adds the tags above other players heads when close and have visible range.
*/
private["_ui","_units"];
#define iconID 78000
#define scale 0.8

if(visibleMap OR {!alive player} OR {dialog}) exitWith {
	500 cutText["","PLAIN"];
};

_ui = uiNamespace getVariable ["Life_HUD_nameTags",displayNull];
if(isNull _ui) then {
	500 cutRsc["Life_HUD_nameTags","PLAIN"];
	_ui = uiNamespace getVariable ["Life_HUD_nameTags",displayNull];
};

_units = nearestObjects[(visiblePosition player),["Man","Land_Pallet_MilBoxes_F","Land_Sink_F","Land_InfoStand_V1_F"],50];

//_units = _units - [player];

//Fix for hanging nametags on the screen
{
	_idc = _ui displayCtrl _x;
	_idc ctrlShow false;
} forEach life_nametags;
life_nametags = [];

//_units = _units - [player];

{
	private["_text"];
	_idc = _ui displayCtrl (iconID + _forEachIndex);
	life_nametags pushBack (iconID + _forEachIndex);

	if(!(lineIntersects [eyePos player, eyePos _x, player, _x]) && {(!isNil {_x getVariable "realname"})}) then {
		_dist = 15;
		_pos = switch(typeOf _x) do {
			case "Land_Pallet_MilBoxes_F": {_dist = 15; [visiblePosition _x select 0, visiblePosition _x select 1, (getPosATL _x select 2) + 1.5]};
			case "Land_Sink_F": {_dist = 15; [visiblePosition _x select 0, visiblePosition _x select 1, (getPosATL _x select 2) + 2]};
			default {_dist = 15; [visiblePosition _x select 0, visiblePosition _x select 1, ((_x modelToWorld (_x selectionPosition "head")) select 2)+.5]};
		};
		_sPos = worldToScreen _pos;
		_distance = _pos distance player;
		if(count _sPos > 1 && {_distance < _dist}) then {
			_text = switch (true) do {
				case (isPlayer _x && {(uniform _x in life_noname_clothing)}): {"";};
				case (isPlayer _x && {(headgear _x in life_hidden_clothing) || (goggles _x in life_hidden_clothing)}): {"<t size='1.2'>[Masked Person]</t>";};
				
				case (isPlayer _x && {uniform _x in ["U_B_Protagonist_VR","U_O_Protagonist_VR","U_I_Protagonist_VR"]}): {format["<t size='1.2' color='#FF0000'>[ADMIN]%1</t>",(_x getVariable ["realname",name _x])];};
				case (isPlayer _x && {getPlayerUID _x == life_mayor_settings select 0}): {format["<t size='1.2' color='#FFA500'>Mayor %1</t>",(_x getVariable ["realname",name _x])];};
				//Police
				case (!isNil {(_x getVariable "rank")}): {format["<img image='%1' size='1.5'></img> <t size='1.2'>%2</t><br/><t size='1.1'>[%3]</t>",switch ((_x getVariable "rank")) do {
					case 1: {"icons\cop\cso_ingame.paa"};
					case 2: {"icons\cop\cso_ingame.paa"};
					case 3: {"icons\cop\pc_ingame.paa"};
					case 4: {"icons\cop\spc_ingame.paa"};
					case 5: {"icons\cop\sgt_ingame.paa"};
					case 6: {"icons\cop\dsgt_ingame.paa"};
					case 7: {"icons\cop\inspector_ingame.paa"};
					case 8: {"icons\cop\di_ingame.paa"};
					case 9: {"icons\cop\ci_ingame.paa"};
					case 10: {"icons\cop\si_ingame.paa"};
					case 11: {"icons\cop\csi_ingame.paa"};
					case 12: {"icons\cop\cmdr_ingame.paa"};

					default {"icons\cop\cso_ingame.paa"};
					},

					_x getVariable ["realname",name _x],
					
					switch ((_x getVariable "rank")) do {
						case 1: {"Community Support Officer"};
						case 2: {"Police Community Support Officer"};
						case 3: {"Police Constable"};
						case 4: {"Senior Police Constable"};
						case 5: {"Sergeant"};
						case 6: {"Desk Sergeant"};
						case 7: {"Inspector"};
						case 8: {"Detective Inspector"};
						case 9: {"Chief Inspector"};
						case 10: {"Superintendent"};
						case 11: {"Chief Superintendent"};
						case 12: {"Commander"};

						default {"Community Support Officer"};
					}]};

				//UNMC
				case (!isNil {(_x getVariable "unmcrank")}): {format["<img image='%1' size='1.5'></img> <t size='1.2'>%2</t><br/><t size='1.1'>[UNMC %3]</t>",switch ((_x getVariable "unmcrank")) do {
					case 1: {"icons\unmc\pvt.paa"};
					case 2: {"icons\unmc\pfc.paa"};
					case 3: {"icons\unmc\cpl.paa"};
					case 4: {"icons\unmc\sgt.paa"};
					case 5: {"icons\unmc\sgtmajor.paa"};
					case 6: {"icons\unmc\secondlt.paa"};
					case 7: {"icons\unmc\firstlt.paa"};
					case 8: {"icons\unmc\cpt.paa"};
					case 9: {"icons\unmc\maj.paa"};
					case 10: {"icons\unmc\col.paa"};
					case 11: {"icons\unmc\highranks.paa"};
					case 12: {"icons\unmc\highranks.paa"};
					case 13: {"icons\unmc\highranks.paa"};

					default {"icons\unmc\pvt.paa"};
					},

					_x getVariable ["realname",name _x],
					
					switch ((_x getVariable "unmcrank")) do {
						case 1: {"Private"};
						case 2: {"Private First Class"};
						case 3: {"Corporal"};
						case 4: {"Sergeant"};
						case 5: {"Sergeant Major"};
						case 6: {"Second Lieutenant"};
						case 7: {"First Lieutenant"};
						case 8: {"Captian"};
						case 9: {"Major"};
						case 10: {"Colonel"};
						case 11: {"General"};
						case 12: {"Deputy Commander"};
						case 13: {"Commander"};

						default {"Private"};
					}]};

				//NHS
				case (!isNil {(_x getVariable "nhsrank")}): {format["<img image='a3\ui_f\data\map\MapControl\hospital_ca.paa' size='1.5'></img> <t size='1.35'>%2</t><br/><t size='1.2'>[%1]</t>",switch ((_x getVariable "nhsrank")) do {
					case 2: {"First Aider"}; 
					case 3: {"Medic"};
					case 4: {"Surgeon"};
					case 5: {"Doctor"};
					case 6: {"General Practitioner"};
					case 7: {"NHS Administration"};
					case 8: {"Chief Medical Officer"};
					default {"Dr. In Training"};
					},_x getVariable ["realname",name _x]]};
				
				case ((!isNil {_x getVariable "name"} && playerSide != civilian)): {format["<t color='#FF0000'><img image='a3\ui_f\data\map\MapControl\hospital_ca.paa' size='1.5'></img></t> %1",_x getVariable ["name","Unknown Person"]]};
				
				case (_x in (units grpPlayer) && playerSide == civilian): {format["<t size='1.2' color='#00FF00'>%1</t>",(_x getVariable ["realname",name _x])];};
				
				default {
					if(!isNil {(group _x) getVariable "gang_name"}) then {
						format["<t size='1.2'>%1</t><br/><t size='0.8' color='#B6B6B6'>%2</t>",_x getVariable ["realname",name _x],(group _x) getVariable ["gang_name",""]];
					} else {
						format["<t size='1.2'>%1</t>",_x getVariable ["realname",name _x]];
					};
				};
			};
			if(_x getVariable ["speaking",false]) then {_text = "[SPEAKING] " + _text};
			_idc ctrlSetStructuredText parseText _text;
			_idc ctrlSetPosition [_sPos select 0, _sPos select 1, 0.4, 0.65];
			_idc ctrlSetScale scale;
			_idc ctrlSetFade 0;
			_idc ctrlCommit 0;
			_idc ctrlShow true;
		} else {
			_idc ctrlShow false;
		};
	} else {
		_idc ctrlShow false;
	};
} foreach _units;