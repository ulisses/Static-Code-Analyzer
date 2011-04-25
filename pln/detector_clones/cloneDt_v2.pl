#!/usr/bin/perl

use strict;
use Getopt::Long;
use File::Basename;


#undef $/;
my $_opt_filePath;
my $_opt_comp_filePath;

GetOptions("file=s" => \$_opt_filePath,
            "comp=s" => \$_opt_comp_filePath,
            );


#executa o ctags para todos os dois ficheiros
my $dirname = dirname($_opt_filePath);
my $funcsMain = `cd $dirname && ctags -x *.c`;
$dirname = dirname($_opt_comp_filePath);
my $funcsComp = `cd $dirname && ctags -x *.c`;

my @numLinhasFile;
my @numLinhasComp;

#retira e guarda em @numLinhas, o numero das linhas onde começam as funçoes (para os dois ficheiros)
while ( $funcsMain =~ m/[.*|\s+](\d+)[.*|\s+]/g){
	push(@numLinhasFile,$1);
}
while ( $funcsComp =~ m/[.*|\s+](\d+)[.*|\s+]/g){
	push(@numLinhasComp,$1);
}

#ordena os numeros das linhas por ordem decrescente
@numLinhasFile = sort (@numLinhasFile);
@numLinhasFile = reverse (@numLinhasFile);

@numLinhasComp = sort (@numLinhasComp);
@numLinhasComp = reverse (@numLinhasComp);


leFuncoes($_opt_filePath,@numLinhasFile);
#leFuncoes($_opt_comp_filePath, @numLinhasComp);

sub leFuncoes{
    #le desde o inicio do ficheiro ate a ultima funcao
    my @linhas;
    my $ini;
    my $fim;
    my $total =0;
    my $contador=0;
    my ($path,@numLinhas) = @_;
    my @funcoes;

    #abre o ficheiro para leitura
    open FILE, "<", $path or die $!;
    
    #le o ficheiro <>,coloca o codigo contido em cada funcao, numa posicao da hash %funcoes
    while((my $size =@numLinhas)>0){
        print "aqui" . $size . "\n";
    	if($total==0){$ini = 1;}
    	else{$ini = $fim;}
	
	
    	$fim = pop(@numLinhas);
    	$total = $fim - $ini ;
	
    	my $funcao = "";
    	for (my $i = 0; $i<$total ; $i++){
    		my $line = <FILE>;
    		$funcao = $funcao . $line;
    	}
    	
    	push(@funcoes,$funcao);
    	$funcao = "";

    }

    my $funcao = "";
    #le desde o inicio da ultima funcao, at´e ao fim do ficheiro e guarda na ultima posicao de @funcoes
    while (<FILE>){
        $funcao = $funcao . $_;
    	}
	push(@funcoes, $funcao);
                    my $cenas = @funcoes;
        	        print "AQUIZES " . $cenas;
#    delete($funcoes{0}); 

print $funcoes[2];
#    my %funcs = analisa (%funcoes);

 #   compara (%funcs);
}
=if
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


=cut

