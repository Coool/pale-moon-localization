#!/bin/sh
# To run under Windows use MozillaBuild package - https://forum.palemoon.org/viewtopic.php?f=19&t=13556
LANG=en_US.utf8

if [ "$1" = "" ]; then
  printf "\nUse $0 locale\n" && exit 1
fi

if [ ! -f $1.zip ]; then
  printf "\n$1.zip not exists\n" && exit 1
fi

currdir=$(pwd)
temp_dir=$(mktemp -d /tmp/crowdin.XXXXXX)
trap "rm -rf $temp_dir" 0 2 3 15

printf "\n  unzipping $1.zip ... "
unzip -q $1.zip -d $temp_dir
if [ $? -eq 0 ]; then
  printf "done\n"
else
  printf "\n\n$1.zip broken\n" && exit 1
fi

printf "  processing *.properties ... "
find $temp_dir/ -name "*.properties" -exec perl crowdin-filter.pl {} \;
printf "done\n"
printf "  processing *.dtd ... "
find $temp_dir/ -name "*.dtd" -exec sed -i 's/\&amp;\([\.a-zA-Z0-9]*\);/\&\1;/g;s/{\[=-/</g;s/-=\]}/>/g' {} \;
find $temp_dir/ -name "netError.dtd" -exec sed -i 's/\&lt;/</g;s/\&gt;/>/g' {} \;
find $temp_dir/ -name "aboutRights.dtd" -exec sed -i 's/%/\&#37;/g' {} \;
find $temp_dir/ -name "aboutSessionRestore.dtd" -exec sed -i 's/%/\&#37;/g' {} \;
printf "done\n"

printf "  zipping result to $1-fix.zip ... "
cd $temp_dir
zip -q -r $currdir/$1-fix.zip *
cd $currdir
printf "done\n"
