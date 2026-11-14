@echo off
setlocal

set "TARGET=%~dp0index.html"

if not exist "%TARGET%" (
    echo Error: index.html was not found in "%~dp0"
    pause
    exit /b 1
)

setlocal EnableDelayedExpansion
set "URI=!TARGET:\=/!"
set "URI=!URI: =%%20!"
set "URI=!URI:#=%%23!"

set "APP_PROFILE=%LOCALAPPDATA%\EdgeAppLauncher_Profile"

start "" /max msedge --app="file:///!URI!" --user-data-dir="%APP_PROFILE%" --disable-sync --no-first-run --no-default-browser-check --start-maximized --window-position=0,0
exit /b 0