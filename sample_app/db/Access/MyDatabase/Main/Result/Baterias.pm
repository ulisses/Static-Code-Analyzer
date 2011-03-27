package MyDatabase::Main::Result::Baterias;

use base qw/DBIx::Class::Core/;

__PACKAGE__->table('baterias');
__PACKAGE__->add_columns(qw/ nome input output created_at updated_at enunciado_id /);
__PACKAGE__->set_primary_key('nome');
#__PACKAGE__->belongs_to('cd' => 'MyDatabase::Main::Result::Cd');

1;
