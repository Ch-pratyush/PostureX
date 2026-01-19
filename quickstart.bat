@echo off
REM Quick start script for PostureX (Windows)

echo.
echo 🚀 PostureX - Quick Start
echo ==========================
echo.

REM Check Node.js
where node >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo ❌ Node.js is not installed
    echo    Download: https://nodejs.org/
    exit /b 1
)

for /f "tokens=*" %%i in ('node --version') do set NODE_VERSION=%%i
for /f "tokens=*" %%i in ('npm --version') do set NPM_VERSION=%%i

echo ✅ Node.js %NODE_VERSION%
echo ✅ npm %NPM_VERSION%
echo.

echo Select which app to start:
echo 1) Web App (React)
echo 2) Mobile App (React Native)
echo.

set /p choice="Enter choice (1 or 2): "

if "%choice%"=="1" (
    echo.
    echo Starting Web App...
    echo 📖 Open your browser to: http://localhost:3000
    echo.
    cd web
    call npm install
    call npm start
) else if "%choice%"=="2" (
    echo.
    echo Starting Mobile App...
    echo 📱 Scan QR code with Expo Go app
    echo.
    cd mobile
    call npm install
    call npx expo start
) else (
    echo ❌ Invalid choice
    exit /b 1
)
