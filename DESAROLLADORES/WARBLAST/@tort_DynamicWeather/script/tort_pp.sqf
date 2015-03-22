private ["_seedvar", "_count", "_lightness"];
tort_pp = true; _count = 1; _seedvar = _this select 0; _lightness = 1;

// Random number generator
// Input: number, seed (integer)
// _myrandomnumber = [max] call pp_tRandom;
pp_tRandom = {
   _count = _count + 1;
   private["_i","_num","_out","_arr"]; _out = "";
   for "_i" from 1 to 7 do {
      _num = sin(_i^3 + _count + _seedvar) + 1;
      _arr = toArray str(_num);
      if ((count _arr) > 6) then {_out = _out + toString([_arr select ((count _arr) - 2)]);};
   };
   _seedvar = (1000000 - (parseNumber (_out)) + _count) % 1000000;
   ((_this select 0) * parseNumber ("0." + _out))
};



while {tort_pp} do {
   if ((overcast > 0.8) && (fog > 0.4)) then {
      "colorCorrections" ppEffectEnable true;
      "colorCorrections" ppEffectAdjust [_lightness,1,0,[0,0,0,0],[1,1,1,1],[0,0,0,1]];
      "colorCorrections" ppEffectCommit 0;
      _lightness = ([1] call pp_tRandom);
      sleep 10;
   };
};

"colorCorrections" ppEffectEnable false;