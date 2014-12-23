my $sub = CGI::Compile->compile("/path/to/script.cgi");
my $app = CGI::Emulate::PSGI->handler($sub);
