@echo off

rem %SystemDrive% operation system drive
rem %HOMEDRIVE% documents drive

echo.
echo U - current user startup folder
echo A - all users startup folder
echo Press enter to exit
echo.
SET /P ENABLE=[U, A, press ENTER to exit]

IF /I "%ENABLE%"=="U" goto CURRENT_USER
IF /I "%ENABLE%"=="A" goto ALL_USERS

goto END

:CURRENT_USER
explorer.exe "%HOMEDRIVE%\Users\%username%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"


:ALL_USERS:
explorer.exe "%HOMEDRIVE%\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup"

:END
exit

