package Enabler::Schema::QuestionTags;
use base qw/DBIx::Class::Core/;

__PACKAGE__->table('question_tags');
__PACKAGE__->add_columns(
			id => {
				data_type => 'integer',
				is_auto_increment => 1
			},
			tag_id => {
				data_type => 'integer',
			},
			question_id => {
				data_type => 'integer',
			}
);

__PACKAGE__->set_primary_key('id');
__PACKAGE__->belongs_to(question => 'Enabler::Schema::Questions', 'question_id');
__PACKAGE__->belongs_to(tag => 'Enabler::Schema::Tags', 'tag_id');
1;
