@echo off
setlocal
title NeoLabs Windows Readiness Check
echo NeoLabs Windows readiness check
echo.
set "PY_OK=0"
where py >nul 2>nul
if not errorlevel 1 (
  py -3 -c "import sys; raise SystemExit(0 if sys.version_info >= (3,10) else 1)" >nul 2>nul
  if not errorlevel 1 set "PY_OK=1"
)
if "%PY_OK%"=="0" (
  where python >nul 2>nul
  if not errorlevel 1 (
    python -c "import sys; raise SystemExit(0 if sys.version_info >= (3,10) else 1)" >nul 2>nul
    if not errorlevel 1 set "PY_OK=1"
  )
)
if "%PY_OK%"=="0" (
  echo [MISSING] Python 3.10 or newer
  echo Install or update Python, then run this file again.
  pause
  exit /b 1
)
echo [OK] Python 3.10+ detected
where ssh >nul 2>nul
if errorlevel 1 (
  echo [MISSING] Windows OpenSSH Client
  echo Install OpenSSH Client from Windows Optional Features before a live tunnel session.
) else (
  echo [OK] OpenSSH Client detected
)
call "%~dp0neolabs.cmd" --help >nul
if errorlevel 1 (
  echo [ERROR] NeoLabs launcher self-check failed.
  pause
  exit /b 1
)
echo [OK] NeoLabs launcher ready
echo.
echo No pip installation or PATH editing is required.
echo From this toolkit folder, use: .\neolabs.cmd login
echo.
pause
