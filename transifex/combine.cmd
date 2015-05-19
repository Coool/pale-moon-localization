@echo off
SET TARGETFILEROOT=%~dp0%1

del %TARGETFILEROOT%.dtd
del %TARGETFILEROOT%.properties

call :processdir %1
ssr 0 "##@@" "<!--##@@" %TARGETFILEROOT%.dtd
ssr 0 "@@##" "@@##-->" %TARGETFILEROOT%.dtd

exit /b

rem ===========================

:processdir
pushd %1
echo Processing %2...
for %%F in (*.dtd) do call :combinedtd %%~pnF
for %%F in (*.properties) do call :combineprops %%~pnF
rem recurse
for /D %%D in (*) do call :processdir %%D %%~pnD
popd
exit /b

rem ====== DTD ======
:combinedtd
echo ##@@%1.dtd@@##>> %TARGETFILEROOT%.dtd
copy %TARGETFILEROOT%.dtd+%1.dtd %TARGETFILEROOT%.tmp >nul:
del %TARGETFILEROOT%.dtd >nul:
move %TARGETFILEROOT%.tmp %TARGETFILEROOT%.dtd >nul:
exit /b

rem ====== properties ======
:combineprops
echo ##@@%1.properties@@##>> %TARGETFILEROOT%.properties
copy %TARGETFILEROOT%.properties+%1.properties %TARGETFILEROOT%.tmp >nul:
del %TARGETFILEROOT%.properties >nul:
move %TARGETFILEROOT%.tmp %TARGETFILEROOT%.properties >nul:
exit /b

