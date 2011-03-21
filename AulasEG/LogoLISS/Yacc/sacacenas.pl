#!/usr/bin/perl

use strict;
use Data::Dumper;

#Existe prioridade em AntLR?

my $flag=0;
my %definitions;
my %hashtokens;
my %productions;

while(<>){
	chomp($_);
	
	$_ eq "\%\%" && $flag++;
	
	if($flag == 0){
	#	print "Definition State\n";
		m/(\w+)\s+(.+)/g;
		$definitions{$1} = $2;
	
	}
	elsif($flag == 1){
	#	print "Token state\n"
		m/([^\t\n]+)\s+(\S+)/g;
		my $aux = $1;
		my $aux2 = $2; #os $numeros sao especiais, n da para fazer alterações com eles

		if($aux =~ /^{[A-Za-z]+}$/){
			$aux =~ s/^\{//g;
			$aux =~ s/\}$//g;
			$hashtokens{$aux} = $definitions{$aux};
			
		}

		print "RE: $aux → SEMANTICA: $aux2 \n";

	}
	elsif($flag == 2){
	#	print "Trash state\n"
	
	}
	else{
		print "What the hell man?\n"
        
	}
	
	#print $_, "\n";
}

#print Dumper( \%definitions );
#print Dumper( \%hashtokens );
