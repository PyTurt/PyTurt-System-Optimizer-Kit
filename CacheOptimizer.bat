@echo off
title Clear Cache
echo Clearing cache memory...

:: Clear temporary files for the current user
echo Clearing temporary files...
del /s /q %temp%\* >nul 2>&1
rd /s /q %temp% >nul 2>&1
md %temp% >nul 2>&1

:: Clear prefetch files
echo Clearing prefetch files...
del /s /q C:\Windows\Prefetch\* >nul 2>&1

:: Clear Windows Temp folder
echo Clearing system temporary files...
del /s /q C:\Windows\Temp\* >nul 2>&1
rd /s /q C:\Windows\Temp >nul 2>&1
md C:\Windows\Temp >nul 2>&1

:: Clear browser cache for Internet Explorer (if applicable)
echo Clearing Internet Explorer cache...
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 8 >nul 2>&1

:: Finished
echo Cache Optimized successfully!
pause
exit
