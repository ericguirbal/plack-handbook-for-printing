use HTTP::Request::Common;

test_psgi $app, sub {
    my $cb  = shift;
    my $res = $cb->( GET "/" );

    # ...
};

