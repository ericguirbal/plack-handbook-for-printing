
package Plack::Middleware::BadStatusCode;
use strict;
use parent qw(Plack::Middleware);

sub call {
    my ( $self, $env ) = @_;
    my $res = $self->app->($env);
    $self->response_cb(
        $res,
        sub {
            my $res = shift;
            $res->[0] = 500 unless $res->[0] == 200;
        }
    );
}

1;
