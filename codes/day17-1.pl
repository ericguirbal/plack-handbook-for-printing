use Plack::Builder;

my $app = sub {...};

builder {
    enable "Static", path => qr!^/static!, root => './htdocs';
    $app;
};

