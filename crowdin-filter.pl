#!/usr/bin/perl -i.bak

use strict;
use warnings;

binmode(STDOUT, ':utf8');
use open qw(:std :utf8);

my $bakname = $ARGV[0] . ".bak";
while (<>) {
    s/\\u([0-9a-fA-F]{4})/chr(hex($1))/eg;
	s/\\:/:/g;
	s/\\#/#/g;
	s/\\!/!/g;
	s/\\=/=/g;
	s/^((?:(?!#).)*) $/$1\\u0020/g;
	s/=\\ /=\\u0020/g;
	s/\\\\/\\/g;
	s/3\\ =/3=/g;
	s/=:=$/=:/g;
    print if /^(?!.*crowdin\.com)/;
}
unlink($bakname) || die "Cannont unlink $bakname: $!";
