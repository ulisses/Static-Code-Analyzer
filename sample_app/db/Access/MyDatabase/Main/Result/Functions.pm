package MyDatabase::Main::Result::Functions;

use base qw/DBIx::Class::Core/;

__PACKAGE__->table('functions');
__PACKAGE__->add_columns(qw/ func created_at updated_at /);
__PACKAGE__->set_primary_key('func');
#__PACKAGE__->has_many('cds' => 'MyDatabase::Main::Result::Cd');

1;
