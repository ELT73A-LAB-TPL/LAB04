@echo off
setlocal EnableDelayedExpansion

:: Set Default MCU Name
set "DEFAULT_MCU=STM32F411C(C-E)Ux"
set "SCRIPT_FILE=%TEMP%\LoadMCU.txt"

:: Check if arguments are passed, otherwise use defaults
if "%~1"=="" (
    set "MCU_NAME=%DEFAULT_MCU%"
) else (
    set "MCU_NAME=%~1"
)

echo load %MCU_NAME% >> %SCRIPT_FILE%

if defined STM32CubeMX_PATH (
    if exist "%STM32CubeMX_PATH%" (
        echo STM32CubeMX_PATH exists and points to a valid directory: %STM32CubeMX_PATH%
    ) else (
        echo STM32CubeMX_PATH is defined but the directory does not exist: %STM32CubeMX_PATH%
		pause
		exit /b 1
    )
) else (
    echo STM32CubeMX_PATH is not defined.
    pause
    exit /b 1
)

if defined STM32CLT_PATH (
    if exist "%STM32CLT_PATH%" (
        echo STM32CLT_PATH exists and points to a valid directory: %STM32CLT_PATH%
    ) else (
        echo STM32CLT_PATH is defined but the directory does not exist: %STM32CLT_PATH%
		pause
		exit /b 1
    )
) else (
    echo STM32CLT_PATH is not defined.
    pause
    exit /b 1
)

:: Set paths (adjust these based on your installation)
set "JAVA_PATH=%STM32CubeMX_PATH%\jre\bin\java.exe"

:: Check if Java exists
if not exist "%JAVA_PATH%" (
    echo Error: Java executable not found at %JAVA_PATH%
    echo Please install Java or update JAVA_PATH in the script.
    pause
    exit /b 1
)

:: Check if STM32CubeMX exists
if not exist "%STM32CUBEMX_PATH%" (
    echo Error: STM32CubeMX not found at %STM32CUBEMX_PATH%
    echo Please install STM32CubeMX or update STM32CUBEMX_PATH in the script.
    pause
    exit /b 1
)

:: Check if STM32CubeMX_PATH environment variable exists (optional)
if defined STM32CubeMX_PATH (
    echo Using STM32CubeMX_PATH: %STM32CubeMX_PATH%
    set "STM32CUBEMX_PATH=%STM32CubeMX_PATH%\STM32CubeMX.exe"
)

:: Run the command
echo Running STM32CubeMX...
if defined SCRIPT_FILE (
    "%JAVA_PATH%" -jar "%STM32CUBEMX_PATH%" -s "%SCRIPT_FILE%"
) else (
    "%JAVA_PATH%" -jar "%STM32CUBEMX_PATH%" -i
)

:: Check for errors
if %ERRORLEVEL% neq 0 (
    echo Error: STM32CubeMX failed with error code %ERRORLEVEL%
    pause
    exit /b %ERRORLEVEL%
)

echo STM32CubeMX executed successfully.
pause
endlocal
