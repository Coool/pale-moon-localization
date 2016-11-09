@echo off
call :pack-xpi ar-SA
call :pack-xpi cs-CZ
call :pack-xpi da-DK
call :pack-xpi de-DE
call :pack-xpi el-GR
call :pack-xpi en-GB
call :pack-xpi es-AR
call :pack-xpi es-ES
call :pack-xpi es-MX
call :pack-xpi fi-FI
call :pack-xpi fr-FR
call :pack-xpi gl-ES
call :pack-xpi hr-HR
call :pack-xpi hu-HU
call :pack-xpi is-IS
call :pack-xpi it-IT
call :pack-xpi ja-JP
call :pack-xpi kn-IN
call :pack-xpi ko-KR
call :pack-xpi nl-NL
call :pack-xpi pl-PL
call :pack-xpi pt-BR
call :pack-xpi pt-PT
call :pack-xpi ro-RO
call :pack-xpi ru-RU
call :pack-xpi sk-SK
call :pack-xpi sl-SI
call :pack-xpi sr-SP
call :pack-xpi sv-SE
call :pack-xpi tr-TR
call :pack-xpi vi-VN
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