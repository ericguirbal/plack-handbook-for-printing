use Plack::Builder;
builder {
    enable "JSONP";
    $app;
};

