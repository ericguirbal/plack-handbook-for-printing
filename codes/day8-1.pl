package CGI::Application::PSGI;
use strict;
use CGI::PSGI;

sub run {
    my ( $class, $app ) = @_;

    # HACK: deprecate HTTP header generation
    # -- CGI::Application should support some flag to turn this off cleanly
    my $body = do {
        no warnings 'redefine';
        local *CGI::Application::_send_headers = sub {''};
        local $ENV{CGI_APP_RETURN_ONLY} = 1;
        $app->run;
    };

    my $q    = $app->query;
    my $type = $app->header_type;

    my @headers = $q->psgi_header( $app->header_props );
    return [ @headers, [$body] ];
}

