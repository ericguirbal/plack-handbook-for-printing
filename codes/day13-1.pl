use Plack::Test;
use Test::More;
use HTTP::Request;

my $app = sub {
    return [ 200, [ 'Content-Type', 'text/plain' ],
        ["Hello"] ];
};

test_psgi $app, sub {
    my $cb = shift;

    my $req
        = HTTP::Request->new( GET => 'http://localhost/' );
    my $res = $cb->($req);

    is $res->code,    200;
    is $res->content, "Hello";
};

done_testing;
