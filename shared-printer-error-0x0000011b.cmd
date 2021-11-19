@echo off

ECHO How to fix error code 0x0000011b that appears when printing 
ECHO after installing the September cumulative update KB5005565 in Windows 10.
ECHO Recently, several users have reported getting error code 0x0000011b after
ECHO they received the 14 September cumulative update.
ECHO You might not get printed paper in return for your document when trying
ECHO to print after installing KB5005565 on Windows 10 21H1, 20H2, or 2004.
ECHO Commonly, the error message is "Windows cannot connect to printer",
ECHO here is easy method to fix this printer error.
ECHO source: https://www.youtube.com/watch?v=Kq42ItBSvlY
ECHO.
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
ECHO.
ECHO Press any key to exit
    pause >nul

ECHO Add regedit key
REG ADD HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Print\ /v RpcAuthnLevelPrivacyEnabled /t REG_DWORD /d 0
ECHO Restart spooler
net stop spooler
net start spooler

:END
ECHO Press any key to exit
    pause >nul
