PHP FPM + Apache notes
======================

```
MPM
    Multi-Procesing Modules
    Allows webmaster to choose with features included in server by selecting which modules to load at compile-time or run-time.
    These are the mod_* things, eg:
        mod_auth
        mod_expires
        mod_headers
        mod_mime

MPM Prefork
    Non-threaded
    Compatible with everything
    Child processes serve requests one at a time
    Not advisable, unless need a module that's not thread safe

    Spins a number of child procsesses for serving requests

    Non-threaded
    Handles requests in a manner similar to Apache 1.3

    Single proces is responsible for launching child processes

MPM Worker
    Multi-threaded
    Able to serve a large number of requests with fewer system resources
    Child processes spin off further child threads
    Handles concurrency easily, connections don't need to wait for a free thread

MPM Event
    Moved from 'experimental' to 'stable' in Apache 2.4
    Uses a dedicated thread to deal with 'kept-alive' connections
    Allows more requests by passing off some procesing work to supporting threads


Problem with Apache + mod_php is that Apache must spawn and destroy a new instance of PHP whenever a script is called
PHP by default only works with Prefork MPM

Best solution seems to be Apache + mod_fastcgi + PHP-FPM

CGI
    Common gateway interface
    Connect a webserver with any language interpreter

FastCGI
    Can keep multiple processes alive and reuse them

mod_fastcgi
    FastCGI is a module that keeps instance of PHP running in background
    When Apache receives a request it forwards it to FastCGI, which feeds to already running PHP, and then back to Apache to serve result

php5-fpm
    FPM = FastCGI Process Manager
    PHP optimized FastCGI implementation

OR better yet... Nginx + PHP-FPM!
```