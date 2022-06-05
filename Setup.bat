@echo off
title VirusConsole setup
echo Ready to setup VirusConsole.
pause

echo Enabling files...

rename Console.bat.dis Console.bat
rename Restarter.bat.dis Restarter.bat

echo Createing desktop shortcut...
:createshort
echo Set oWS = WScript.CreateObject("WScript.Shell") > CreateShortcut.vbs
echo sLinkFile = "%HOMEDRIVE%%HOMEPATH%\Desktop\Console.lnk" >> CreateShortcut.vbs
echo Set oLink = oWS.CreateShortcut(sLinkFile) >> CreateShortcut.vbs
echo oLink.TargetPath = "%cd%\Console.bat" >> CreateShortcut.vbs
echo oLink.Save >> CreateShortcut.vbs
cscript CreateShortcut.vbs
del CreateShortcut.vbs

echo Creating config...
:createconfig
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

echo Installing tools...
:installtools
curl -o temp.zip https://supercraftalex.000webhostapp.com/Tools.zip

echo unzipping...
Call :UnZipFile "%cd%\Tools" "%cd%\temp.zip"

del /f temp.zip

echo Installation finished!
pause
exit /b



:UnZipFile <ExtractTo> <newzipfile>
set vbs="%temp%\_.vbs"
if exist %vbs% del /f /q %vbs%
>%vbs%  echo Set fso = CreateObject("Scripting.FileSystemObject")
>>%vbs% echo If NOT fso.FolderExists(%1) Then
>>%vbs% echo fso.CreateFolder(%1)
>>%vbs% echo End If
>>%vbs% echo set objShell = CreateObject("Shell.Application")
>>%vbs% echo set FilesInZip=objShell.NameSpace(%2).items
>>%vbs% echo objShell.NameSpace(%1).CopyHere(FilesInZip)
>>%vbs% echo Set fso = Nothing
>>%vbs% echo Set objShell = Nothing
cscript //nologo %vbs%
if exist %vbs% del /f /q %vbs%