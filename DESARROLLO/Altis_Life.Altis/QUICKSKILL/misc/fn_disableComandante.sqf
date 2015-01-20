if (isNull player) exitwith {} ;

CMbindings = [];
Salutebindings = [];
CMoffbindings=[];
CMblocking =false ;

VAR_DEFAULT(CTF_disableCommandMode,true) ;

updateKeyBindings =
{
     while {true} do {
	  //DBG [time,"keys"] ;
	  if (CTF_disableCommandMode) then {
	       CMbindings = actionKeys "ForceCommandingMode";
	  } ;

	  Salutebindings = actionKeys "Salute";
	
	  sleep 2;
     };
};

grenadeModeTimer=0 ;
fireButtonDown=false;
grenadeSelectState ="idle";
grenadeKeyDown=false;

grenadeSelect={
     private ["_muz"];
     //to get here, the user must have pressed the salute button
     grenadeModeTimer = time ;
     //assume the player wanted a hand-grenade by default
     player selectweapon "handgrenademuzzle" ;
     waituntil {
	  (time -grenadeModeTimer > 0.5) ||
	       !grenadeKeyDown } ;
     if (grenadeKeyDown) then {
	       //this was a long press so switch to grenade-launcher if appropriate
	       _muz =  getArray(configFile>>"CfgWeapons">>(primaryWeapon player)>>"muzzles");
	       if (1 < (count _muz)) then {
			 player selectweapon EL(_muz,1);
		    } ; 
	  } else {
	  //this was a short press so check for another one 
	  grenadeModeTimer = time ;
	  waituntil {
	       (time -grenadeModeTimer > 0.5) ||
		    grenadeKeyDown } ;
	  if (grenadeKeyDown) then {
		    //we got a second press
		    player selectWeapon "SmokeShellMuzzle" ;
	       } else {
	       //looks like this was a single press after all
	  };
     } ;
     sleep 2;
     while {fireButtonDown} do {sleep 0.5;} ;
     [player,primaryWeapon player] call safeSelectWeapon;
     grenadeSelectState="idle";
} ;

dokeyDown={
     private ["_r"] ;
     _r = false ; 
     if ((_this select 1) in CMbindings) then {
	  hint "Command mode disabled" ;
	  _r=true;
     };
     if ((_this select 1) in Salutebindings) then {
	       grenadekeydown=true ;
	       if (grenadeSelectState == "idle") then {
			 grenadeSelectState = "running" ;
			 [] spawn grenadeSelect;
		    } ;
	       _r=true;
	  };
     _r;
} ;

dokeyUp={
     private ["_r"] ;
     _r = false ;
     if ((_this select 1) in Salutebindings) then {
	       grenadeKeyDown=false;
	       _r = true;
	  };
     _r ;
} ;

//
//I don't know why a delay is necessary :-(
sleep 5;
(FindDisplay 46) DisplaySetEventHandler [
     "keydown",
     "_this call dokeyDown"
     ];
(FindDisplay 46) DisplaySetEventHandler [
     "keyup",
     "_this call dokeyUp"
     ];
(FindDisplay 46) DisplaySetEventHandler ["mousebuttondown","fireButtonDown=true;"] ;
(FindDisplay 46) DisplaySetEventHandler ["mousebuttonup","fireButtonDown=false;"] ;

[] call updateKeyBindings ;