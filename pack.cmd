@echo off
set REL=27.0.0
rem ar bg da el en-GB fi gl hr hu is ko nl pt-BR pt-PT ro sk sl sr sv-SE tr zh-TW
set LOCALES=cs de es-AR es-ES es-MX fr it ja kn pl ru vi zh-CN

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
..\sed.exe -i "s/em:version=\".*\"/em:version=\"%REL%\"/" install.rdf
rem rename AB-CD -> lang
move /Y browser\chrome\AB-CD browser\chrome\%1 >nul:
move /Y chrome\AB-CD\locale\AB-CD chrome\AB-CD\locale\%1 >nul:
move /Y chrome\AB-CD chrome\%1 >nul:
rem pack it
..\zip.exe -r9q ..\xpi\%1.xpi .
rem Rename lang -> AB-CD
move /Y chrome\%1 chrome\AB-CD >nul:
move /Y chrome\AB-CD\locale\%1 chrome\AB-CD\locale\AB-CD >nul:
move /Y browser\chrome\%1 browser\chrome\AB-CD >nul:
popd
exit /b
