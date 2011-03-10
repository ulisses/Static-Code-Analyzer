package MyDatabase::Main::Result::Users;

use base qw/DBIx::Class::Core/;

__PACKAGE__->table('users');
__PACKAGE__->add_columns(qw/ name email created_at updated_at encrypted_password salt admin /);
__PACKAGE__->set_primary_key('name');
#__PACKAGE__->has_many('cds' => 'MyDatabase::Main::Result::Cd');

1;
