@echo off
if not exist "palemoon-*.en-US.langpack.xpi" (
  echo Error: source langpack not found.
  exit /b
)

rmdir /s /q en-US
mkdir en-US

pushd en-US
..\unzip ..\palemoon-*.en-US.langpack.xpi
move /Y chrome\en-US chrome\AB-CD >nul:
move /Y chrome\AB-CD\locale\en-US chrome\AB-CD\locale\AB-CD >nul:
move /Y browser\chrome\en-US browser\chrome\AB-CD >nul:
move /Y browser\chrome\AB-CD\locale\en-US browser\chrome\AB-CD\locale\AB-CD >nul:
popd

crowdin push