# LAB04 template for ELT73A course 

## Git commands
How to config git
```bash
git config --global user.name "Your Name"
git config --global user.email yourmail@domain.tld
```
It's recommended to verify that the your Git installation is not performing any transformation between LFs and CRLFs. 

```bash
git config --global core.autocrlf false
```
```bash
git config list --show-origin
```
How to commit updates
```bash
cd LAB04
git status
git add .
git commit -m "My message for this commit!"
git push
git log
```

## MiniF4-STM32F401CEU6
- https://github.com/WeActStudio/WeActStudio.MiniSTM32F4x1
  
## STM32CubeF4 MCU Firmware Package
- https://github.com/STMicroelectronics/STM32CubeF4
- https://github.com/STMicroelectronics/STM32Cube_MCU_Overall_Offer

## STM32 Development Tools
- https://www.st.com/en/development-tools/stm32cubemx.html
- https://www.st.com/en/development-tools/stm32cubeclt.html
- https://www.st.com/en/development-tools/stm32cubeprog.html

## Running STM32CubeMX in command-line mode
- https://www.st.com/resource/en/user_manual/um1718-stm32cubemx-for-stm32-configuration-and-initialization-c-code-generation-stmicroelectronics.pdf

To run STM32CubeMX in interactive command-line mode, use the following command line:
```bash
"%STM32CubeMX_PATH%\jre\bin\java" -jar "%STM32CubeMX_PATH%\STM32CubeMX.exe" -i
```

To run STM32CubeMX in command-line mode, getting commands from a script, use the following command line:
```bash
"%STM32CubeMX_PATH%\jre\bin\java" -jar "%STM32CubeMX_PATH%\STM32CubeMX.exe" -s ScriptToLoad.txt
```

To run STM32CubeMX in command-line mode getting commands from a script and without UI, use the following command line:
```bash
"%STM32CubeMX_PATH%\jre\bin\java" -jar "%STM32CubeMX_PATH%\STM32CubeMX.exe" -q ScriptToLoad.txt
```

To generate a script
```bash
export script ScriptToLoad.txt
```

### Open STM32CubeMX
Opens STM32CubeMX and loads STM32F411CEUx
```bash
OpenMX
```
Opens STM32CubeMX and loads provided MCU
```bash
OpenMX STM32F411CEUx
```

### Load STM32CubeMX Script
Opens STM32CubeMX and loads default values for Project Name, Script and Code Generation (STM32F411CEUx, BaseScript.txt and N)
```bash
LoadMX
```
Load with Project Name
Opens STM32CubeMX with provided Project Name and loads default values for Script and Code Generation (BaseScript.txt and N)
```bash
LoadMX ProjectName
```
Opens STM32CubeMX with provided Project Name and Script Name and loads default value for Code Generation (N)
```bash
LoadMX ProjectName ScriptName.txt
```
Opens STM32CubeMX with provided Project Name, Script Name and generate code flag
```bash
LoadMX ProjectName ScriptName.txt Y
``` 

### MX help
The “MX>” prompt is displayed, to indicate that the application is ready to accept commands.
```bash
Usage:
 log
  log <level>
 set
 import
 ocxtest
  ocxt <opt_ide:all|iar|keil|sw4> <opt_copy_fw:NONE|LITE|FULL> <opt_usr_cubex_path: open cube example test
 MultiConfig
 load
  load <mcu>: open mcu xml file
 get
 lock
 reset
 clearpinout
  clearpinout: remove all the pin mapping
 possible_value
 not_a_possible_value
 add
 check
 csv
 generate
 tinyload
  tinyload <mcu>: load mcu for pinout only
 waitclock
  Wait for a delay in seconds until clock has finished its initialization
 switch
 unset
 export
 list
 loadboard
  loadboard <boardname> <allmodes>]|<nomode> load a board with or without modes
 project
 setDriver
  set Ip driver
 SetStructure
  Set Application structure (Advanced/Basic).
 SetCopyLibrary
  Set Copy Library (copy all/ copy only / copy as reference).
 pinout
 disable
 login
  login using email and password: login <email> <password>
 logout
  logout
 login_with_gui
  login_with_gui
 tooltip
 clock
 updateIpUI
  update UI <IpName>: update the UI for a given IP
 swmgr
 config
 user_analytics
  user_analytics <true|false>
 simulate
 isPluginError
  isPluginError <pluginName>, where pluginName can be "Clock Configuration", "Pinout & Configuration"
 exit_mx
  exit_mx: leave mx same way than exit menu
 setprop
  set a system property: setprop <property> <value>
 getprop
  get a system property: getprop <property>
 getenv
  get an environment variable: getenv <variable>
 xcopy
  xcopy
        <sw_vendor>
        <sw_version>
        <example_name>
        <example_path>
        <ide:all|iar|keil|swb|cube> default:all
        <copy_fw:NONE|LITE|FULL> default:LITE
        <opt:user_example_path> default:$HOME/STM32CubEX
        <opt:fw_path> default:$HOME/STM32Cube/Repository
        <opt:board_name> default: empty
Description: Open cube example test
Example: xcopy "STMicroelectronics" "X-CUBE-BLE2_V3.2.0" "Beacon" "/Projects/NUCLEO-L476RG/Applications/Beacon" "all" "LITE" "" "" "NUCLEO-L476RG"
 xts
  example testsuite
 xtest
  xtest <args> : example test command
 xbuild
  xbuild <project_path>
Description: automatic build command
Example: xbuild "C:\Users\chaumont\STM32Cube\Example\CORTEX_MPU"
 popupwrapper
 xcubedl
  xcubedl <packname> : X-CUBE Download
 Help
  help: Print Help
 Exit
  exit: Exit process
 script
  script <file>: execute all command in file
 dma
 NVIC
 pack
 ```


