@echo off
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
