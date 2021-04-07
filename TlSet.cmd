@echo off
title TlSet Board Builder
rem model
rem menu.usb=USB Type
rem menu.storage=Extenal Storage
rem menu.speed=CPU Speed

REM echo %1 %2

goto StartUp

:StartUp
Echo =============================================  MODEL
Echo 	1 :: Katdid
Echo 	2 :: Firefly
Echo 	3 :: Mothra
Echo 	4 :: Nucleo
Echo 	q :: quit

Echo.
Choice /C 1234q /M "Which Tlera STM32"

If Errorlevel 5 Goto TlSetQuit
If Errorlevel 4 Goto Nucl
If Errorlevel 3 Goto Moth
If Errorlevel 2 Goto Fire
If Errorlevel 1 Goto Katy

:GetSpeed
Echo ============================================= Speed
Echo 	1 :: 64 Mhz
Echo 	2 :: 32 Mhz
Echo 	3 :: 16 Mhz
Echo 	4 :: 2 Mhz
Echo.  
Choice /C 1234  /M "What Speed"
If Errorlevel 4 Goto S4
If Errorlevel 3 Goto S3
If Errorlevel 2 Goto S2
If Errorlevel 1 Goto S1

:GetUSB
Echo ============================================= USB
Echo 	1 :: serial
Echo 	2 :: Serial + Mass Storage
Echo 	3 :: disable
Echo.
Choice /C 123 /M "What USB"
If Errorlevel 3 Goto U3
If Errorlevel 2 Goto U2
If Errorlevel 1 Goto U1

REM >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>   MODEL
:Katy
set model=Katydid-WB55CG
set vid=0x1209
set pid=0x6672
goto GetSpeed

:Fire
set model=Firefly-WB55CG
set vid=0x1209
set pid=0x6671
goto GetSpeed

:Moth
set model=Mothra-WB5MMG
set vid=0x1209
set pid=0x6673
goto GetSpeed

:Nucl
set model=STM32WB-NUCLEO
set vid=0x1209
set pid=0x6671
goto GetSpeed
REM >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>   MODEL

REM >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>   SPEED
:S4
set speed=2
goto GetUSB

:S3
set speed=16
goto GetUSB

:S2
set speed=32
goto GetUSB

:S1
set speed=64
goto GetUSB
REM >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>   SPEED

REM >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>   USB
:U3
set usb=none
goto BeDone

:U2
set usb=cdc_msc
goto BeDone

:U1
set usb=cdc
goto BeDone
REM >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>   USB



:BeDone
rem echo on
set BuildUp=cd.
Echo =============================================  Tools Selections
ECHO MODEL :: %model%
ECHO SPEED :: %speed%
ECHO USB :: %usb%
ECHO Sketch :: %1
set sketchcmd=~
IF EXIST %1 set sketchcmd=%1
IF /I "%2" NEQ "ino" set sketchcmd=~
IF "~" NEQ "%sketchcmd%" ECHO SKETCH :: %1

Echo =============================================  CONFIRM
Echo 	Y :: Yes :: Accept and save to %cd%\Compile.cmd
Echo 	N :: No :: RESTART
Echo 	S :: Save to %cd%\%model%
Echo 	x :: Exit now without writing
Echo.
Choice /C YNSx /M "Accept"
If Errorlevel 4 Goto TlSetQuit
If Errorlevel 3 Goto DoDir
If Errorlevel 2 Goto StartUp
If Errorlevel 1 Goto DoneNow

:DoDir
if not exist %model%/. md %model%
set BuildUp=cd..
set MoveFile=.\%model%\

:DoneNow
set OutCMD=%MoveFile%Compile.cmd
rem can use %~dp0 not %01 %02 to get Parts
type %01 > %OutCMD%
echo.>> %OutCMD%
echo REM defragster was here >> %OutCMD%
echo.>> %OutCMD%
echo set model=%model%>> %OutCMD%
echo set speed=%speed%>> %OutCMD%
echo set usb=%usb%>> %OutCMD%
echo set vid=%vid%>> %OutCMD%
echo set pid=%pid%>> %OutCMD%
echo %BuildUp%>> %OutCMD%
echo set sketchcmd=%sketchcmd%>> %OutCMD%
type %02 >> %OutCMD%
:TlSetQuit
exit
