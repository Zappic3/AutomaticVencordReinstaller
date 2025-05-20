@echo off
setlocal

:: === Configure URL and Filename ===
set "CLI_URL=https://github.com/Vencord/Installer/releases/latest/download/VencordInstallerCli.exe"
set "CLI_FILE=VencordInstallerCli.exe"

:: === Create Temporary Directory ===
set "TEMP_DIR=%TEMP%\cli_temp_%RANDOM%"
mkdir "%TEMP_DIR%"
cd /d "%TEMP_DIR%"

:: === Download Cli-File ===
echo [INFO] Downloading %CLI_FILE%...
powershell -Command "Invoke-WebRequest -Uri '%CLI_URL%' -OutFile '%CLI_FILE%'"
if not exist "%CLI_FILE%" (
    echo [ERROR] Download failed.
    exit /b 1
)

:: === Run CLI-File ===
echo [INFO] Starting %CLI_FILE%...
"%CLI_FILE%"
if errorlevel 1 (
    echo [ERROR] Running %CLI_FILE% failed.
    exit /b 2
)

:: === Cleaning up Temporary Directory ===
echo [INFO] Deleting %CLI_FILE%...
del "%CLI_FILE%"
cd ..
rmdir "%TEMP_DIR%"

echo [INFO] Done.
endlocal
pause
