use Plack::Builder;

builder {
    mount "/static" =>
        Plack::App::File->new( root => "./static-files" );
    mount "/" => $app;
};

