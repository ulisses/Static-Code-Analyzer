package MyDatabase::Main::Result::Participantes;

use base qw/DBIx::Class::Core/;

__PACKAGE__->table('participantes');
__PACKAGE__->add_columns(qw/ user_id concurso_id created_at updated_at dataRegisto /);
__PACKAGE__->set_primary_key('user_id');
#__PACKAGE__->has_many('cds' => 'MyDatabase::Main::Result::Cd');

1;
