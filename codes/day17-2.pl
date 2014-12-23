builder {
    enable "Static", path => sub {s!^/static/!!},
        root => './static-files';
    $app;
};
