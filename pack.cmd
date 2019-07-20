@echo off
set VER=28.7.0rc1

rem ar da fa fi gl hr id is ja kn ro sl sr th vi zh-TW
set LOCALES=bg cs de el en-GB es-AR es-ES es-MX fr hu it ko nl pl pt-BR pt-PT ru sk sv-SE tl tr uk zh-CN

for /f "tokens=1,2 delims=." %%a in ("%VER%") do set MIN=%%a.%%b.0a1
for /f "tokens=1,2 delims=." %%a in ("%VER%") do set MAX=%%a.%%b.*

if not "%1" == "" (
  call :pack-xpi %1
  goto :done
)

for %%i in (%LOCALES%) do call :pack-xpi %%i
:done
echo All done!
exit /b

:pack-xpi
echo Packing %1...
if exist xpi\%1.xpi del xpi\%1.xpi
pushd %1
rem update version
..\ssr.exe -r -w --unix "em:version\e\q[a-zA-Z0-9_.]+\q"="em:version\e\q%VER%\q" ^
                        "minVersion>[a-zA-Z0-9_.\*]+<"="minVersion>%MIN%<" ^
                        "maxVersion>[a-zA-Z0-9_.\*]+<"="maxVersion>%MAX%<"     install.rdf
rem rename AB-CD -> lang
move /Y browser\chrome\AB-CD\locale\AB-CD browser\chrome\AB-CD\locale\%1 >nul:
move /Y browser\chrome\AB-CD browser\chrome\%1 >nul:
move /Y chrome\AB-CD\locale\AB-CD chrome\AB-CD\locale\%1 >nul:
move /Y chrome\AB-CD chrome\%1 >nul:
rem pack it
..\zip.exe -r9q ..\xpi\%1.xpi .
rem Rename lang -> AB-CD
move /Y chrome\%1 chrome\AB-CD >nul:
move /Y chrome\AB-CD\locale\%1 chrome\AB-CD\locale\AB-CD >nul:
move /Y browser\chrome\%1 browser\chrome\AB-CD >nul:
move /Y browser\chrome\AB-CD\locale\%1 browser\chrome\AB-CD\locale\AB-CD >nul:
popd
exit /b
