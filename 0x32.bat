@ECHO OFF
TITLE 32BIT CPU ADDRESS IN
IF "%1"=="" GOTO :HELP
GOTO A
:HELP
ECHO suach on the address of 32bitCPU.
ECHO         0x32 [Hexdecimal]
ECHO example 0x32 0FFF0010
ECHO example 0x32 0FFA
ECHO              xxxxxxxx
GOTO :EOF
:A
SET h=%1
SET h=%h:0=0000%
SET h=%h:1=0001%
SET h=%h:2=0010%
SET h=%h:3=0011%
SET h=%h:4=0100%
SET h=%h:5=0101%
SET h=%h:6=0110%
SET h=%h:7=0111%
SET h=%h:8=1000%
SET h=%h:9=1001%
SET h=%h:A=1010%
SET h=%h:B=1011%
SET h=%h:C=1100%
SET h=%h:D=1101%
SET h=%h:E=1110%
SET h=%h:F=1111%
SET h=#%h%
ECHO %h%
ECHO 1MB LIMIT ON 8086 REALMODE
ECHO EMM386 IN VIRTUAL86MODE
IF /I %h% LEQ #10011111111111111111 ECHO #conventional memory# 640KB
IF /I %h% LEQ #11111111111111111111 GOTO UMA
IF /I %h% LEQ #100001111111111101111 GOTO HMA
IF /I %h% GEQ #100001111111111110000 ECHO #EMB# MORE 80286CPU ON PROTECTMODE
IF /I %h% LEQ #111111111111111111111111 ECHO 16MB LIMIT ON 80286
IF /I %h% LEQ #11111111111111111111111111111111 ECHO 4GB LIMIT.80386 CPU ABOVE
GOTO :EOF
:UMA
IF /I %h% GEQ #10100000000000000000 ECHO #UMA# VRAM AND VIDEOBIOS
GOTO :EOF
:HMA
IF /I %h% GEQ #100000000000000000000 ECHO #HMA# MORE 80286CPU IN REALMODE 64KB
GOTO :EOF
