@echo off
title Shutdown Timer
color 0b
:: 0b = black background, cyan text

:menu
cls
color 0b
echo.
color 0e
echo -~ ~ ~ -- ~~-~ --- -~ - --- ~--~
echo            Shutdown Timer Script
echo -~ ~ ~ -- ~~-~ --- -~ - --- ~--~
color 0b
echo.
echo   [1]  Set shutdown timer
echo   [2]  Cancel shutdown
echo   [3]  Exit
echo.
color 0e
echo -~ ~ ~ -- ~~-~ --- -~ - --- ~--~
color 0b
echo.
set /p choice=Choose an option (1-3): 

if "%choice%"=="1" goto set
if "%choice%"=="2" goto cancel
if "%choice%"=="3" exit
goto menu

:set
cls
color 0e
echo -~ ~ ~ -- ~~-~ --- -~ - --- ~--~
echo             Set Shutdown Timer
echo -~ ~ ~ -- ~~-~ --- -~ - --- ~--~
color 0b
echo Examples: 1h30m   2h   45
echo (Plain number = minutes)
color 0e
echo -~ ~ ~ -- ~~-~ --- -~ - --- ~--~
color 0b
echo.
set /p input=Enter time: 

:: abort old timer first
shutdown -a >nul 2>&1

set /a hours=0
set /a minutes=0
set "rest="

:: parse hours
echo %input% | findstr /i "h" >nul
if %errorlevel%==0 (
    for /f "tokens=1* delims=h" %%a in ("%input%") do (
        set /a hours=%%a
        if not "%%b"=="" set "rest=%%b"
    )
) else (
    set "rest=%input%"
)

:: parse minutes
if defined rest (
    echo %rest% | findstr /i "m" >nul
    if %errorlevel%==0 (
        for /f "tokens=1 delims=m" %%c in ("%rest%") do set /a minutes=%%c
    ) else (
        set /a minutes=%rest%
    )
)

:: calculate total
set /a seconds=(hours*3600)+(minutes*60)

if %seconds% LEQ 0 (
    color 0c
    echo.
    echo [!] Invalid time format.
    pause
    goto menu
)

shutdown -s -t %seconds%
color 0a
echo.
echo [OK] PC will shut down in %hours% hour(s) and %minutes% minute(s).
pause
goto menu

:cancel
cls
shutdown -a
color 0a
echo.
echo [OK] Shutdown cancelled (if one was active).
pause
goto menu
