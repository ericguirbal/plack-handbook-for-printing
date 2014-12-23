# Catalyst
use Foo;
my $app1 = Foo->psgi_app;

# CGI::Application
use Bar;
use CGI::Application::PSGI;
my $app2 = sub {
    my $app = Bar->new( { QUERY => CGI::PSGI->new(shift) } );
    CGI::Application::PSGI->run($app);
};

# Squatting
use Baz 'On::PSGI';
Baz->init;
my $app3 = sub { Baz->psgi(shift) };

builder {
    mount "/foo" => $app1;
    mount "/bar" => $app2;
    mount "/baz" => $app3;
};

