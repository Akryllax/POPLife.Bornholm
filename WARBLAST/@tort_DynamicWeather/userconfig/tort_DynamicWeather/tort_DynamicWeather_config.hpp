/* Initial weather
      presets are: "clear", "sunny", "cloudy", "foggy", "bad", "random", "rndGood", "rndBad"
*/
//initial = "cloudy";

// Alternative writing: user defined setting
initial[] = {-0.5, -0.1, -0.7, -1};  //overcast, fog, wind, rain (Fixed values between 0 and 1)
   // If you use negative values, as in {-0.5, -1, 0.7} that means:
   //  Overcast randomly between 0 and 0.5, Fog between 0 and 1, Wind fixed at 0.7


/* Weather trend
    "constant": weather will return to initial weather
    "worse": weather will move straight towards worse
    "pWorse": weather will move randomly, but probably go worse
    "better": weather will move straight towards better
    "pBetter": weather will move randomly, but probably go better
    "freeCycle": weather will move fluently to a random direction
    "random": weather completely random at any new cycle
    "oscillate": always move from best to worse and back */
trend  = "freeCycle";

/* Probability of random (uncycled) weather changes
   1st value (0-1): probability of a random weather event
                    it is respecting the minMax values as defined below
   2nd value (0-1): in case of random weather event, probability of it NOT
                    respecting the minMax values as defined below, i.e. it will
                    choose values between 0 and 1. */
probRndChange[] = {0.08, 0.1};

/* Minimum/maximum change of overcast/fog/wind per Cycle
    irrelevant if trend is "random" or on probRndChange event
    values between 0 and 1
    super secret: IF you add a third argument, this will be the weather
                  cycle length in minutes. Choose bigger values than 20.
                  default = 30; */
variation[] = {0.15, 0.35};

/* Weather limits - All weather will be between these limits:
    values 0-1: [cloudsmin, cloudsdmax, fogmin, fogmax, windmin, windmax, rainmin, rainmax] */
minMax[] = {0.2, 1, 0, 0.5, 0, 1, 0, 1};

/* Debugging
    in any case you will find at least two lines of info, e.g. chosen seed,
    in ArmAs rpt file, which is in c:\Users\%username%\AppData\Local\Arma 3\

    0 = no hints
    1 = show hints
    2 = quick simulation and time skipping for observation of what happens
    3 = write 100 calculations to .rpt so you can see the behaviour
    n = (with n>10): write n values to .rpt */
debugMode = 0;

/* Random seed (0 .. 999999)
    the same seed will give you the same weather development
    0 = mod chooses a random seed number. You will find it in rpt in any case. */
randomSeed = 0;

/* Script delay in seconds
    Example:
    10: This will delay execution for 10 seconds, initial weather will be applied
        immediately and harsh after 10 seconds.
    -1200: (negative values) Weather will stay as set by mission maker and will trend
        towards this scripts initial weather in 1200 seconds = 20 minutes. */
delaySeconds = 0;

/* Load island templates at mission start?
   They are stored in: Arma 3\userconfig\tort_DynamicWeather\tort_islands.sqf
*/
islandTemplates = 1;