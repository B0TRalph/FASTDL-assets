@echo off
setlocal enabledelayedexpansion

:: Path to your 7-Zip executable
set "sevenzip=C:\Program Files\7-Zip\7z.exe"

:: Check if 7-Zip exists
if not exist "%sevenzip%" (
    echo 7-Zip not found at %sevenzip%
    echo Please check the path in the script.
    pause
    exit /b
)

:: Loop through every file in the current directory
for %%F in (*) do (
    :: Skip the script itself and any already existing .bz2 files
    if not "%%~nxF"=="%~nx0" if not "%%~xF"==".bz2" (
        echo Compressing and removing: %%F
        "%sevenzip%" a -tbzip2 -sdel "%%~nF%%~xF.bz2" "%%F"
    )
)

echo.
echo Compression and cleanup complete!
pause