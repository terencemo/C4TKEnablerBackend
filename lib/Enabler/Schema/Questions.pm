package Enabler::Schema::Questions;
use base qw/DBIx::Class::Core/;

__PACKAGE__->table('questions');
__PACKAGE__->add_columns(
			id => {
				data_type => 'integer',
				is_auto_increment => 1
			},
			text => {
				data_type => 'text',
			},
			accepted_ans_id => {
				data_type => 'integer',
			},
			tag_id => {
				data_type => 'integer',
			}
);

__PACKAGE__->set_primary_key('id');
__PACKAGE__->has_many(answers => 'Enabler::Schema::Answers', 'question_id');
__PACKAGE__->belongs_to(accepted_ans => 'Enabler::Schema::Answers', 'accepted_ans_id');
__PACKAGE__->has_many(question_tags => 'Enabler::Schema::QuestionTags', 'question_id');
1;
