My problem
I was to search and replace inside a simple batch-script and wanted a search and replace tool from the command line.

After searching I didn't find what I was looking for and compiled this simple tool.
ssr.exe

Example

ssr c:\\temp\\= \\=\t test.txt
    Deletes the string c:\temp\ and replaces \ (backslash) with TAB 
ssr "ServerHost=Value1"="ServerHost=Value2" config_file.ini
    Use above command to replace values in a config file 
ssr -0 \x01=\x20 test.txt >test_space.txt
    Replace hex 00 with spaces in a textfile (-0 or --zero) 
ssr -m="....[05]00 {8}....[05]00.*" -h=X,Y,Z \s08=, \s07=, grid.txt -o=grid_500m.csv
    Use above command to reduce huge coordinate grid file (grid in 100m) to grid in 500m CC. Grid line format: 1234567 1234567 123.45 
ssr search.txt=replace.txt test.txt
    Replaces the content of search.txt with the content of replace.txt in test.txt (if search.txt and replace.txt exists) 
ssr -l -r "\s*([^ ])\s*\e\s*([^ ]*)\s*"="$1\e$2" test.txt
    Removes whitespace around Name = Value pairs in test.txt 


Versions / History

2013-sep-03, version 1.15
    support for \q as " (quote) 
2013-maj-31, version 1.13
    added support to replace hex00 in textfiles 
2013, version 1.11
    Some buggfixes published 
2010-mar-05, version 1.6
    Support for regular expresion substitutions 
2010-feb-22, version 1.5
    Support for large search and replace statements 
2009-nov-05, version 1.4
    Buggfix, parsing correct filename from commandline 
2009-oct-21, version 1.3
    Line-By-Line function for huge files. 
2009-aug-03, version 1.0
    Implemented 

More info
More info/questions from: jonas.reinhardt@commercior.com Subject: SSR