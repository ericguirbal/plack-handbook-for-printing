use CGI::Application::PSGI;
use WebApp;

my $app = sub {
    my $env = shift;
    my $app
        = WebApp->new( { QUERY => CGI::PSGI->new($env) } );
    CGI::Application::PSGI->run($app);
};

use Plack::Builder;
builder {
    enable "Auth::Basic",
        authenticator => sub { $_[1] eq 'foobar' };
    $app;
};
