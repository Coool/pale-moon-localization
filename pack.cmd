@echo off
call :pack-xpi ach
call :pack-xpi af
call :pack-xpi ak
call :pack-xpi ar
call :pack-xpi as
call :pack-xpi ast
call :pack-xpi be
call :pack-xpi bg
call :pack-xpi bn-BD
call :pack-xpi bn-IN
call :pack-xpi br
call :pack-xpi bs
call :pack-xpi ca
call :pack-xpi cs
call :pack-xpi csb
call :pack-xpi cy
call :pack-xpi da
call :pack-xpi de
call :pack-xpi el
call :pack-xpi en-GB
call :pack-xpi en-ZA
call :pack-xpi eo
call :pack-xpi es-AR
call :pack-xpi es-CL
call :pack-xpi es-ES
call :pack-xpi es-MX
call :pack-xpi et
call :pack-xpi eu
call :pack-xpi fa
call :pack-xpi ff
call :pack-xpi fi
call :pack-xpi fr
call :pack-xpi fy-NL
call :pack-xpi ga-IE
call :pack-xpi gd
call :pack-xpi gl-ES
call :pack-xpi gu-IN
call :pack-xpi he
call :pack-xpi hi-IN
call :pack-xpi hr
call :pack-xpi hu
call :pack-xpi hy-AM
call :pack-xpi id
call :pack-xpi is
call :pack-xpi it
call :pack-xpi ja
call :pack-xpi kk
call :pack-xpi km
call :pack-xpi kn
call :pack-xpi ko
call :pack-xpi ku
call :pack-xpi lg
call :pack-xpi lij
call :pack-xpi lt
call :pack-xpi lv
call :pack-xpi mai
call :pack-xpi mk
call :pack-xpi ml
call :pack-xpi mn
call :pack-xpi mr
call :pack-xpi nb-NO
call :pack-xpi nl
call :pack-xpi nn-NO
call :pack-xpi nso
call :pack-xpi or
call :pack-xpi pa-IN
call :pack-xpi pl
call :pack-xpi pt-BR
call :pack-xpi pt-PT
call :pack-xpi rm
call :pack-xpi ro
call :pack-xpi ru
call :pack-xpi si
call :pack-xpi sk
call :pack-xpi sl
call :pack-xpi son
call :pack-xpi sq
call :pack-xpi sr
call :pack-xpi sv-SE
call :pack-xpi sw
call :pack-xpi ta
call :pack-xpi ta-LK
call :pack-xpi te
call :pack-xpi th
call :pack-xpi tr
call :pack-xpi uk
call :pack-xpi vi
call :pack-xpi zh-CN
call :pack-xpi zh-TW
call :pack-xpi zu
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