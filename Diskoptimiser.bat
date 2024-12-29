@echo off
:: Script to optimize a selected drive using CHKDSK

:: Prompt user to enter the drive letter
echo Enter the drive letter you want to optimize (e.g., C, D, E):
set /p DRIVE=Drive Letter: 

:: Add colon to the drive letter
set DRIVE=%DRIVE%:

:: Confirm the drive with the user
echo You selected drive %DRIVE%. Proceeding with optimization...
echo This may take some time. Please wait...

:: Run CHKDSK with /F (fix) and /R (locate bad sectors and recover readable data)
chkdsk %DRIVE% /F /R

:: Notify user upon completion
echo.
echo Optimization for drive %DRIVE% completed.
echo Press any key to exit.
pause >nul
exit
