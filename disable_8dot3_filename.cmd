@echo off
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

SET /P DRIVE_LETTER=[Digit drive letter (letter only) to disable 8dot3 filename, press enter to C]

IF "%DRIVE_LETTER%"=="" SET DRIVE_LETTER=C
echo Drive letter: '%DRIVE_LETTER%'

fsutil 8dot3name strip /f /s C:

goto END

:END
ECHO Press any key to exit
    pause >nul
	
	

REM SC CONFIG "<nameservice>" START= ( BOOT, or SYSTEM, or AUTO, or DEMAND, or DISABLED, or DELAYED-AUTO )