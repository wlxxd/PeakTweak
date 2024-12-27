@echo off
:: CheckMate by wlxd
:: Ensure admin privileges
fltmc >nul 2>&1 || (
    echo Administrator privileges are required.
    PowerShell Start -Verb RunAs '%0' 2> nul || (
        echo Right-click on the script and select "Run as administrator".
        pause & exit 1
    )
    exit 0
)
:: Initialize environment
setlocal EnableExtensions DisableDelayedExpansion


::: 
:::    ____             __  ______                    __      __                      __         __
:::   / __ \___  ____ _/ /_/_  __/      _____  ____ _/ /__   / /_  __  __   _      __/ /  ______/ /
:::  / /_/ / _ \/ __ `/ //_// / | | /| / / _ \/ __ `/ //_/  / __ \/ / / /  | | /| / / / |/_/ __  / 
::: / ____/  __/ /_/ / ,<  / /  | |/ |/ /  __/ /_/ / ,<    / /_/ / /_/ /   | |/ |/ / />  </ /_/ /  
:::/_/    \___/\__,_/_/|_|/_/   |__/|__/\___/\__,_/_/|_|  /_.___/\__, /    |__/|__/_/_/|_|\__,_/   
:::                                                             /____/                             
:::


for /f "delims=: tokens=*" %%A in ('findstr /b ::: "%~f0"') do @echo(%%A

echo Loading all subscripts...
echo THIS IS THE REVERTER FOR PEAKTWEAK, use PeakTweak.bat for tweaking your PC.
SLEEP 5

echo EXPERIMENTAL VERSION v1
echo WARNING: Changes made by this tweak may be difficult to reverse or require to reinstall Windows completely.
echo This Reverter tries to undo all changes to it´s best, but it can´t revert everything.
echo Reinstall Windows completely for a full revert of all changes.
echo Please read the disclaimer.txt file before proceeding.
echo This script does provide partial custom installation. All changes will be made.

echo Credits to Khorvie Tech on YouTube, his tweaks are used in this script.
echo Press ENTER to continue or close this window to exit...
pause >nul

cls
SLEEP 2

echo PeakTweak should have automatically created a restore point.
echo Select the Restore Point created by PeakTweak and press restore. You need to restart your PC and execute the reverter again.

start rstrui.exe

echo Done? Press enter to continue the script.
pause >nul
cls

echo The Powerconfig menu should open shortly. Deselect the Khorvie Powerplan by selecting the balanced powerplan.
start powercfg.cpl

echo Done? Press enter to continue the script.
pause >nul
cls

echo UnparkCPU will be now opened as administrator. If you had parked Cores, select them and then apply.
echo If you don´t remember, then you most likely can leave it as it.

powershell -Command "Start-Process -FilePath '%~dp0oct\UnparkCpu.exe' -Verb RunAs"

echo Done? Press enter to continue the script.
pause >nul
cls
echo Reactivating all services: Bluettoth, Geolocation, Hyper V,  Printer, Windows Audio, Search.

:: Background Intelligent Transfer Service
echo Activating: Background Intelligent Transfer Service
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BITS" /v "Start" /t REG_DWORD /d 2 /f
echo.

:: Bluetooth Audio Gateway
echo Activating: Bluetooth Audio Gateway
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BTAGService" /v "Start" /t REG_DWORD /d 2 /f
echo.

:: Bluetooth Support Service
echo Activating: Bluetooth Support Service
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\bthserv" /v "Start" /t REG_DWORD /d 2 /f
echo.

:: Geolocation Service
echo Activating: Geolocation Service
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\lfsvc" /v "Start" /t REG_DWORD /d 2 /f
echo.

:: Hyper-V and Virtualization Services
echo Activating: Hyper-V and Virtualization Services
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\HvHost" /v "Start" /t REG_DWORD /d 2 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\vmickvpexchange" /v "Start" /t REG_DWORD /d 2 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\vmicguestinterface" /v "Start" /t REG_DWORD /d 2 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\vmicshutdown" /v "Start" /t REG_DWORD /d 2 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\vmicheartbeat" /v "Start" /t REG_DWORD /d 2 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\vmicvmsession" /v "Start" /t REG_DWORD /d 2 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\vmicrdv" /v "Start" /t REG_DWORD /d 2 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\vmictimesync" /v "Start" /t REG_DWORD /d 2 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\vmicvss" /v "Start" /t REG_DWORD /d 2 /f
echo.

:: Phone Service
echo Activating: Phone Service
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\PhoneSvc" /v "Start" /t REG_DWORD /d 2 /f
echo.

:: Printer Spooler
echo Activating: Printer Spooler
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Spooler" /v "Start" /t REG_DWORD /d 2 /f
echo.

:: Quality Windows Audio Visual Experience (QWAVE)
echo Activating: QWAVE Service
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\QWAVE" /v "Start" /t REG_DWORD /d 2 /f
echo.

:: Prefetcher (SysMain)
echo Activating: SysMain (Prefetcher)
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SysMain" /v "Start" /t REG_DWORD /d 2 /f
echo.

:: Connected User Experiences and Telemetry
echo Activating: Connected User Experiences and Telemetry
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\DiagTrack" /v "Start" /t REG_DWORD /d 2 /f
echo.

:: Windows Search
echo Activating: Windows Search
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WSearch" /v "Start" /t REG_DWORD /d 2 /f
echo.

SLEEP 5
cls
echo Sysinternals Autoruns will be started shortly. Uncheck/Check all programs which shouldn´t/should start on PC-Startup.
SLEEP 5
powershell -Command "Start-Process -FilePath '%~dp0oct\AutoRuns.exe' -Verb RunAs"
echo List of programs which could be turned on back again: OneDrive, Edge, NvTmRep_CrashReport, NvProfileUpdater, NvDriverUpdateCheckDaily, NvProfileUpdaterOnLogOn, FvSvc, Bluetooth (if disabled) and programs you don´t need.
echo Done? Press enter to continue the script.
pause >nul

SLEEP 2
cls

:gamemode
echo Do you want to enable or disable Game Mode? This does not influence any experience on your PC. We recommend to leave it on.
echo [1] Enable Game Mode
echo [2] Disable Game Mode
set /p choice=Enter your choice (1/2):

if "%choice%"=="1" (
    echo Enabling Game Mode...
    powershell -Command "Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\GameBar' -Name 'AutoGameMode' -Value 1"
    echo Game Mode has been enabled.
) else if "%choice%"=="2" (
    echo Disabling Game Mode...
    powershell -Command "Set-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\GameBar' -Name 'AutoGameMode' -Value 0"
    echo Game Mode has been disabled.
) else (
    echo Invalid choice. Please enter 1, 2 or 3.
    goto gamemode
)

echo.

SLEEP 2
cls
:ask
echo Do you want to enable or disable Game Bar?
echo [1] Enable Game Bar
echo [2] Disable Game Bar
set /p choice=Enter your choice (1/2):

if "%choice%"=="1" (
    echo Enabling Game Bar...
    powershell -Command "Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\GameBar' -Name 'AutoGameBar' -Value 0"
    echo Game Bar has been enabled.
) else if "%choice%"=="2" (
    echo Disabling Game Bar...
    powershell -Command "Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\GameBar' -Name 'AutoGameBar' -Value 1"
    echo Game Bar has been disabled.
) else (
    echo Invalid choice. Please enter 1 or 2.
    goto ask
)
SLEEP 2
cls
:MENU
echo Please select your graphics card type:
echo 1 - AMD
echo 2 - NVIDIA
echo 3 - done, restarted (skip)
set /p choice=Enter your choice (1,2 or 3): 

if "%choice%"=="1" (
    echo You selected AMD. Use this to revert all changes.
    start https://docs.google.com/document/d/1hYIXNzCrFJnSDINyUdqlwYud3DaTqcq7JOO7t3wBQXA/edit
    goto AFTER
)

if "%choice%"=="2" (
    echo You selected NVIDIA.
    echo Start the NVIDIA App and install the newest driver for your graphics card.
    echo If you don´t have the NVIDIA App. Install it from their website.
    echo Done? Press enter to continue the script.
    pause >nul

    echo Starting ProfileInspector...
    echo Select in the top bar the GLOBAL setting and press apply.
    SLEEP 3
    powershell -Command "Start-Process -FilePath '%~dp0oct\inspector\nvidiaProfileInspector.exe' -Verb RunAs"
    explorer "%~dp0oct\inspector\"
    SLEEP 2
    echo Done? Press enter to continue the script.
    pause >nul
    goto AFTER
)
if "%choice%"=="3" (
    echo Skipped GPU Tweak Reverter.
    goto AFTER
)

echo Invalid choice. Please try again.
timeout /t 2 >nul
goto MENU

:AFTER

echo Registry Tweaks can´t be reverted easily. If you followed the PeakTweak instructions, you should have a backup of your registry. Apply it.
echo If not, we will now try to revert all changes as best as we can.

echo Reverting Driver Searching to default...
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\DriverSearching" /v "SearchOrderConfig" /t REG_DWORD /d 1 /f
echo Driver Searching enabled.

echo Reverting HiberBoot and Hibernate to default...
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v "HiberBootEnabled" /t REG_DWORD /d 1 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power" /v "HibernateEnabled" /t REG_DWORD /d 1 /f
echo HiberBoot and Hibernate enabled.

echo Reverting Prefetcher to default...
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnablePrefetcher" /t REG_DWORD /d 3 /f
echo Prefetcher enabled.

echo Reverting Explorer's startup delay to default...
reg delete "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Serialize" /v "StartupDelayInMSec" /f
echo Explorer startup delay reverted.

echo Reverting mouse hover delay to default...
reg add "HKEY_CURRENT_USER\Control Panel\Mouse" /v "MouseHoverTime" /t REG_SZ /d "400" /f
echo Mouse hover delay set to 400.

echo Reverting menu show delay to default...
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v "MenuShowDelay" /t REG_SZ /d "400" /f
echo Menu show delay set to 400.


SLEEP 2
cls

echo Starting TCPOptimizer
SLEEP 2
powershell -Command "Start-Process -FilePath '%~dp0oct\TCPOptimizer.exe' -Verb RunAs"
SLEEP 2
echo Select Windows Default at the bottom and apply.
SLEEP 5
echo Done? Press enter to continue the script.
pause >nul
cls

echo Starting SystemExplorerSetup. (Do not delete after tweak.)
SLEEP 5
powershell -Command "Start-Process -FilePath '%~dp0oct\SystemExplorerSetup' -Verb RunAs"
echo Complete Setup. Close security check. Reset explorer.exe Priority High and Permanent to normal.
echo Reset WinLogOn Priority BelowNormal Permanent to normal.
SLEEP 2
echo Done? Press enter to continue the script.
pause >nul

echo Starting WPD. (Windows Telemetry)
SLEEP 5
powershell -Command "Start-Process -FilePath '%~dp0oct\WPD.exe' -Verb RunAs"
echo Revert Telemetry, Revert Telemetry IPs
echo In Blocker, revert all changes.
echo Revert all changes you did by pressing the revert button. (DO NOT DELETE ALL! YOU WILL NEED TO REINSTALL WINDOWS IF YOU DO!)
SLEEP 2
echo Done? Press enter to continue the script.
pause >nul

echo Starting WPD. (Windows Telemetry)
SLEEP 5
powershell -Command "Start-Process -FilePath '%~dp0oct\OOSU10.exe' -Verb RunAs"
echo Revert all changes.
SLEEP 2
echo Done? Press enter to continue the script.
pause >nul


echo Done. Press enter to terminate the script.
pause >nul

exit
