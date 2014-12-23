use Plack::App::URLMap;
my $app = Plack::App::URLMap->new;
$app->mount( "/john" => $app1 );
$app->mount( "/bob"  => $app2 );

