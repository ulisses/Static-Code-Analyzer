#!/usr/bin/perl

use strict;
use warnings;

use MyDatabase::Main;

my $schema = MyDatabase::Main->connect('dbi:SQLite:development.sqlite3');

sub get_concorrentes {
  print "Todos os concorrentes:\n";
  my @all_concorrentes = $schema->resultset('Concorrentes')->all;
  foreach (@all_concorrentes){
	#print "found one";
	print "\t" , $_->nome , "\n";
  }
  print "\n";
}

sub get_concursos {
  print "Todos os concursos:\n";
  my @all_concursos = $schema->resultset('Concursos')->all;
  foreach (@all_concursos){
	#print "found one";
	print "\t", $_->tit , "\n";
  }
  print "\n";
}

sub get_enunciados {
  print "Todos os Enunciados\n\n";
  my @all_enunciados = $schema->resultset('Enunciados')->all;
  foreach (@all_enunciados){
	#print "found one";
	print "Enunciado: ", $_->titulo , "\n";
	print "Descrição:\n\t-", $_->desc , "\n";
	print "\n"; 
  }
  print "\n";
}

sub get_languages {
  print "Linguagens Disponíveis\n";
  my @all_languages = $schema->resultset('Languages')->all;
  foreach (@all_languages){
	print "\nTipo                  : " , $_->ling ;
	print "\nComando de compilação : " ; if($_->compString){ print $_->compString; } else {print "Unavailable"; }
	print "\nComando de execução   : " ; if($_->execString){ print $_->execString; } else {print "Unavailable"; }
  	print "\n\n"
  }
  print "\n";
}

sub get_users {
  print "Todos os Users\n";
  my @all_users = $schema->resultset('Users')->all;
  foreach (sort {$a->name cmp $b->name} @all_users){
	#print "found one";
	print " → " , $_->name , "\n";
  }
  print "\n";
}

sub findall {
  my $input;
  my $flag = 1;

  while($flag){

	system("clear");

	print " Lista de: ",
		"\n\t1 → Users",
		"\n\t2 → Concorrentes",
		"\n\t3 → Enunciados",
		"\n\t4 → Concursos",
		"\n\t5 → Linguagens",
		"\n\n";

	chomp($input = <STDIN>);
		
	$input == 1 && do { get_users(); };
	$input == 2 && do { get_concorrentes();	};
	$input == 3 && do { get_enunciados(); };
	$input == 4 && do { get_concursos(); };
	$input == 5 && do { get_languages(); };

	print "\n<======>\nContinuar com as pesquisas? [S/N]\n";
	chomp( my $input = <STDIN>);
	if($input eq "N" || $input eq "n") {$flag = 0;}
  }
}

sub searchUser {

  system("clear");

  print "Inserir nome do user: ";
  chomp (my $input = <STDIN>);

  my $user = $schema->resultset('Users')->search({name => $input})->first;
  
  if($user){

  system("clear");

  print "Dados do User: " , $input , "\n" ,
        "\n\tEmail → " , $user->email ,
	"\n\tAdmin → " , $user->admin ,
	"\n\n",
	"Pretender efectuar alterações no user?[S/N]\n";
      	chomp($input = <STDIN>);
      	if($input eq "S" || $input eq "s") { editUser($user);}
  }
  else {
	print "\nUser não existe\n";
  }

}

sub editUser {
	#print "NÃO PODES, ahahahha";
	my $newuser = $_[0];
	print "\nQualquer campo que não pretenda alterar deixe em branco\n", "\n→ Inserir novo nome: ";
	chomp(my $input = <STDIN>);
	$input ne "" && do {$newuser->name($input);};
	print "→ Inserir novo email: ";
	chomp( $input = <STDIN>);
	$input ne "" && do {$newuser->email($input);};
	print "→ Admin? [sim]: ";
	chomp( $input = <STDIN>);
	$input eq "sim" && do {$newuser->admin('t');};	
	
	print "\n\nNovos dados do utilizador:\n\n" , "Nome: " , $newuser->name ,
							"\nEmail: " , $newuser->email ,
							"\nAdmin: " , $newuser->admin, 
							"\n\n" ;
	print "Pretender confirmar as alterações? [S/N]\n";
	chomp($input = <STDIN>);
	if($input eq "S" || $input eq "s") {$newuser->update;print "\nUser alterado\n"} else {print "\nUser não alterado\n";}
}

#MAIN:
{

my $input;
my $flag = 1;

while($flag){

      system("clear");

      print " :: Menu Principal :: ",
      	"\n\t1 → Listar",
      	"\n\t2 → Inserções",
      	"\n\t3 → Procuras",
      	"\n\n";

      chomp($input = <STDIN>);
      	
      $input == 1 && do { findall(); };
      $input == 2 && do { print "inserções"; };
      $input == 3 && do { print "procuras"; searchUser();  };

      print "\n<======>\nSair? [S/N]\n";
      chomp($input = <STDIN>);
      if($input eq "S" || $input eq "s") {$flag = 0;}
}

}
