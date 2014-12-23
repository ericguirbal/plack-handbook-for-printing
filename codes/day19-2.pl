
use CatalystApp;
CatalystApp->setup_engine('PSGI');
my $app1 = sub { CatalystApp->run(@_) };

use CGI::Application::PSGI;
use CGIApp;
my $app2 = sub {
    my $app = CGIApp->new(
        { QUERY => CGI::PSGI->new( $_[0] ), } );
    CGI::Application::PSGI->run($app);
};

use Plack::App::Cascade;
Plack::App::Cascade->new( apps => [ $app1, $app2 ] )->to_app;
