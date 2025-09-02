@echo off
setlocal
set QUARTUS_PATH=C:\intelFPGA\23.1std\quartus\bin64\
set FAMILY="Cyclone V"
set PART=5CEBA4F23C7
set BOARDFILE=..\DE0_CV.qsf
set SRCS="*.sv *.v"
set QUARTUS_ARGS=--64bit

%QUARTUS_PATH%quartus_sh.exe %QUARTUS_ARGS% --prepare -f %FAMILY% -t top project
if  errorlevel 1 goto ERROR
type %BOARDFILE% >> project.qsf

%QUARTUS_PATH%quartus_map.exe %QUARTUS_ARGS% --read_settings_files=on --source=%SRCS% project
if  errorlevel 1 goto ERROR

%QUARTUS_PATH%quartus_fit.exe %QUARTUS_ARGS% --part=%PART% --read_settings_files=on project
if  errorlevel 1 goto ERROR

%QUARTUS_PATH%quartus_asm.exe %QUARTUS_ARGS% project
if  errorlevel 1 goto ERROR

%QUARTUS_PATH%quartus_sta.exe %QUARTUS_ARGS% project
if  errorlevel 1 goto ERROR

%QUARTUS_PATH%quartus_pgm.exe --no_banner --mode=jtag -o "P;project.sof"
if  errorlevel 1 goto ERROR

@echo SUCCESSFUL
goto EOF 

:ERROR
echo FAILED!
exit /b 1

:EOF