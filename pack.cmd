@echo off
call :pack-xpi ar
call :pack-xpi cs
call :pack-xpi da
call :pack-xpi de
call :pack-xpi el
call :pack-xpi en-GB
call :pack-xpi es-AR
call :pack-xpi es-ES
call :pack-xpi es-MX
call :pack-xpi fi
call :pack-xpi fr
call :pack-xpi gl-ES
call :pack-xpi hr
call :pack-xpi hu
call :pack-xpi is
call :pack-xpi it
call :pack-xpi ja
call :pack-xpi kn
call :pack-xpi ko
call :pack-xpi nl
call :pack-xpi pl
call :pack-xpi pt-BR
call :pack-xpi pt-PT
call :pack-xpi ro
call :pack-xpi ru
call :pack-xpi sk
call :pack-xpi sl
call :pack-xpi sr
call :pack-xpi sv-SE
call :pack-xpi tr
call :pack-xpi vi
call :pack-xpi zh-CN
call :pack-xpi zh-TW
echo All done!
exit /b

rem ====== pack-xpi ======
:pack-xpi
echo Packing %1...
if exist xpi\%1.xpi del xpi\%1.xpi
pushd %1
rem rename AB-CD -> lang
move /Y browser\chrome\AB-CD browser\chrome\%1 >nul:
move /Y chrome\AB-CD\locale\AB-CD chrome\AB-CD\locale\%1 >nul:
move /Y chrome\AB-CD chrome\%1 >nul:
rem pack it
..\zip -r9q ..\xpi\%1.xpi .
rem Rename lang -> AB-CD
move /Y chrome\%1 chrome\AB-CD >nul:
move /Y chrome\AB-CD\locale\%1 chrome\AB-CD\locale\AB-CD >nul:
move /Y browser\chrome\%1 browser\chrome\AB-CD >nul:
popd
exit /b