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

echo Takeown Windows.old 
takeown /F %SystemDrive%\Windows.old /R /A
echo.
echo Enable access for administrator
echo y|cacls %SystemDrive%\Windows.old\*.* /T /grant administrators:F
echo.
echo Remove Windows.old 
rmdir /S /Q %SystemDrive%\Windows.old\
echo.

:END
ECHO Press any key to exit
    pause >nul
	