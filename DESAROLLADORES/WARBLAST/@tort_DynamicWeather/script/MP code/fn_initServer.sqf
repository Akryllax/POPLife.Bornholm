// example code for your server init

// dynamic weather
private["_initWeather","_weatherTrend","_probRnd"];
_initWeather = ["clear","sunny","cloudy","foggy","bad","random"] select Param_initWeather;
_weatherTrend = ["constant","worse","pWorse","better","pBetter","freeCycle","random","cycling"] select Param_weatherTrend;
_probRnd = [0,0.05,0.2,0.45] select Param_probRnd;

0 = [_initWeather, _weatherTrend, [0.1, 0], [0, 0.2], [0, 1, 0, 0.5, 0, 1], 0, 0, 0] execVM "Scripts\tort_DynamicWeather.sqf";