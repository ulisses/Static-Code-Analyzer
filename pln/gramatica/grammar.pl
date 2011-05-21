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

print "Gramática Portuguesa:\n";
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
		#print "$key \n";
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

	#print "$ldesq with index: " . length($1) . "\n";
	my $text = join "\n" , @lines;
	#print "Vou processar:\n" . $text . "\n...\n";

	#print "Tamanho do array = " . scalar(@lines) . "\n";
	
	my $i; my $j; my $x;
	for($i = 0; $i < scalar(@lines); $i++) {
		$j = $i;
		$lines[$i]=~ m/^(\s+)/;
		$x = length($1);

		if($x == ($tabs + 2)){
			$text = $lines[$i];
			$j++;
			###############################################################################	
			constprod($ldesq,$lines[$i]);

			for($j; $j < scalar(@lines); $j++){
				$lines[$j]=~ m/^(\s+)/;
				$x = length($1);
				
				if($x > ($tabs + 2)){
					$text .= "\n" . $lines[$j];
				}else{ $j = scalar(@lines); }

			}
			#print "\nBloco a processar: \n" . $text . "\n"; 
			processabloco($text);
		}
	}
}

sub constprod {
	my $ldesq = shift;
	my $lddrt = shift;
	##limpeza
	$ldesq =~ s/\s{2,}//g;
	$lddrt =~ s/\s{2,}//g;
	$ldesq =~ s/(\([A-Z\'\+]+)\ [\;\:\w\,\_\.\!\?\-àáâãäåçèéêëìíîïñòóôõöùúûüýÿÁÀÂÃÄÇÉÈÊËÍÌÎÏÑÒÓÕÖÚÙÝŸ\´\`]+(\))/$1$2/g;
	$lddrt =~ s/(\([A-Z\'\+]+)\ [\;\:\w\,\_\.\!\?\-àáâãäåçèéêëìíîïñòóôõöùúûüýÿÁÀÂÃÄÇÉÈÊËÍÌÎÏÑÒÓÕÖÚÙÝŸ\´\`]+(\))/$1$2/g;

	#print "\nConstruir Produção\n$ldesq → $lddrt\n";
	
	if($ldesq=~ m/^\(([A-Z\'\+]+)\ \(([A-Z\'\+]+)\)$/){
		$prods{"$1\t:\t$2"}++;
		#print "Produção encontrada: $1 → $2 \n";
		$ldesq = $1;
	}

	if($ldesq=~ m/^\(([A-Z\'\+]+)$/){
		$ldesq = $1;
	}

	#print "Lado esquerdo actual $ldesq\n";
	if($lddrt=~ m/^\(([A-Z\'\+]+)\)*$/){
		$lddrt = $1;
		#print "Lado direito $lddrt\n";
	}

	if($lddrt=~ m/^\(([A-Z\'\+]+)\ \(([A-Z\'\+]+)\)\ \(([A-Z\'\+]+)\)+$/){
		$lddrt = $1;
		#print "Produção encontrada: $1 → $2\nProdução encontrada: $1 → $3\n";
		$prods{"$1\t:\t$2"}++;
		$prods{"$1\t:\t$3"}++;
		
	}
	
	if($lddrt=~ m/^\(([A-Z\'\+]+)\ \(([A-Z\'\+]+)\)+$/){
		$lddrt = $1;
		#print "Produção encontrada: $1 → $2\n";
		$prods{"$1\t:\t$2"}++;
	}
	
	#print "Produção encontrada: $ldesq → $lddrt \n";
	if($lddrt=~m/(\(N\)\ )+/g){
		#print "Produção com erros $lddrt\n";
	}else{
		$prods{"$ldesq\t:\t$lddrt"}++;
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
