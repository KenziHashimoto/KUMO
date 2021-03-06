@ECHO OFF
TITLE 16BIT CUP ADDRESS ON
IF "%1"=="" GOTO :HELP
GOTO START
:HELP
ECHO This file is srech address of 16bit CPU
ECHO must be strictly set option,16bit.
ECHO /x option call 0x32.bat
ECHO         0x16 [Hexdecimal][/x]
ECHO         0x16 segment:offset option
ECHO example 0x16 0FFF:0010
ECHO         0x16 1234:5678 /x
ECHO              xxxx:xxxx
GOTO :EOF
:START
SET ADDRESS=
SET h=%1
SET h=0x%h:~0,4%0:0x%h:~5,4%
SET /A VAL=%h:~0,7% + %h:~8,6%
SET DECIMALADDRESS=%VAL%
IF /I %VAL% LEQ 1048575 GOTO :H
ECHO over the 1MB memory!!
GOTO :EOF
:H
IF /I %VAL% GEQ 65536 GOTO A
:B
IF /I %VAL% GEQ 4096 GOTO C
:D
IF /I %VAL% GEQ 256 GOTO E
:G
SET A=%VAL%
IF %A% == 0 SET ADDRESS=%ADDRESS%0
CALL :SUB
ECHO HEX ADDRESS %ADDRESS%
ECHO DECIMAL ADDRESS %DECIMALADDRESS%
IF "%2"=="/x" CALL 0x32 %ADDRESS%
GOTO :EOF
:F
SET /A A=%VAL% / 16
SET /A VAL=%VAL% - (%A%*16)
CALL :SUB
GOTO G
:E
SET /A A=%VAL% / 256
SET /A VAL=%VAL% - (%A%*256)
CALL :SUB
GOTO F
:C
SET /A A=%VAL% / 4096
SET /A VAL=%VAL% - (%A%*4096)
CALL :SUB
GOTO D
:A
SET /A A=%VAL% / 65536
SET /A VAL=%VAL% - (%A%*65536)
CALL :SUB
GOTO B
:SUB
IF %A% == 1 SET ADDRESS=%ADDRESS%1
IF %A% == 2 SET ADDRESS=%ADDRESS%2
IF %A% == 3 SET ADDRESS=%ADDRESS%3
IF %A% == 4 SET ADDRESS=%ADDRESS%4
IF %A% == 5 SET ADDRESS=%ADDRESS%5
IF %A% == 6 SET ADDRESS=%ADDRESS%6
IF %A% == 7 SET ADDRESS=%ADDRESS%7
IF %A% == 8 SET ADDRESS=%ADDRESS%8
IF %A% == 9 SET ADDRESS=%ADDRESS%9
IF %A% == 10 SET ADDRESS=%ADDRESS%A
IF %A% == 11 SET ADDRESS=%ADDRESS%B
IF %A% == 12 SET ADDRESS=%ADDRESS%C
IF %A% == 13 SET ADDRESS=%ADDRESS%D
IF %A% == 14 SET ADDRESS=%ADDRESS%E
IF %A% == 15 SET ADDRESS=%ADDRESS%F
