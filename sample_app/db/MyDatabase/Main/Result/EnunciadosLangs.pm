package MyDatabase::Main::Result::EnunciadosLangs;

use base qw/DBIx::Class::Core/;

__PACKAGE__->table('enunciados_langs');
__PACKAGE__->add_columns(qw/ enunciado_id language_id created_at updated_at/);
#__PACKAGE__->set_primary_key('user_id');
#__PACKAGE__->has_many('cds' => 'MyDatabase::Main::Result::Cd');

1;
