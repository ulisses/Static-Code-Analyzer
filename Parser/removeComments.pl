#!/usr/bin/perl

use Regexp::Common qw /comment/;

open(FILESOURCE,'<',$ARGV[0]) or warn "can't open $ARGV[0]\n";
$file = join("", <FILESOURCE>); 
close FILESOURCE;

$file =~ s#/\*[^*]*\*+([^/*][^*]*\*+)*/|("(\\.|[^"\\])*"|'(\\.|[^'\\])*'|.[^/"'\\]*)#defined $2 ? $2 : ""#gse;

print $file;

