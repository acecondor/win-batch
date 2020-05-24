@echo off

rem %SystemDrive% operation system drive
rem %HOMEDRIVE% documents drive

echo.
echo C - current user startup folder
echo A - all users startup folder
echo B - both (corrent and all users)
echo E - EXIT
echo.

choice /n /c:CABE /M "Press C, A, B or E to exit"

if errorlevel 1 goto CURRENT_USER
if errorlevel 2 goto ALL_USERS
if errorlevel 3 goto BOTH
if errorlevel 4 goto END

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
