#!/usr/bin/perl

use strict;
use Data::Dumper;
use Tree::Binary;

my %prods;
my @producoes;
my $bloco;
my $key;
my $estado = 0;
my $current = "";
my $ld;

while(<>){
	if(/^\n/){
		processabloco($bloco);
		$bloco = "";
	}else{
		$bloco .= $_;
	}
}

@producoes = sort (keys(%prods));

foreach $key (@producoes) {
	$key =~ m/^([A-Z\'\+]+).*/;
	$ld = $1;
	if($current eq $ld){
		$key =~ s/^([A-Z\'\+]+)\s+\:/\t|/g;
		print "$key \n";
	}else{
		print "\n$key \n";
		$current = $ld;
	}
}

#####################################################################
## Subs...
#####################

sub processabloco{
	my $text = shift;
	#print "\nUma arvore::\n " . $text . "\nFim da árvore\n";
	my @linhas = split /\n/ , $text;
	findprods(@linhas);
}

sub findprods{
	my $ldesq = shift;
	$ldesq =~ m/^(\s+)/;
	my $tabs = length($1);
	my @lines = @_;	
	my $text;
	my $prov = "";

	my $i; my $j; my $x;
	for($i = 0; $i < scalar(@lines); $i++) {
		$j = $i;
		$lines[$i]=~ m/^(\s+)/;
		$x = length($1);

		if($x == ($tabs + 2)){
			$text = $lines[$i];
			$j++;

			$prov .= "→→$text";

			#constprod($ldesq,$lines[$i]);
			#print "Construir produção $ldesq → $text\n";
			
			for($j; $j < scalar(@lines); $j++){
				$lines[$j]=~ m/^(\s+)/;
				$x = length($1);
				
				if($x > ($tabs + 2)){
					$text .= "\n" . $lines[$j];
				}else{ $j = scalar(@lines); }

			}

			processabloco($text);
		}
	}
	if($prov eq ""){
		constprodtipoum($ldesq);
	}else{
		constprod($ldesq, $prov);
	#	print "Construir producao $ldesq $prov\n";
	}
}

sub constprodtipoum {

	my $ldesq = shift;
	$ldesq =~ s/\s{2,}//g;
	$ldesq =~ s/(\([A-Z\'\+]+)\ [\;\:\w\,\_\.\!\?\-àáâãäåçèéêëìíîïñòóôõöùúûüýÿÁÀÂÃÄÇÉÈÊËÍÌÎÏÑÒÓÕÖÚÙÝŸ\´\`]+(\))/$1$2/g;
	
	if($ldesq=~ m/^\(([A-Z\'\+]+)\ \(([A-Z\'\+]+)\)+$/){
		#$prods{"$1\t:\t$2"}++;
		#print "Produção encontrada: $1 → $2 \n";
	}

	if($ldesq=~ m/^\(([A-Z\'\+]+)\ \(([A-Z\'\+]+)\)\ \(([A-Z\'\+]+)\)+$/){
		#print "Produção encontrada: $1 → $2 | $3\n";
		#$prods{"$1\t:\t$2\t$3"}++;
		
	}
}

sub constprod {
	my $ldesq = shift;
	my $lddrt = shift;
	my $lddrtprim;
	my $ladodrt;
	##limpeza
	$ldesq =~ s/\s{2,}//g;
	$lddrt =~ s/\s{2,}//g;
	$ldesq =~ s/(\([A-Z\'\+]+)\ [\;\:\w\,\_\.\!\?\-àáâãäåçèéêëìíîïñòóôõöùúûüýÿÁÀÂÃÄÇÉÈÊËÍÌÎÏÑÒÓÕÖÚÙÝŸ\´\`]+(\))/$1$2/g;
	$lddrt =~ s/(\([A-Z\'\+]+)\ [\;\:\w\,\_\.\!\?\-àáâãäåçèéêëìíîïñòóôõöùúûüýÿÁÀÂÃÄÇÉÈÊËÍÌÎÏÑÒÓÕÖÚÙÝŸ\´\`]+(\))/$1$2/g;

	if($ldesq=~ m/^\(([A-Z\'\+]+)\ \(([A-Z\'\+]+)\)+$/){
		#$prods{"$1\t:\t$2"}++;
		#print "Produção encontrada: $1 → $2 \n";
		$ldesq = $1;
		$lddrtprim = $2 . "\t";
	}

	if($ldesq=~ m/^\(([A-Z\'\+]+)$/){
		$ldesq = $1;
	}
	
	my @ladosdrt = split /→→/ , $lddrt;

	for $ladodrt (@ladosdrt){
		if($ladodrt=~ m/^\(([A-Z\'\+]+)\)*$/){
			$lddrtprim .=  $1 . "\t";
		}
	
		if($ladodrt=~ m/^\(([A-Z\'\+]+)\ \(([A-Z\'\+]+)\)\ \(([A-Z\'\+]+)\)+$/){
			$lddrtprim .= $1 . "\t";
			$prods{"$1\t:\t$2\t$3"}++;
			
		}
		
		if($ladodrt=~ m/^\(([A-Z\'\+]+)\ \(([A-Z\'\+]+)\)+$/){
			$lddrtprim .= $1 . "\t";
			#print "Produção encontrada: $1 → $2\n";
			$prods{"$1\t:\t$2"}++;
		}
	}

	#print "Produção encontrada: $ldesq → $lddrt \n";
	if($lddrt=~m/(\(N\)\ )+/g){
		#print "Produção com erros $lddrt\n";
	}else{
		$prods{"$ldesq\t:\t$lddrtprim"}++;
	}
}

__END__

while(<>){
	chomp $_;
	$_ =~ s/^(\s+)\(/\(/g;
	$ident = length($1);

	print "Ident = " . $ident . "\n";
	
	if($_ eq "ROOT"){
		$tree = Tree::Binary->new('ROOT');
		$left_child = $tree->left;
		$right_child = $tree->right;
	}

	print $_ . "\n";
}
