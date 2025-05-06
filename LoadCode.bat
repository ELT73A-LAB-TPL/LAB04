@echo off
echo Importing STM32CubeMX CMake project using STM32 VS Code Extension...

:: Check if the first argument (project path) was passed
if "%1"=="" (
    set /p PROJECT_PATH=Enter the project path name: 
) else (
    set "PROJECT_PATH=%1"
)

:: Verify that PROJECT_PATH exists and is a directory
if not exist "%PROJECT_PATH%" (
    echo Error: Project path does not exist!
    pause
    exit /b
)

:: Check if the project contains a CMakeLists.txt file
if not exist "%PROJECT_PATH%\CMakeLists.txt" (
    echo Error: CMakeLists.txt not found in the project path!
    echo Ensure this is a valid STM32CubeMX CMake project.
    pause
    exit /b
)

:: Open Visual Studio Code with STM32 extension for project setup
echo Opening project in VSCode using STM32 Extension...
code --add "%PROJECT_PATH%" --extension STM32-MCU

echo Import complete!
pause
