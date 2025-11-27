@echo off
REM Simple HTTP Server for Windows
REM This serves the portfolio on http://localhost:8000

cd /d "%~dp0"

echo 🚀 Starting Portfolio Server...
echo.

REM Try Python first
python --version >nul 2>&1
if %errorlevel% equ 0 (
    echo ✓ Using Python
    start http://localhost:8000
    python -m http.server 8000
    exit /b
)

REM Try Node.js
node --version >nul 2>&1
if %errorlevel% equ 0 (
    echo ✓ Using Node.js
    start http://localhost:8000
    node server.js
    exit /b
)

REM Try PHP
php --version >nul 2>&1
if %errorlevel% equ 0 (
    echo ✓ Using PHP
    start http://localhost:8000
    php -S localhost:8000
    exit /b
)

echo.
echo ❌ No server found. Please install one of:
echo    - Python (python.org)
echo    - Node.js (nodejs.org)
echo    - PHP (php.net)
echo.
pause
