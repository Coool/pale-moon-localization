@echo off
echo Packing %1...
if exist xpi\%1.xpi del xpi\%1.xpi
pushd %1
..\zip -r9q ..\xpi\%1.xpi .
popd
