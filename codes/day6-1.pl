use CGI;

my $q = CGI->new;
print $q->header('text/plain'), "Hello ", $q->param('name');

