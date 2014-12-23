my $app = sub { [ 200, ... ] };

use Plack::Middleware::StackTrace;
$app = Plack::Middleware::StackTrace->wrap($app);

