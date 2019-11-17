@echo off

echo Check trim status... 
echo 0 = enable 1 = disable
echo.
fsutil behavior query DisableDeleteNotify
echo.

goto check_Permissions

:check_Permissions
    echo Administrative permissions required. Detecting permissions...

    net session >nul 2>&1
    if %errorLevel% == 0 (
		color 02
        echo Success: Administrative permissions confirmed.
		echo.
		goto OK_ADMIN
    ) else (
		color 04
        echo Failure: Current permissions inadequate.
		echo.
		goto END
    )
	

:OK_ADMIN

echo Digit Y and press enter to enable trim
echo Digit N and press enter to disable trim
echo Press enter to exit
echo.
SET /P ENABLE=[Digit Y and press enter to enable trim, digit N and press enter to disable]

IF "%ENABLE%"=="Y" fsutil behavior set DisableDeleteNotify 0
IF "%ENABLE%"=="N" fsutil behavior set DisableDeleteNotify 1

goto END

:END
ECHO Press any key to exit
    pause >nul
	
	

REM SC CONFIG "<nameservice>" START= ( BOOT, or SYSTEM, or AUTO, or DEMAND, or DISABLED, or DELAYED-AUTO )