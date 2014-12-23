use CGI::Emulate::PSGI;
CGI::Emulate::PSGI->handler(
    sub {
        do "/path/to/foo.cgi";
        CGI::initialize_globals() if &CGI::initialize_globals;
    }
);

