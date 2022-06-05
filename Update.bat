@echo off
title Updater

echo Ready to update
pause
curl -o Console.bat https://raw.githubusercontent.com/SuperCraftAlex/AdvancedWindowsConsole/main/Console.bat.dis

echo Update finished. If something doesnt work then rerun this script and press [2].
echo Press [1] to continue.

SET /P M=
IF %M%==1 goto end
IF %M%==2 goto reconfig

:end
exit

:reconfig
del /f Console.cfg

echo #Main Color (NOT USED)>> Console.cfg
echo 00>> Console.cfg
echo #Color Input Dialoge>> Console.cfg
echo 92>> Console.cfg
echo #Color Command Output>> Console.cfg
echo 94>> Console.cfg
echo #Color Input Text>> Console.cfg
echo 91>> Console.cfg
echo #Code Folder PATH>> Console.cfg
echo %cd%>> Console.cfg

echo Everything should work now! If something is still broken, please read the update log in the github repository!
pause
exit