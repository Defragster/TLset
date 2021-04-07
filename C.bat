
REM if compile.cmd exists transfer execution to it
if exist Compile.cmd Compile.cmd %1 %2 %3 %4 %5
ECHO BOOP

if not exist compile.cmd type %0


Choice /C yn /M "Create Compile.cmd"
If Errorlevel 2 Goto nowexit
rem If Errorlevel 1 
cd %sbook%\%bar%\%foo%
start /w %srcdir%\TlSet.cmd
:nowexit

