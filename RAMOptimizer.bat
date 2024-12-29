@echo off
title Continuous Safe RAM Optimizer
color 0A
:menu
cls
echo ============================================
echo          Continuous Safe RAM Optimizer
echo ============================================
echo [1] Show Memory Usage
echo [2] Continuous Memory Cleanup (Safe Mode)
echo [3] Exit
echo ============================================
set /p choice=Choose an option (1-3): 

if %choice%==1 goto show_memory
if %choice%==2 goto continuous_clean_memory
if %choice%==3 exit
goto menu

:show_memory
cls
echo ============================================
echo           Memory Usage Information
echo ============================================
systeminfo | findstr /C:"Available Physical Memory"
systeminfo | findstr /C:"Total Physical Memory"
echo ============================================
pause
goto menu

:continuous_clean_memory
cls
echo ============================================
echo    Continuous Memory Cleanup (Safe Mode)
echo Press Ctrl+C to stop the process.
echo ============================================
:: Start infinite loop for memory cleanup
:cleanup_loop
cls
echo Cleaning up memory...
:: List of processes to skip (essential processes)
set skip_list=explorer.exe winlogon.exe csrss.exe services.exe lsass.exe

:: Loop through all running tasks
for /f "tokens=1 delims= " %%A in ('tasklist /FI "STATUS eq running"') do (
    echo %%A | findstr /I "%skip_list%" >nul
    if errorlevel 1 (
        echo Attempting to close: %%A
        taskkill /F /IM %%A >nul 2>&1
    ) else (
        echo Skipping critical process: %%A
    )
)

:: Ensure explorer.exe is running
echo Checking if explorer.exe is running...
tasklist | findstr /I "explorer.exe" >nul
if errorlevel 1 (
    echo explorer.exe is not running. Restarting it...
    start explorer.exe
) else (
    echo explorer.exe is already running.
)

echo ============================================
echo Memory cleanup cycle completed.
timeout /t 5 >nul
goto cleanup_loop

