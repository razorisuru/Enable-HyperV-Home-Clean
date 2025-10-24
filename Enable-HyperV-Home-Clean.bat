@echo off
cls
echo ======================================================
echo      🖥️  Enabling Hyper-V on Windows Home Edition
echo ======================================================
echo.
echo Checking system compatibility...

:: Check Windows version
ver | find "10." >nul
if %errorlevel% neq 0 (
    ver | find "11." >nul
    if %errorlevel% neq 0 (
        echo ❌ Unsupported Windows version. Only Windows 10 or 11 supported.
        pause
        exit /b
    )
)

:: Check admin rights
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Please run this script as Administrator.
    pause
    exit /b
)

:: Check virtualization support
systeminfo | find "Virtualization Enabled In Firmware" | find "Yes" >nul
if %errorlevel% neq 0 (
    echo ⚠️  Virtualization is disabled in BIOS/UEFI.
    echo Please enable Intel VT-x / AMD-V in BIOS, then rerun this script.
    pause
    exit /b
)

echo ✅ System checks passed. Enabling Hyper-V features...
echo This may take several minutes — please wait.
echo.

setlocal enabledelayedexpansion
set count=0
for /f %%i in ('dir /b %SystemRoot%\servicing\Packages\*Hyper-V*.mum 2^>nul') do (
    set /a count+=1
)

if %count%==0 (
    echo ❌ No Hyper-V package files found. Cannot continue.
    pause
    exit /b
)

set current=0
for /f %%i in ('dir /b %SystemRoot%\servicing\Packages\*Hyper-V*.mum 2^>nul') do (
    set /a current+=1
    cls
    echo ======================================================
    echo 🖥️  Enabling Hyper-V on Windows Home
    echo ======================================================
    echo Progress: !current! of %count% packages...
    dism /online /norestart /add-package:"%SystemRoot%\servicing\Packages\%%i" >nul
)

echo.
echo ✅ Installing core Hyper-V features...
Dism /online /enable-feature /featurename:Microsoft-Hyper-V-All /LimitAccess /ALL >nul

echo.
echo ======================================================
echo ✅ Hyper-V installation complete!
echo Please restart your computer to finish setup.
echo ======================================================
pause
exit /b
