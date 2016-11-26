@echo off
set REL=27.0.0rc1
call :fix-lang ar Arabic AR
call :fix-lang bg Bulgarian BG
rem call :fix-lang zh-CN Chinese Simplified
call :fix-lang zh-TW Chinese Traditional
call :fix-lang hr Croatian HR
rem call :fix-lang cs Czech CZ
call :fix-lang bg Bulgarian BG
call :fix-lang da Danish DK
call :fix-lang nl Dutch NL
call :fix-lang en-GB English GB
call :fix-lang fi Finnish FI
rem call :fix-lang fr French FR
call :fix-lang gl Galician GL
rem call :fix-lang de German DE
call :fix-lang el Greek EL
call :fix-lang hu Hungarian HU
call :fix-lang is Icelandic IS
rem call :fix-lang it Italian IT
rem call :fix-lang ja Japanese JP
rem call :fix-lang kn Kannada IN
call :fix-lang ko Korean KR
rem call :fix-lang pl Polish PL
call :fix-lang pt-PT Portuguese PT
call :fix-lang pt-BR Portuguese Brazilian
call :fix-lang ro Romanian RO
rem call :fix-lang ru Russian RU
call :fix-lang sr Serbian RS
call :fix-lang sk Slovak SK
call :fix-lang sl Slovenian SI
rem call :fix-lang es-ES Spanish Spain
rem call :fix-lang es-AR Spanish Argentina
rem call :fix-lang es-MX Spanish Mexico
call :fix-lang sv-SE Swedish SE
call :fix-lang tr Turkish TR
call :fix-lang vi Vietnamese VI
echo All done!
exit /b

rem ====== fix-lang ======
:fix-lang
if not exist %1 call :make-lang %1
echo Fixing %1...
pushd %1
rem install.rdf
..\sed.exe -i "s/em:id=.*/em:id=\"langpack-%1@palemoon.org\"/" install.rdf
..\sed.exe -i "s/em:name=.*/em:name=\"%2 \(%3\) Language Pack\"/" install.rdf
..\sed.exe -i "s/em:version=\".*\"/em:version=\"%REL%\"/" install.rdf
..\sed.exe -i "s/<em:minVersion>.*<\/em:minVersion>/<em:minVersion>27.0.0<\/em:minVersion>/" install.rdf
rem manifests
..\sed.exe -i "s/en-US/%1/g" chrome.manifest
..\sed.exe -i "s/en-US/%1/g" browser\chrome.manifest
move /Y browser\chrome\*.manifest browser\chrome\%1.manifest >nul:
..\sed.exe -i "s/en-US/%1/g" browser\chrome\%1.manifest
move /Y chrome\*.manifest chrome\%1.manifest >nul:
..\sed.exe -i "s/en-US/%1/g" chrome\%1.manifest
rem firefox-l10n.js
..\sed.exe -i "s/\"en-US\"/\"%1\"/" browser\defaults\preferences\firefox-l10n.js
popd
exit /b

rem ====== make-lang ======
:make-lang
echo Creating %1...
md %1
copy /Y %~dp0\en-US\chrome.manifest %~dp0\%1\chrome.manifest >nul:
copy /Y %~dp0\en-US\install.rdf %~dp0\%1\install.rdf >nul:
md %1\browser
copy /Y %~dp0\en-US\browser\chrome.manifest %~dp0\%1\browser\chrome.manifest >nul:
md %1\browser\chrome
copy /Y %~dp0\en-US\browser\chrome\.mkdir.done %~dp0\%1\browser\chrome\.mkdir.done >nul:
copy /Y %~dp0\en-US\browser\chrome\en-US.manifest %~dp0\%1\browser\chrome\%1.manifest >nul:
echo D | xcopy /Y /S en-US\browser\defaults %1\browser\defaults >nul:
echo D | xcopy /Y en-US\browser\searchplugins %1\browser\searchplugins >nul:
md %1\chrome
copy /Y %~dp0\en-US\chrome\.mkdir.done %~dp0\%1\chrome\.mkdir.done >nul:
copy /Y %~dp0\en-US\chrome\en-US.manifest %~dp0\%1\chrome\%1.manifest >nul:
exit /b
