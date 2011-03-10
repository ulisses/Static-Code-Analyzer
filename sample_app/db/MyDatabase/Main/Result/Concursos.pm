package MyDatabase::Main::Result::Concursos;

use base qw/DBIx::Class::Core/;

__PACKAGE__->table('concursos');
__PACKAGE__->add_columns(qw/ tit chave user_id created_at updated_at inicio fim dur /);
__PACKAGE__->set_primary_key('user_id');
#__PACKAGE__->has_many('cds' => 'MyDatabase::Main::Result::Cd');

1;
