package Enabler::Schema::Answers;
use base qw/DBIx::Class::Core/;

__PACKAGE__->table('answers');
__PACKAGE__->add_columns(
			id => {
				data_type => 'integer',
				is_auto_increment => 1
			},
			text => {
				data_type => 'text',
			},
			question_id => {
				data_type => 'integer',
			}
);

__PACKAGE__->set_primary_key('id');
__PACKAGE__->belongs_to(question => 'Enabler::Schema::Questions', 'question_id');
1;
