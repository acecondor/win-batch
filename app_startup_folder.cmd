# v2020.05.24.01
# Maurizio Condini - www.defcon.it

@echo off

rem %SystemDrive% operation system drive
rem %HOMEDRIVE% documents drive

echo.
echo C - current user startup folder
echo A - all users startup folder
echo B - both (corrent and all users)
echo Press enter to exit
echo.
SET /P ENABLE=[C, A, B press ENTER to exit]

IF /I "%ENABLE%"=="C" goto CURRENT_USER
IF /I "%ENABLE%"=="A" goto ALL_USERS
IF /I "%ENABLE%"=="B" goto BOTH

goto END

:CURRENT_USER
explorer.exe "%HOMEDRIVE%\Users\%username%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"
goto END

:ALL_USERS
explorer.exe "%HOMEDRIVE%\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup"
goto END

:BOTH
explorer.exe "%HOMEDRIVE%\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup"
explorer.exe "%HOMEDRIVE%\Users\%username%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"
goto END

:END
exit

