package MyDatabase::Main::Result::Results;

use base qw/DBIx::Class::Core/;

__PACKAGE__->table('results');
__PACKAGE__->add_columns(qw/ created_at updated_at user_id concurso_id enunciado_id bestRes tentativa_id /);
#__PACKAGE__->set_primary_key('user_id');
#__PACKAGE__->has_many('cds' => 'MyDatabase::Main::Result::Cd');

1;
