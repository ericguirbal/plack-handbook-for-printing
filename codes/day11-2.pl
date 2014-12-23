$app = Plack::Middleware::Deflater->wrap($app);
$app = Plack::Middleware::Auth::Basic->wrap( $app,
    authenticator => sub { } );
$app = Plack::Middleware::JSONP->wrap($app);

