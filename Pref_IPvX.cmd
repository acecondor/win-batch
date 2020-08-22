@echo off
rem reference: https://support.microsoft.com/en-us/help/929852/guidance-for-configuring-ipv6-in-windows-for-advanced-users
rem ################################
rem # (C) Maurizio Condini 2020    #
rem # https://github.com/acecondor #
rem # https://blog.defcon.it       #
rem #       v. 2020.08.22.001      #
rem ################################
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
set "reg_read=reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip6\Parameters" /v DisabledComponentsTEST"
for /f "usebackq tokens=1-3 delims= " %%a in (`%reg_read%`) do (
  set current_value=%%c
)

echo.
echo A - Prefer IPv4 over IPv6 (0x20)
echo B - Disable IPv6 (0xFF)
echo C - Disable IPv6 on all nontunnel interfaces (0x10)
echo D - Disable IPv6 on all tunnel interfaces (0x01)
echo E - Disable IPv6 on all nontunnel interfaces (except the loopback) and on IPv6 tunnel interface (0x11)
echo X - Delete registry key (default setting)
echo Z - EXIT
echo.
echo Current value: %current_value%
echo.

choice /N /C:ABCDEXZ /M "Press key A-E, X or Z to exit"

if errorlevel 7 goto END
if errorlevel 6 goto DELETE
if errorlevel 5 set reg_value="0x11" & goto SETREG
if errorlevel 4 set reg_value="0x01" & goto SETREG
if errorlevel 3 set reg_value="0x10" & goto SETREG
if errorlevel 2 set reg_value="0xFF" & goto SETREG
if errorlevel 1 set reg_value="0x20" & goto SETREG

:SETREG
echo Set value: %reg_value%
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip6\Parameters" /v DisabledComponentsTEST /t REG_DWORD /d %reg_value% /f
goto END

:DELETE
echo Delete registry key
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip6\Parameters" /v DisabledComponentsTEST /f
goto END

:END
ECHO Press any key to exit
pause >nul