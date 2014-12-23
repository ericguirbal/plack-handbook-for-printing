use Plack::Builder;
use Authen::Simple;
use Authen::Simple::Kerberos;

my $auth = Authen::Simple->new(
    Authen::Simple::Kerberos->new( realm => ... ), );

builder {
    enable "Auth::Basic", authenticator => sub {
        $auth->authenticate(@_);
    };
    $app;
};

