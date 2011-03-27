package MyDatabase::Main::Result::Concorrentes;

use base qw/DBIx::Class::Core/;

#__PACKAGE__->load_components(qw/InflateColumn::DateTime/);
__PACKAGE__->table('concorrentes');
__PACKAGE__->add_columns(qw/ nome num email user_id created_at updated_at/);
__PACKAGE__->set_primary_key('user_id');
#__PACKAGE__->belongs_to('artist' => 'MyDatabase::Main::Result::Artist');
#__PACKAGE__->has_many('tracks' => 'MyDatabase::Main::Result::Track');

1;
