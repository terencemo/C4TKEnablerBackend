package Enabler::Schema::Tags;
use base qw/DBIx::Class::Core/;

__PACKAGE__->table('tags');
__PACKAGE__->add_columns(
			id => {
				data_type => 'integer',
				is_auto_increment => 1
			},
			name => {
				data_type => 'varchar',
				size => 255
			}
);

__PACKAGE__->set_primary_key('id');
__PACKAGE__->has_many(question_tags => 'Enabler::Schema::QuestionTags', 'tag_id');
1;

