use Plack::Builder;

my $app = sub {...};

builder {
    enable "Auth::Basic", authenticator => sub {
        my ( $username, $password ) = @_;
        return $username eq 'admin' && $password eq 'foobar';
    };
    $app;
};

