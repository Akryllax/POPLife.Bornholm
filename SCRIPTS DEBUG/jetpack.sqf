keepMeAlive = scriptNull;
onFly = 2;
jumpFuel = 10;
fuelCons = 0.5;

superJump = {

	_keys = [17,30,36,31];
	
	if(isNull keepMeAlive) then {
		keepMeAlive = [] spawn {
				while {!isTouchingGround player} do {
					player allowDamage false;
					sleep 1;
				};
				waitUntil {isTouchingGround player };
				jumpFuel = 10;
				player allowDamage true;
			};
	} else {
		if (scriptDone keepMeAlive) then {
			keepMeAlive = [] spawn {
				if(!isTouchingGround player) then {
					player allowDamage false;
				};
				waitUntil {isTouchingGround player };
				jumpFuel = 10;
				player allowDamage true;
			};
		};
	};

	if(_this == 57) then {
		[] spawn {
			_front = [0,0, 0.5];
			_velM = vectorMagnitude (velocity player);
			if(isTouchingGround player) then {
				_front = _front vectorMultiply (onFly * 7);
			} else { 
				_front = _front vectorMultiply ( (10 / (_velM + 1)) * onFly);
			};
			
			if(jumpFuel > 0) then {
				_temp = velocity player;
				_temp = _temp vectorAdd _front;
				player setVelocity _temp;
				jumpFuel = jumpFuel - fuelCons;
				hintSilent str jumpFuel;
			};
		};
	};
	if(_this == 17) then {
		[] spawn {
			if!(isTouchingGround player) then {
				_front = [sin(getDir player), cos(getDir player), 0];
				_velM = vectorMagnitude (velocity player);
				_front = _front vectorMultiply ( (6 / (_velM + 1)) * onFly);
				
				if(jumpFuel > 0) then {
					_temp = velocity player;
					_temp = _temp vectorAdd _front;
					player setVelocity _temp;
					jumpFuel = jumpFuel - fuelCons;
					hintSilent str jumpFuel;
				};
			};
		};
	};
	if(_this == 30) then {
		[] spawn {
			if!(isTouchingGround player) then {
				_front = [sin((getDir player) - 90), cos((getDir player) - 90), 0];
				_velM = vectorMagnitude (velocity player);
				_front = _front vectorMultiply ( (6 / (_velM + 1)) * onFly);
				
				if(jumpFuel > 0) then {
					_temp = velocity player;
					_temp = _temp vectorAdd _front;
					player setVelocity _temp;
					jumpFuel = jumpFuel - fuelCons;
					hintSilent str jumpFuel;
				};
			};
		};
	};
	if(_this == 36) then {
		[] spawn {
			if!(isTouchingGround player) then {
				_front = [sin((getDir player) + 90), cos((getDir player) + 90), 0];
				_velM = vectorMagnitude (velocity player);
				_front = _front vectorMultiply ( (6 / (_velM + 1)) * onFly);
				
				if(jumpFuel > 0) then {
					_temp = velocity player;
					_temp = _temp vectorAdd _front;
					player setVelocity _temp;
					jumpFuel = jumpFuel - fuelCons;
					hintSilent str jumpFuel;
				};
			};
		};
	};
	if(_this == 31) then {
		[] spawn {
			if!(isTouchingGround player) then {
				_front = [sin(getDir player), cos(getDir player), 0];
				_velM = vectorMagnitude (velocity player);
				_front = _front vectorMultiply ( (6 / (_velM + 1)) * -onFly);
				
				if(jumpFuel > 0) then {
					_temp = velocity player;
					_temp = _temp vectorAdd _front;
					player setVelocity _temp;
					jumpFuel = jumpFuel - fuelCons;
					hintSilent str jumpFuel;
				};
			};
		};
	};
	
	if(_this == 69) then {
		_front = [0,0, 1];
		_front = _front vectorMultiply (-onFly);		
		_temp = velocity player;
		_temp = _temp vectorAdd _front;
		player setVelocity _temp;
	};
	
	if(_this == 45) then {
		player setVelocity [0,0,0];
	};
};

player addEventHandler["Killed", "[_this select 0] spawn life_fnc_revivePlayer"];
powerHandler = (findDisplay 46) displayAddEventHandler["KeyDown", "(_this select 1) spawn superJump; false"];