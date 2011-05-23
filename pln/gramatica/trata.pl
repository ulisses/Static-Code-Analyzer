#!/usr/bin/perl

use strict;

my @left;
my @rigth;

my %leftP;
my %rightP;

my $input = "";
my $symbol;

while(<>){

	$input .= $_;

	if(m/^([A-Z\'\+]+)\s+:\s+([A-Z\'\+]+)/){
		$leftP{$1}++;
		$rightP{$2}++;
	}

	if(m/^([A-Z\'\+]+)\s+:\s+([A-Z\'\+]+)\s+([A-Z\'\+]+)/){
		$leftP{$1}++;
		$rightP{$2}++;
		$rightP{$3}++;
	}

	if(m/^\s+\|\s+([A-Z\'\+]+)/){
		$rightP{$1}++;
	}

	if(m/^\s+\|\s+([A-Z\'\+]+)\s+([A-Z\'\+]+)/){
		$rightP{$1}++;
		$rightP{$2}++;
	}
}

for $symbol (keys (%leftP)) {
	$input =~ s/([^A-Za-z\+\']$symbol[^A-Za-z\+\'])/\L$1/g;
	$input =~ s/([^A-Za-z\+\']$symbol[^A-Za-z\+\'])/\L$1/g;
}

print "Gramática Portuguesa:\n";
for $symbol (keys (%leftP)) {
	if($rightP{$symbol}){
		
	}else{
		print " - símbolo inicial: \L$symbol \n\n";
	}
}

print $input;

print "\n\nSímbolos Não-Terminais:\n";
for $symbol (keys (%leftP)) {
	print "\L$symbol ";
}

print "\n\nSímbolos Terminais:\n";
for $symbol (keys (%rightP)){
	if($leftP{$symbol}){
		
	}else{
		print "$symbol ";
	}
}
