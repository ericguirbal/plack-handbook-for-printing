# Wrapped application
my $app = sub {
    my $env = shift;
    my $who
        = $env->{HTTP_USER_AGENT} =~ /Mobile Safari/
        ? 'iPhone'
        : 'non-iPhone';
    return [ 200, [ 'Content-Type', 'text/html' ],
        ["Hello $who"] ];
};

# Middleware to wrap $app
my $mw = sub {
    my $env = shift;
    $env->{HTTP_USER_AGENT} .= " (Mobile Safari)";
    $app->($env);
};

