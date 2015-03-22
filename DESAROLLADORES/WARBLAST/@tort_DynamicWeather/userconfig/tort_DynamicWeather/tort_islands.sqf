/*
   Description:
   t_initial = [overcast, fog, wind, rain]; // weather at start
   t_trend = "constant,pBetter,pWorse,better,worse,freecycle,oscillate,random"
   t_probRndChange = [rndchangeProbability,rndchangeProbNolimits,[],[],[]]; //if arrays are defined, use exactly them when random events occur
     //array def.: [minOvercast,maxovercast,minfog,maxfog,minwind,maxwind,minrain,maxrain]
   t_variation = [0.15,0.25,60]; [minimum change, maximum change, in n minutes]
   t_minMax = [minOvercast,maxovercast,minfog,maxfog,minwind,maxwind,minrain,maxrain]; // weather limits

   Neg values: -0.3 means random(0.3)
   You can use ArmA scripting functions below, but you should know what you do.

   Changes will be already applied to your running mission if
   you reload the mod with 0-8-1-"reload..."!
*/

case "aliabad": {
   t_initial = [-0.3,-0.02,-0.5,0];
   t_trend = "pBetter";
   t_probRndChange = [0.1,0.1,[0.4,0.6,0.05,0.1,0.3,1,0,0.4]];
   t_variation = [0.15,0.25,60];
   t_minMax = [0,0.45,0,0.15,0,0.5,0,1,0,1];
};
case "altis": {
   t_initial = [-0.4,0.02,0.2,0];
   t_trend = "pBetter";
   t_probRndChange = [0.1,0.1,[0.7,1,0.05,0.1,0.5,1],[0.55,0.55,0,0,0.8,1]];
   t_variation = [0.15,0.25,30];
   t_minMax = [0,0.4,0,0.15,0,0.5,0,1,0,1];
};
case "bornholm": {
   t_initial = [-0.4,-0.1,-0.4,0];
   t_trend = "freeCycle";
   t_probRndChange = [0.2, 0.1,[0,0.3,0,0.05,0,0.5,0,0],[0.8,1,0.05,0.3,0.5,1,0.5,1]];
   t_variation = [0.1, 0.35, 30];
   t_minMax = [0.3,0.7,0,0.1,0,1,0,1];
};
case "bukovina": {
   //Bukovina from ArmA 2: ACR
   t_initial = [-0.6,-0.15,-1,0];
   t_trend = "pWorse";
   t_probRndChange = [0.1, 0.1,[0,0.4,0,0.05,0,0.5,0,0.3]];
   t_variation = [0.2, 0.35, 30];
   t_minMax = [0.3,1,0,0.35,0,1,0,1];
};
case "woodland_acr": {
   //Bystrica from ArmA 2: ACR
   t_initial = [-0.6,-0.15,-1,0];
   t_trend = "pWorse";
   t_probRndChange = [0.1, 0.1,[0,0.4,0,0.05,0,0.5,0,0.3]];
   t_variation = [0.2, 0.35, 30];
   t_minMax = [0.3,1,0,0.35,0,1,0,1];
};
case "chernarus": {
   t_initial = [-0.6,-0.15,-1,0];
   t_trend = "freeCycle";
   t_probRndChange = [0.25, 0.4];
   t_variation = [0.2, 0.35, 30];
   t_minMax = [0,0.6,0,0.35,0,1,0,1];
};
case "desert_e": {
   //Desert from ArmA 2
   t_initial = [-0.2,0,-0.4,0];
   t_trend = "constant";
   t_probRndChange = [0.01,0,[0.4,0.8,0.05,0.1,0.3,1,0,0.7]];
   t_variation = [0.15,0.25,60];
   t_minMax = [0,0.3,0,0.15,0,0.5,0,1,0,1];
};
case "eden": {
   // CRW2: Everon
   t_initial = [-0.4,-0.02,-0.5,0];
   t_trend = "pBetter";
   t_probRndChange = [0.1,0.1,[0.5,0.7,0.05,0.1,0.3,1,0,0.4]];
   t_variation = [0.15,0.25,60];
   t_minMax = [0,0.45,0,0.15,0,0.5,0,1,0,1];
};
case "hazarkot": {
   t_initial = [-0.3,-0.02,-0.5,0];
   t_trend = "pBetter";
   t_probRndChange = [0.1,0.1,[0.4,0.6,0.05,0.1,0.3,1,0,0.4]];
   t_variation = [0.15,0.25,60];
   t_minMax = [0,0.45,0,0.15,0,0.5,0,1,0,1];
};
case "imrali": {
   t_initial = [-0.5,-0.05,-0.6,0];
   t_trend = "pBetter";
   t_probRndChange = [0.1,0,[0.5,0.7,0.05,0.1,0.5,1]];
   t_variation = [0.15,0.25,30];
   t_minMax = [0,0.4,0,0.2,0,0.5,0,1,0,1];
};
case "cain": {
   // CRW2: Kolgujew
   t_initial = [-0.4,-0.02,-0.5,0];
   t_trend = "pBetter";
   t_probRndChange = [0.2,0.1,[0.5,0.7,0.05,0.1,0.3,1,0,0.4]];
   t_variation = [0.15,0.25,60];
   t_minMax = [0,0.45,0,0.15,0,0.5,0,1,0,1];
};
case "abel": {
   // CRW2: Malden
   t_initial = [-0.4,-0.02,-0.5,0];
   t_trend = "pBetter";
   t_probRndChange = [0.1,0.1,[0.5,0.7,0.05,0.1,0.3,1,0,0.4]];
   t_variation = [0.15,0.25,60];
   t_minMax = [0,0.45,0,0.15,0,0.5,0,1,0,1];
};
case "namalsk": {
   t_initial = [0.9,-0.15,-1,0.8];
   t_trend = "freeCycle";
   t_probRndChange = [0.2,0.1,[0,0.4,0,0.05,0.5,1],[0.5,0.8,0.6,0.8,0.5,1]];
   t_variation = [0.2,0.3,25];
   t_minMax = [0.6,1,0.05,0.4,0.7,1,0,1];
   t_island_fogmodifiers = [0.0002, 5000];
};
case "napf": {
   t_initial = [0.45,-0.1,-1,-0.5];
   t_trend = "freeCycle";
   t_probRndChange = [0.2,0.1];
   t_variation = [0.2,0.3,25];
   t_minMax = [0.1,1,0.05,0.35,0,1,0,1];
};
case "noe": {
   // CRW2: Nogova
   t_initial = [-0.4,-0.02,-0.5,0];
   t_trend = "pBetter";
   t_probRndChange = [0.1,0.1,[0.5,0.7,0.05,0.1,0.3,1,0,0.4]];
   t_variation = [0.15,0.25,60];
   t_minMax = [0,0.45,0,0.15,0,0.5,0,1,0,1];
};
case "rahmadi": {
   t_initial = [-0.3,-0.02,-0.5,0];
   t_trend = "pBetter";
   t_probRndChange = [0.1,0.1,[0.4,0.6,0.05,0.1,0.3,1,0,0.4]];
   t_variation = [0.15,0.25,30];
   t_minMax = [0,0.45,0,0.15,0,0.5,0,1,0,1];
};
case "sangin": {
   t_initial = [-0.4,-0.02,-0.5,0];
   t_trend = "pBetter";
   t_probRndChange = [0.1,0.1,[0.4,0.6,0.05,0.1,0.3,1,0,0.4]];
   t_variation = [0.15,0.25,45];
   t_minMax = [0,0.45,0,0.15,0,0.5,0,1,0,1];
};
case "shapur_baf": {
   t_initial = [-0.3,-0.02,-0.5,0];
   t_trend = "pBetter";
   t_probRndChange = [0.1,0.1,[0.4,0.6,0.05,0.1,0.3,1,0,0.4]];
   t_variation = [0.15,0.25,60];
   t_minMax = [0,0.45,0,0.15,0,0.5,0,1,0,1];
};
case "stratis": {
   t_initial = [-0.4,0.02,0.2,0];
   t_trend = "pBetter";
   t_probRndChange = [0.1,0.1,[0.7,1,0.05,0.1,0.5,1],[0.55,0.55,0,0,0.8,1]];
   t_variation = [0.15,0.25,30];
   t_minMax = [0,0.4,0,0.15,0,0.5,0,1,0,1];
};
case "takistan": {
   t_initial = [-0.3,-0.02,-0.5,0];
   t_trend = "pBetter";
   t_probRndChange = [0.1,0.1,[0.4,0.6,0.05,0.1,0.3,1,0,0.4]];
   t_variation = [0.15,0.25,60];
   t_minMax = [0,0.45,0,0.15,0,0.5,0,1,0,1];
};
case "zargabad": {
   t_initial = [-0.3,-0.02,-0.5,0];
   t_trend = "pBetter";
   t_probRndChange = [0.1,0.1,[0.4,0.6,0.05,0.1,0.3,1,0,0.4]];
   t_variation = [0.15,0.25,60];
   t_minMax = [0,0.45,0,0.15,0,0.5,0,1,0,1];
};