package Access;

use Moose;
use MyDatabase::Main;

#atributo de ligação à base de dados.
has 'schema' => (
	is => 'rw',
	isa => 'MyDatabase::Main',
	default => sub {MyDatabase::Main->connect('dbi:SQLite:../development.sqlite3')},
	required => 1,
);

#atributo teste
has 'test' => (
	is => 'rw',
	default => 'howdy',
);

# Função teste
sub test_up{
	my $self = shift;
	$self->test(shift);
	print "O valor de test é " . $self->test . "\n" ;
}

#Devolve lista de concorrentes
sub get_concorrentes {
	my $self = shift;
	my @all_concorrentes = $self->schema->resultset('Concorrentes')->all;
	#foreach (@all_concorrentes){ print "\t" , $_->nome , "\n"; }
	return @all_concorrentes; 
}

#Devolve lista de concursos
sub get_concursos {
	my $self = shift;
	my @all_concursos = $self->schema->resultset('Concursos')->all;
	return @all_concursos;
}

#Devolve lista de enunciados
sub get_enunciados {
	my $self = shift;
  	my @all_enunciados = $self->schema->resultset('Enunciados')->all;
	return @all_enunciados;
}

#Devolve lista de linguagens
sub get_languages {
	my $self = shift;
	my @all_languages = $self->schema->resultset('Languages')->all;
	return @all_languages;
}

#Devolve lista de utilizadores
sub get_users {
	my $self = shift;
	my @all_users = $self->schema->resultset('Users')->all;
	return @all_users;
}

#Procura por um utilizador
sub search_user {
	my $self = shift;
	my $name = shift;
	chomp($name);
	my $user = $self->schema->resultset('Users')->search({name => $name})->first;
	return $user;
}

#Recebe um utilizador e faz respectivo update. Se calhar em vez de utilizador deveria ser elemento. Desde que venha com referência, pode ser qualquer coisa
sub update_user {
	my $self = shift;
        my $newuser = shift;
        $newuser->update;
}

1;
