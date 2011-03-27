package MyDatabase::Main::Result::Tentativas;

use base qw/DBIx::Class::Core/;

__PACKAGE__->table('tentativas');
__PACKAGE__->add_columns(qw/ user_id path compilou enunciado_id created_at updated_at execStop passedTests tExec language_id /);
__PACKAGE__->set_primary_key('user_id');
#__PACKAGE__->has_many('cds' => 'MyDatabase::Main::Result::Cd');

1;
