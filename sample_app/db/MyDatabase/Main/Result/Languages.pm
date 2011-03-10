package MyDatabase::Main::Result::Languages;

use base qw/DBIx::Class::Core/;

__PACKAGE__->table('languages');
__PACKAGE__->add_columns(qw/ ling created_at updated_at compString execString complexExecString /);
__PACKAGE__->set_primary_key('ling');
#__PACKAGE__->has_many('cds' => 'MyDatabase::Main::Result::Cd');

1;
