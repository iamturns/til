PHP FPM cheatsheet
==================

Global directives
-----------------

`php-fpm.conf`

Not many options, generally not touched

Pool directives
----------------

Default is `www.conf`

Create more, named `{{example}}.conf`

All are automatically imported

Nginx references the `www.conf` with `fastcgi_pass unix:/var/run/php5-fpm.sock;`

Nginx can reference a custom pool with: `fastcgi_pass unix:/var/run/php5-fpm.{{example}}.sock;`
