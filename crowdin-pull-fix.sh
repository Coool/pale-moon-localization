#!/bin/sh
# To run under Windows use MozillaBuild package - https://forum.palemoon.org/viewtopic.php?f=19&t=13556
LANG=en_US.utf8

printf "Locale: $1\n"
printf "  processing *.properties ... "
find $1/ -name "*.properties" -exec perl crowdin-filter.pl {} \;
printf "done\n"
printf "  processing *.dtd ... "
find $1/ -name "*.dtd" -exec sed -i 's/\&amp;\([\.a-zA-Z0-9]*\);/\&\1;/g;s/{\[=-/</g;s/-=\]}/>/g' {} \; &> /dev/null
find $1/ -name "netError.dtd" -exec sed -i 's/\&lt;/</g;s/\&gt;/>/g' {} \; &> /dev/null
find $1/ \( -name "aboutRights.dtd" -o -name "aboutSessionRestore.dtd" -o -name "printPageSetup.dtd" \
                   -o -name "printPreview.dtd" -o -name "printProgress.dtd" \) -exec sed -i 's/%/\&#37;/g' {} \; &> /dev/null
printf "done\n"
