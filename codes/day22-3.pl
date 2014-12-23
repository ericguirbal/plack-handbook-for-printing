# Tatsumaki app
sub get {
    my $self = shift;
    my $uid  = $self->request->session->get('uid');
    $self->request->session->set( last_access => time );
    ...;
}

