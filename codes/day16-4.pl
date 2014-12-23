package MyApp::View::JSON;
use base qw( Catalyst::View::JSON );

package MyApp::Controller::Foo;

sub hello : Local {
    my ( $self, $c ) = @_;
    $c->stash->{message} = 'Hello World!';
    $c->forward('MyApp::View::JSON');
}

