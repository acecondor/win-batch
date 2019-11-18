@echo off
cls
explorer.exe "C:\Users\%username%\AppData\Local\Spotify\Data"
echo.
echo Close Spotify and and delete all folders and files 
echo.
pause
cls
echo.
echo Enter this option in at the bottom of the list or modify value if already present:
echo storage.size=*desired amount of megabytes*
echo example: storage.size=1024 = 1GB
echo Remember to save the file.
echo.
"%ProgramFiles%\Windows NT\Accessories\wordpad.exe" "C:\Users\%username%\AppData\Roaming\Spotify\prefs"
echo.
pause
