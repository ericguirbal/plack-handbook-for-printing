use Plack::Builder;
my $app = sub {...};

builder {
    enable "StackTrace";
    enable "MethodOverride", header => 'X-Method';
    enable "Deflater";
    $app;
};
