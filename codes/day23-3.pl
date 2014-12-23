use Plack::Builder;

builder {
    enable "FakeUserAgent", agent => "Mozilla/3.0 (MSIE 4.0)";
    $app;
};

