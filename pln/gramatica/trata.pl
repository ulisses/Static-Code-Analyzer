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

for $symbol (keys (%rightP)) {
	
	if($leftP{$symbol}){
		#print "$symbol terminal\n";
	}else{
		#print "$symbol não terminal\n";
		$input =~ s/\s$symbol\s/\t\L$symbol\t/g;
		$input =~ s/\s$symbol\s/\t\L$symbol\t/g;
	}
}

print $input;
