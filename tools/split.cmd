@echo off
SET TARGETFILEROOT=%~dp0%1

sfk deltree workdir -yes

ssr 0 "<!--##@@" "##@@" %TARGETFILEROOT%.dtd
ssr 0 "@@##-->" "@@##" %TARGETFILEROOT%.dtd

split.exe %TARGETFILEROOT%.dtd
split.exe %TARGETFILEROOT%.properties

sfk crlf-to-lf workdir -yes

xcopy workdir\en-US\* .\%1 /s /y

exit /b

rem ===========================


