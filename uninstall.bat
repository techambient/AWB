@echo off
setlocal

set "DEST=C:\awb-v2"
set "SHORTCUT=Ambient Web Builder.lnk"
set "DESKTOP_LNK=%USERPROFILE%\Desktop\%SHORTCUT%"
set "STARTMENU_LNK=%APPDATA%\Microsoft\Windows\Start Menu\Programs\%SHORTCUT%"

:: 1. Remove the Desktop shortcut
if exist "%DESKTOP_LNK%" (
    del /F /Q "%DESKTOP_LNK%" >nul
)

:: 2. Remove the Start Menu shortcut
if exist "%STARTMENU_LNK%" (
    del /F /Q "%STARTMENU_LNK%" >nul
)

:: 3. Move working directory out of C:\awb-v2 in case uninstall.bat is stored inside it
cd /d "%TEMP%"

echo.
echo Uninstall completed.
pause

:: 4. Remove C:\awb-v2 and all copied files/subfolders, then exit cleanly
if exist "%DEST%" (
    rmdir /S /Q "%DEST%"
    exit
)