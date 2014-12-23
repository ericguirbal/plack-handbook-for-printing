my $app = sub {
    my $env = shift;
    if ( $env->{PATH_INFO} eq '/favicon.ico' ) {
        open my $fh, "<:raw", "/path/to/favicon.ico"
            or die $!;
        return [ 200, [ 'Content-Type' => 'image/x-icon' ],
            $fh ];
    }
    elsif ( $env->{PATH_INFO} eq '/' ) {
        return [ 200, [ 'Content-Type' => 'text/plain' ],
            ["Hello again"] ];
    }
    else {
        return [ 404, [ 'Content-Type' => 'text/html' ],
            ['404 Not Found'] ];
    }
};
