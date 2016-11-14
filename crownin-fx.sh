#!/bin/sh
# sudo apt-get install uni2ascii

LANG=en_US.utf8

if [ "$1" = "" ]; then
  echo Use $0 locale
  exit
fi

rm -rf workdir
mkdir workdir
cd workdir

unzip ../$1.zip

find . -name "*.properties" -exec sh -c "ascii2uni {} -q -a U | grep -v "crowdin.com" > /tmp/tmp8 ; mv /tmp/tmp8 {}" \;
find . -name "*.properties" -exec sed -i 's/\\:/:/g;s/\\#/#/g;s/\\!/!/g;s/\\=/=/g;/^#/! s/ $/\\u0020/g;s/=\\ /=\\u0020/g;s/\\\\/\\/g;s/3\\ =/3=/g;s/=:=$/=:/g' {} \;

find . -name "*.dtd" -exec sed -i 's/\&amp;/\&/g;s/{\[=-/</g;s/-=\]}/>/g' {} \;
find . -name "netError.dtd" -exec sed -i 's/\&lt;/</g;s/\&gt;/>/g' {} \;

zip -r ../$1-fix.zip *
cd ..
rm -rf workdir
