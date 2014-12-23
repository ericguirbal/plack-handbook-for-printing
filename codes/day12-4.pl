use Plack::Builder;
builder {
    mount "/john" => $app1;
    mount "/bob"  => builder {
        enable "Auth::Basic", authenticator => ...;
        $app2;
    };
};

