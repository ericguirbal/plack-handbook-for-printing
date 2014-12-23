use Plack::Builder;
my $app = sub {
    my $env = shift;
    if ( $env->{REMOTE_USER} ) {

        # Authenticated
    }
    else {
        # Unauthenticated
    }
};

builder {
    mount "/private" => builder {
        enable "Auth::Basic", authenticator => ...;
        $app;
    };
    mount "/public" => $app;
};
