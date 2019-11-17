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

set SERVICE_NAME=wuauserv
echo Service name: '%SERVICE_NAME%'

sc config %SERVICE_NAME% start= disabled
sc stop %SERVICE_NAME%
ping 127.0.0.1 -n 6 > nul
sc query %SERVICE_NAME% | findstr /i "STATE"
goto END

:CHECK_STATUS	
for /F "tokens=3 delims=: " %%H in ('sc query %SERVICE_NAME% ^| findstr "        STATE"') do (
  if /I "%%H" NEQ "RUNNING" (
   REM Put your code you want to execute here
   REM For example, the following line
   'net start "MyServiceName"
  )
    if /I "%%H" NEQ "RUNNING" (
   REM Put your code you want to execute here
   REM For example, the following line
   'net start "MyServiceName"
  )
)

:END
ECHO Press any key to exit
    pause >nul
	
	

REM SC CONFIG "<nameservice>" START= ( BOOT, or SYSTEM, or AUTO, or DEMAND, or DISABLED, or DELAYED-AUTO )