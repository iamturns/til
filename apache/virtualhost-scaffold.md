Apache virtualhost scaffold
===========================

Name file as [[example.com]].conf

```
<VirtualHost *:80>

    ServerName [[example.com]]
    DocumentRoot /var/www/[[example]]

    CustomLog /var/log/apache2/access-[[example]].log combined
    ErrorLog /var/log/apache2/error-[[example]].log
    LogLevel warn

    <Directory />
        Options Indexes FollowSymLinks MultiViews
        AllowOverride All
        Order allow,deny
        allow from all
    </Directory>

</VirtualHost>

<VirtualHost *:443>

    ServerName [[example.com]]
    DocumentRoot /var/www/[[example]]

    CustomLog /var/log/apache2/access-[[example]].log combined
    ErrorLog /var/log/apache2/error-[[example]].log
    LogLevel warn

    SSLEngine On

    # sudo make-ssl-cert /usr/share/ssl-cert/ssleay.cnf /etc/ssl/private/[[example.com]].crt
    SSLCertificateFile /etc/ssl/private/[[example.com]].crt

    <Directory />
        Options Indexes FollowSymLinks MultiViews
        AllowOverride All
        Order allow,deny
        allow from all
    </Directory>

</VirtualHost>
```