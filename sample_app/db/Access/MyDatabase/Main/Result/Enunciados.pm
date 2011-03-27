package MyDatabase::Main::Result::Enunciados;

use base qw/DBIx::Class::Core/;

__PACKAGE__->table('enunciados');
__PACKAGE__->add_columns(qw/ titulo desc funcao_id peso concurso_id created_at updated_at /);
__PACKAGE__->set_primary_key('titulo');
#__PACKAGE__->has_many('cds' => 'MyDatabase::Main::Result::Cd');

1;
