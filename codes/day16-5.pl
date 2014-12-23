use MyApp;
my $app = MyApp->psgi_app;

use Plack::Builder;
builder {
    enable "JSONP";
    $app;
};
