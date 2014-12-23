my $app = sub {...};

use Plack::Middleware::MethodOverride;
$app = Plack::Middleware::MethodOverride->wrap( $app,
    header => 'X-Method' );
