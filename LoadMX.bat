@echo off
setlocal EnableDelayedExpansion

:: Set Default Project Name
set "DEFAULT_NAME=STM32F411CEUx"
set "DEFAULT_SCRIPT=BaseScript.txt"
set "DEFAULT_FLAG=N"

:: Check if arguments are passed, otherwise use defaults
if "%~1"=="" (
    set "PJT_NAME=%DEFAULT_NAME%"
) else (
    set "PJT_NAME=%~1"
)

if "%~2"=="" (
    set "LOAD_SCRIPT=%DEFAULT_SCRIPT%"
) else (
    set "LOAD_SCRIPT=%~2"
)

if "%~3"=="" (
    set "GC_FLAG=%DEFAULT_FLAG%"
) else (
    set "GC_FLAG=%~3"
)


echo Project name stored as: %PJT_NAME%
echo Script file stored as: %LOAD_SCRIPT%

:: Set the Documents path
set "SCRIPT_PATH=%~dp0"

:: Define folder paths
set "PJT_FOLDER=%SCRIPT_PATH%%PJT_NAME%"

:: Check if project folder exists, create if not
if not exist "%PJT_FOLDER%" (
    echo Creating project folder...
    mkdir "%PJT_FOLDER%"
) else (
    echo Project folder already exists.
	pause
	exit /b 1
)

set "SCRIPT_FILE=%PJT_FOLDER%\LoadScript.txt"  :: Optional: Specify script file for -s, e.g., script.xml

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

:: Add project info
copy /Y %LOAD_SCRIPT% %PJT_FOLDER%\LoadScript.txt
echo BaseScript.txt copied to LoadScript.txt successfully!
echo project name %PJT_NAME% >> %PJT_FOLDER%\LoadScript.txt
echo project toolchain "CMake" >> %PJT_FOLDER%\LoadScript.txt
echo project path %SCRIPT_PATH% >> %PJT_FOLDER%\LoadScript.txt
echo export script %PJT_FOLDER%\LoadedScript.txt >> %PJT_FOLDER%\LoadScript.txt

:: Convert input to uppercase for consistency
for %%A in (%GC_FLAG%) do set "GC_FLAG=%%A"

if /i "%GC_FLAG%"=="Y" (
    echo project generate >> %PJT_FOLDER%\LoadScript.txt
) else if /i "%GC_FLAG%"=="N" (
    echo #project generate >> %PJT_FOLDER%\LoadScript.txt
) else (
    echo Invalid entry. Please enter Y or N.
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
