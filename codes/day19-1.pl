use Plack::App::Cascade;
use Plack::App::File;
use Plack::App::URLMap;

my @paths = qw(
    /home/www/static
    /virtualhost/example.com/htdocs/static
    /users/miyagawa/public_html/images
);

my $app = Plack::App::Cascade->new;
for my $path (@paths) {
    my $file = Plack::App::File->new( root => $path );
    $app->add($file);
}

my $map = Plack::App::URLMap->new;
$map->mount( "/static" => $app );
$map->to_app;

