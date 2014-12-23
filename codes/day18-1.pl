use Plack::Builder;

builder {
    enable_if { $_[0]->{REMOTE_ADDR} !~ /^192\.168\.0\./ }
    "Auth::Basic", authenticator => ...;
    $app;
};

