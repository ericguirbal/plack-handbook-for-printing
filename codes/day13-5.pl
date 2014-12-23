use Plack::Test;
use MyCatalystApp;

my $app = MyCatalystApp->psgi_app;

test_psgi $app, sub {
    my $cb = shift;

    # ...
};
done_testing;
