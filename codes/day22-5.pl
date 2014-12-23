use Plack::App::Proxy;
use Plack::Builder;

my $app = Plack::App::Proxy->new( host => '192.168.0.2:8080' )
    ->to_app;

builder {
    mount "/app" => $app;
};

