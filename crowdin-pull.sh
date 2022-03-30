#!/bin/sh
# To run under Windows use MozillaBuild package - https://forum.palemoon.org/viewtopic.php?f=19&t=13556
LANG=en_US.utf8

printf "Make sure you perform a crowdin CLI pull before calling this script."
read -n 1 -s

for lang in ar bg cs da de el en-GB es-AR es-ES es-MX fa fi fr gl hr hi hu id is it ja kn ko nl pl pt-BR pt-PT ro ru sk sl sr sv-SE th tl tr uk vi zh-CN zh-TW
do
  sh ./crowdin-pull-fix.sh $lang
done
