@echo off
setlocal enabledelayedexpansion

:: === Config Options ===

:: set all Discord installation locations where vencord should be installed
:: seperated by spaces. Exapmple: "installList=stable ptb canary"
:: if the installation doesnt exist, it gets skipped. 
set "installList=stable ptb"

:: Wether to Autostart Discord after updating or not
:: 1 = true, 0 = false
set "startDiscord=1"

:: Wether to keep the Terminal open or close it after the script finishes
:: 1 = true, 0 = false
set "keepTerminalOpen=0"


:: === Find Discord Installation Directory ===
set "discordNames_stable=Discord"
set "discordNames_ptb=DiscordPTB"
set "discordNames_canary=DiscordCanary"
::set "discordNames_dev=DiscordDevelopment"

call :main
exit /b

:main
:: Check AppData exists
if not exist "%LOCALAPPDATA%\" (
    echo [ERROR] AppData directory not found
    set "errorOccurred=1"
    goto :end
)

set "foldersToPatch=uadhosiuhoi"
set "errorOccurred=0"

for %%i in (%installList%) do (
    set "currentPath=%LOCALAPPDATA%\!discordNames_%%i!"
    echo [INFO] Checking !currentPath!

    if not exist "!currentPath!\" (
        echo [WARN] !discordNames_%%i! folder not found
    ) else (
        set "highestAppFolder="
        set "highestVersion="

        for /d %%F in ("!currentPath!\app-*") do (
            echo [INFO] Checking folder: %%F
            set "folderName=%%~nxF"
            set "version=!folderName:~4!"
            set "versionCompare=!version:.=!"

            if not defined highestVersion (
                set "highestVersion=!versionCompare!"
                set "highestAppFolder=%%F"
            ) else (
                if !versionCompare! GTR !highestVersion! (
                    set "highestVersion=!versionCompare!"
                    set "highestAppFolder=%%F"
                )
            )
        )

        if defined highestAppFolder (
            echo [INFO] Highest !discordNames_%%i! version folder: !highestAppFolder!
            if exist "!highestAppFolder!\resources\_app.asar" (
                echo [INFO] Vencord already installed in !highestAppFolder!
            ) else (
                echo [INFO] Vencord not installed in !highestAppFolder!
                if defined foldersToPatch (
                    set "foldersToPatch=!foldersToPatch! !currentPath!"
                ) else (
                    set "foldersToPatch=!currentPath!"
                )
            )
        ) else (
            echo [WARN] No app-* folders found for !discordNames_%%i!
        )
    )
)

:: When there are no installations to patch, exit
if not defined foldersToPatch (
    echo [INFO] No Installations to Patch. Exiting...
    goto :end
)

:: === Configure URL and Filename ===
set "CLI_URL=https://github.com/Vencord/Installer/releases/latest/download/VencordInstallerCli.exe"
set "CLI_FILE=VencordInstallerCli.exe"

:: === Create Temporary Directory ===
set "TEMP_DIR=%TEMP%\cli_temp_%RANDOM%"
mkdir "%TEMP_DIR%"
cd /d "%TEMP_DIR%"

:: === Download CLI File ===
echo [INFO] Downloading %CLI_FILE%...
powershell -Command "Invoke-WebRequest -Uri '%CLI_URL%' -OutFile '%CLI_FILE%'"
if not exist "%CLI_FILE%" (
    echo [ERROR] Download failed.
    set "errorOccurred=1"
    goto :end
)

:: === Run CLI File ===
echo [INFO] Starting %CLI_FILE%...
for %%i in (%foldersToPatch%) do (
    echo [INFO] Patching "%%i"
    "%CLI_FILE%" -install "-location=%%i"
)

if errorlevel 1 (
    echo [ERROR] Running %CLI_FILE% failed.
    set "errorOccurred=1"
    goto :end
)

:: === Clean up Temporary Directory ===
echo [INFO] Deleting %CLI_FILE%...
del "%CLI_FILE%"
cd ..
rmdir "%TEMP_DIR%"

echo [INFO] Done.

:end


if "%errorOccurred%"=="1"  (
    pause
) else (
    
)

if "%keepTerminalOpen%"=="1" (
    pause
)
exit /b