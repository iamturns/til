xDebug setup within vagrant
===========================

Installation
------------

### Server

```
vagrant ssh
sudo apt-get install php5-xdebug
```

Apache, create file: `/etc/php5/mods-available/custom-xdebug.ini`


Nginx, create file: `/etc/php5/conf.d/custom-xdebug.ini`

File contents:

```
xdebug.remote_enable = 1
xdebug.remote_autostart = 0
xdebug.remote_host = 10.0.2.2
xdebug.remote_port = 9000

xdebug.profiler_enable_trigger = 1
xdebug.profiler_output_dir = /var/www/xdebug

xdebug.var_display_max_depth = 10
xdebug.var_display_max_children = 512
xdebug.var_display_max_data = 2048

xdebug.max_nesting_level = 250
```

Apache:

```
sudo ln -s /etc/php5/mods-available/custom-xdebug.ini /etc/php5/apache2/conf.d/30-custom-xdebug.ini
sudo ln -s /etc/php5/mods-available/custom-xdebug.ini /etc/php5/cli/conf.d/30-custom-xdebug.ini
sudo service apache2 restart
```

Nginx:

```
sudo service php5-fpm restart
```

### IDE

Debug port: 9000

#### JetBrains

To setup: Preferences > Languages & Frameworks > PHP > Debug

To tweak path mappings: Preferences > Languages & Frameworks > PHP > Servers

Usage
-----

Set your IDE to listen for PHP debug connections

### Browser

Append the following GET variable to the URL to start debugging:
```
XDEBUG_SESSION_START=1
```

And to stop:
```
XDEBUG_SESSION_STOP=1
```

Alternative methods:

 * [Google Chrome extension](https://chrome.google.com/webstore/detail/xdebug-helper/eadndfjplgieldjbigjakmdgkmoaaaoc)
 * [Bookmarklets](https://www.jetbrains.com/phpstorm/marklets/)

### Command line

Start:
```
export XDEBUG_CONFIG="XDEBUG_SESSION_START=1"
```

Stop:
```
unset XDEBUG_CONFIG
```

#### JetBrains

For path mappings to apply, you must also set the server name:

```
export PHP_IDE_CONFIG="serverName=[[name of server]]"
```
