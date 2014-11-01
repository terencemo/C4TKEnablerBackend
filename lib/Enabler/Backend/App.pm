package Enabler::Backend::App;
use Dancer ':syntax';
use Enabler::Schema;
use JSON;
#use JSON;

our $VERSION = '0.1';
our $schema;
our $json;

BEGIN {
	$schema = Enabler::Schema->connect("dbi:mysql:enabler", "enabler", "enabler");
	$json = JSON->new;
}

get '/' => sub {
    template 'index';
};

get qr{/question/(\d+)} => sub {
	my ($id) = splat;
	debug("Id = $id");
	my $row = $schema->resultset('Questions')->find($id);
	return $json->encode( $row->to_hash() );
};

get '/question' => sub {
	my $rs = $schema->resultset('Questions')->search();
	my $questions = [];
	while (my $row = $rs->next) {
		push(@$questions, $row->to_hash() );
	}
	return $json->encode($questions);
};

true;
