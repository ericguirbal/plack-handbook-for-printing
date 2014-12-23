package Plack::Middleware::FakeUserAgent;
use strict;
use parent qw(Plack::Middleware);
use Plack::Util::Accessor qw(agent);

sub call {
    my ( $self, $env ) = @_;
    $env->{HTTP_USER_AGENT} = $self->agent;
    $self->app->($env);
}

1;

