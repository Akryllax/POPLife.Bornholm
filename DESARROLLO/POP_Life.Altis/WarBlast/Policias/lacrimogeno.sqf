//Lacrimogeno

While{true} do
{
    "dynamicBlur" ppEffectEnable true; // enables ppeffect
    "dynamicBlur" ppEffectAdjust [0]; // enables normal vision
    "dynamicBlur" ppEffectCommit 10; // time it takes to normal
    resetCamShake; // resets the shake
    20 fadeSound 1;     //fades the sound back to normal


    waituntil{
    ((nearestObject [getpos player, "SmokeShellBlue"]) distance player < 5)
    and
    (getpos (nearestObject [getpos player, "SmokeShellBlue"]) select 2 < 0.5)
    };

    if (headgear player != "H_CrewHelmetHeli_B") then
    {
        "dynamicBlur" ppEffectEnable true; // enables ppeffect
        "dynamicBlur" ppEffectAdjust [12]; // intensity of blur
        "dynamicBlur" ppEffectCommit 3; // time till vision is fully blurred
        enableCamShake true;     // enables camera shake
        addCamShake [10, 45, 10];    // sets shakevalues
        5 fadeSound 0.1;     // fades the sound to 10% in 5 seconds

    };

    sleep 5;
};