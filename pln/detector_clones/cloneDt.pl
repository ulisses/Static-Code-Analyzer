#!/usr/bin/perl -s

use strict;
#undef $/;

#executa o ctags para todos os ficheiros c na pasta
my $funcs = `ctags -x *.c`;
my @numLinhas;
#retira e guarda em @numLinhas, o numero das linhas onde começam as funçoes
while ( $funcs =~ m/[.*|\s+](\d+)[.*|\s+]/g){
	push(@numLinhas,$1);
}

@numLinhas = sort (@numLinhas);
@numLinhas = reverse (@numLinhas);


#le desde o inicio do ficheiro ate a ultima funcao
my @linhas;
my $ini;
my $fim;
my $total =0;
my $contador=0;

my %funcoes = ();
#le o ficheiro <>,coloca o codigo contido em cada funcao, numa posicao da hash %funcoes
while((my $size =@numLinhas)>0){
	if($total==0){$ini = 0;}
	else{$ini = $fim;}
	
	
	$fim = pop(@numLinhas);
	$total = $fim - $ini -1 ;
	
	my $funcao = "";
	for (my $i = 0; $i<$total ; $i++){
		my $line = <>;
		$funcao = $funcao . $line;
		
	}
	
	$funcoes{$contador++} = $funcao;
	$funcao = "";
}
#le desde o inicio da ultima funcao, at´e ao fim do ficheiro
while (<>){
	$funcoes{$contador}= $funcoes{$contador} . $_;
	}

delete($funcoes{0});


my %funcs = analisa (%funcoes);

compara (%funcs);


#retira espaços em branco etc.. e substitui numeros, strings e nomes de variaveis / tipos
sub analisa {
	my %funcs = @_;
	
	for(sort keys %funcs){
		my $text = $funcs{$_};
		$text =~ s/\/\*.*\*\///gs; #substitui os comentarios multi linha por nada
		$text =~ s/\/\/.*//g; #substitui os comentarios de uma so linha por nada	
		
		$text =~ s/[a-zA-Z]+[0-9]*/var/g;  # substitui as variaveis e os tipos por var
		$text =~ s/".*"/S/g; #substitui as strings por S
		$text =~ s/\d+/1/g; # substitui os numeros por 1
		$text =~ s/\s+//g; #tira muitos espaços seguidos
		$funcs{$_} = $text;
	}
	
	#for(sort keys %funcs){
	#	print $funcs{$_} . "\n" 
	#}
	
	return %funcs;
}


#le um ficheiro que contem funcoes tratadas ja guardadas, separadas por \n's
sub carrega{
	my %funcsLidas;
	open(F,"conj.txt") or die("Erro ou abrir ficheiro");
	while( <F> ){
		$funcsLidas{$contador++} = $_;
	}
	chomp(%funcsLidas);
	close (F);
	return %funcsLidas;
}



sub compara{
	%funcs = @_;
	my %funcsLidas = carrega();
	my $aux;
	for (keys %funcs){
		$aux = $_;
		for(keys %funcsLidas){
			#print "[". $funcs{$aux}. "] [" . $funcsLidas{$_} . "]\n";
			if($funcs{$aux} eq $funcsLidas{$_}){
				print "[". $funcs{$aux}. "] [" . $funcsLidas{$_} . "]\n";
				#print "COPIA  [" . $funcs{$_}. "]\n"; 
			}
		}
	}
	
};
