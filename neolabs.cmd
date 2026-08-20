@echo off
setlocal
set "NEOLABS_LAB_BASE_URL=https://pg1wb0sklb.execute-api.us-east-1.amazonaws.com"
set "ROOT=%~dp0"
if exist "%~dp0toolkit-root.txt" set /p ROOT=<"%~dp0toolkit-root.txt"
if not "%ROOT:~-1%"=="\" set "ROOT=%ROOT%\"
if not exist "%ROOT%tools\neolabs.py" (
  echo NeoLabs toolkit path is invalid. Run setup-windows.cmd again.
  exit /b 2
)
where py >nul 2>nul
if not errorlevel 1 (
  py -3 "%ROOT%tools\neolabs.py" %*
  exit /b %ERRORLEVEL%
)
where python >nul 2>nul
if not errorlevel 1 (
  python "%ROOT%tools\neolabs.py" %*
  exit /b %ERRORLEVEL%
)
echo Python 3.10 or newer is required. Install Python and run setup-windows.cmd again.
exit /b 9009
