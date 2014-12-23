use Plack::Middleware::Conditional;
use Plack::Middleware::Auth::Basic;

my $app = sub {...};

$app = Plack::Middleware::Conditional->wrap(
    $app,
    builder => sub {
        Plack::Middleware::Auth::Basic->wrap( $_[0],
            authenticator => ..., );
    },
    condition => sub {
        my $env = shift;
        $env->{REMOTE_ADDR} !~ /^192\.168\.0\./;
    },
);
