#!/usr/bin/perl

use strict;
use Data::Dumper;

#Existe prioridade em AntLR?

my $flag=0;
my %definitions;
my %directos;
my %hashtokens;
my %productions;
my $case;
my $aux;
my $aux2;

sub trataer1 {
	my $prov = @_[0];
	#print "ER recebida: ", $prov , "\n";
	$prov =~ s/([^\\]*?)(\[)(.*?[^\\])(\])/$1\($3\)/g;
	$prov =~ s/(.*?)([^\\])\-(.)(.*?)/$1$2\.\.$3$4/g;
	$prov =~ s/([a-zA-Z0-9])/\'$1\'/g;
	$prov =~ s/\'\'/\'\|\'/g;
	return $prov;
	#print "ER recebida: ", $prov , "\n";
}

while(<>){
	chomp($_);
	
	$_ eq "\%\%" && $flag++;
	
	if($flag == 0){
	#	print "Definition State\n";
		m/(\w+)\s+(.+)/g;
		$aux = $1;$aux2 = $2;
		if($aux2 !~ /^\".*\"$/){
			$directos{$aux} = trataer1 $aux2;
		}else{
			$definitions{$aux} = $aux2;
		}
	}
	elsif($flag == 1){
	#	print "Token state\n"
		if($_ =~ m/^{/){
			 $case = 1;
		}else { $case = 2; }

		m/([^\t\n]+)\s+(\S+)/g;
		
		if ($case == 1) {
		 	$aux = $1;
			$aux2 = $2; #os $numeros sao especiais, n da para fazer alterações com eles

			if($aux =~ /^{[A-Za-z]+}$/){
				$aux =~ s/^\{//g;
				$aux =~ s/\}$//g;
				$hashtokens{$aux} = $definitions{$aux};
			}
		}
		elsif($case == 2){
			
		}else{
			print "\nErro, case = 0\n\n";
		}
		#print "RE: $aux → case: $case → SEMANTICA: $aux2 \n";

	}
	elsif($flag == 2){
	#	print "Trash state\n"
	
	}
	else{
		print "What the hell man?\n"
        
	}
	
	#print $_, "\n";
}

sub prettycenas1 {
	for my $f (keys(%directos)){
		$f && print "\n", $f, " :\t", $directos{$f}, "\n", "\t;\n" ;
	}
}

sub prettycenas2 {
	print "tokens{";
	for my $f (keys(%definitions)){
		$definitions{$f} =~ s/\"//g;
		$f && print "\n\t", $f, " = \'", $definitions{$f}, "\';" ;
	}
	print "\n}\n";
}

#print Dumper( \%definitions );
#print Dumper( \%directos    );
#print Dumper( \%hashtokens  );

prettycenas2;
prettycenas1;

