@echo off
setlocal

set "DEST=C:\awb-v2"
set "SHORTCUT=Ambient Web Builder.lnk"

:: 1. Check if C:\awb-v2 exists; create it if it does not
if not exist "%DEST%" (
    mkdir "%DEST%"
)

:: 2. Copy all files and subfolders to C:\awb-v2, excluding setup.bat
robocopy "%~dp0." "%DEST%" /E /XF "setup.bat" "%~nx0" >nul

:: 3. Copy the shortcut to the Desktop
if exist "%DEST%\%SHORTCUT%" (
    copy /Y "%DEST%\%SHORTCUT%" "%USERPROFILE%\Desktop\" >nul
) else (
    echo Warning: "%SHORTCUT%" was not found in %DEST%.
)

:: 4. Copy the shortcut to the Start Menu
if exist "%DEST%\%SHORTCUT%" (
    copy /Y "%DEST%\%SHORTCUT%" "%APPDATA%\Microsoft\Windows\Start Menu\Programs\" >nul
)

:: 5. Notify completion
echo.
echo Setup completed.
pause