$app = Plack::App::URLMap->new;
$app->mount( "/john", $app1 );

$app2 = Plack::Middleware::Auth::Basic->wrap( $app2,
    authenticator => ... );
$app->mount( "/bob", $app2 );

