use Plack::Request;

my $app = sub {
    my $req = Plack::Request->new(shift);

    my $name = $req->param('name');
    my $res  = $req->new_response(200);
    $res->content_type('text/html');
    $res->content("<html><body>Hello World</body></html>");

    return $res->finalize;
};

