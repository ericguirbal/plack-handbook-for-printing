my $app = sub {...};

# Middleware to fake status code to 500
my $mw = sub {
    my $env = shift;
    my $res = $app->($env);
    $res->[0] = 500 unless $res->[2] == 200;
    $res;
};
