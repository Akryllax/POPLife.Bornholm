@echo on
if "%ProgramFiles(x86)%"=="" set ProgramFiles(x86)=%ProgramFiles%
set configfile="%ProgramFiles(x86)%\Steam\SteamApps\common\Arma 3\userconfig\tort_DynamicWeather\tort_DynamicWeather_config.hpp"
if exist %configfile% goto :configexists:

:copyConfigFile:
mkdir "%ProgramFiles(x86)%\Steam\SteamApps\common\Arma 3\userconfig"
xcopy /d /y /e "userconfig\*" "%ProgramFiles(x86)%\Steam\SteamApps\common\Arma 3\userconfig\*"

:configexists:
rem if exist %configfile% start "" /b "%windir%\notepad.exe" "%ProgramFiles(x86)%\Steam\SteamApps\common\Arma 3\userconfig\tort_DynamicWeather\tort_DynamicWeather_config.hpp"

pause