use CGI::Application::PSGI;
use WebApp;

my $app = sub {
    my $env = shift;
    my $app
        = WebApp->new( { QUERY => CGI::PSGI->new($env) } );
    CGI::Application::PSGI->run($app);
};

