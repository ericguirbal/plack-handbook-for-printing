my $app = sub {
    return [ 200, [], ["Hello World"] ];
};

use Plack::Builder;
builder {
    enable "JSONP";
    enable "Auth::Basic", authenticator => sub {...};
    enable "Deflater";
    $app;
};

