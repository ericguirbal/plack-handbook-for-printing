package Squatting::On::PSGI;
use strict;
use CGI::Cookie;
use Plack::Request;
use Squatting::H;

my %p;
$p{init_cc} = sub {
    my ( $c, $env ) = @_;
    my $cc = $c->clone;
    $cc->env     = $env;
    $cc->cookies = $p{c}->( $env->{HTTP_COOKIE} || '' );
    $cc->input   = $p{i}->($env);
    $cc->headers = { 'Content-Type' => 'text/html' };
    $cc->v       = {};
    $cc->status  = 200;
    $cc;
};

# \%input = i($env)  # Extract CGI parameters from an env object
$p{i} = sub {
    my $r = Plack::Request->new( $_[0] );
    my $p = $r->params;
    +{%$p};
};

# \%cookies = $p{c}->($cookie_header)  # Parse Cookie header(s).
$p{c} = sub {
    +{ map { ref($_) ? $_->value : $_ }
            CGI::Cookie->parse( $_[0] ) };
};

sub psgi {
    my ( $app, $env ) = @_;

    $env->{PATH_INFO} ||= "/";
    $env->{REQUEST_PATH} ||= do {
        my $script_name = $env->{SCRIPT_NAME};
        $script_name =~ s{/$}{};
        $script_name . $env->{PATH_INFO};
    };
    $env->{REQUEST_URI} ||= do {
        ( $env->{QUERY_STRING} )
            ? "$env->{REQUEST_PATH}?$env->{QUERY_STRING}"
            : $env->{REQUEST_PATH};
    };

    my $res;
    eval {
        no strict 'refs';
        my ( $c, $args )
            = &{ $app . "::D" }( $env->{REQUEST_PATH} );
        my $cc = $p{init_cc}->( $c, $env );
        my $content = $app->service( $cc, @$args );

        $res = [ $cc->status, [ %{ $cc->{headers} } ],
            [$content], ];
    };

    if ($@) {
        $res = [ 500, [ 'Content-Type' => 'text/plain' ],
            ["<pre>$@</pre>"] ];
    }

    return $res;
}

