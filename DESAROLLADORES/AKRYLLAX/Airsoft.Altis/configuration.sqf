if(isNil "airsoft_redGroup") then
{
	airsoft_redGroup = createGroup OPFOR;
	publicVariable "airsoft_redGroup";
};
if(isNil "airsoft_blueGroup") then
{
	airsoft_blueGroup = createGroup OPFOR;
	publicVariable "airsoft_blueGroup";
};

life_playing_airsoft = false;

player setVariable["realname", profileName, true];