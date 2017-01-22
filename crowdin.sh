#!/bin/sh
# To run under Windows use MozillaBuild package - https://forum.palemoon.org/viewtopic.php?f=19&t=13556
LANG=en_US.utf8

if [ ! -f .crowdin.key ]; then
  printf "\n.crowdin.key not found\n" && exit
else
  key=`cat .crowdin.key`
fi

# ar bg da el fi gl hr is kn nl pt-BR pt-PT ro sk sl sr sv-SE tr vi zh-TW
for lang in cs de en-GB es-AR es-ES es-MX fr hu it ja ko pl ru zh-CN
do
  printf "\n  downloading $lang locale from CrowdIn:\n\n"
  wget -q --show-progress https://api.crowdin.com/api/project/pale-moon/download/$lang.zip?key=$key -O $lang.zip
  if [ $? -ne 0 ]; then
   exit
  fi
  sh ./crowdin-fix.sh $lang
  if [ $? -ne 0 ]; then
   exit
  fi
  printf "\n  applying updates for $lang locale ... "
  unzip -oq $lang-fix.zip -d $lang
  if [ $? -eq 0 ]; then
   printf "done\n\n"
   rm $lang.zip $lang-fix.zip
  else
   exit
  fi
done
