SSL
===

Self signed
===========

```
sudo make-ssl-cert /usr/share/ssl-cert/ssleay.cnf /etc/ssl/private/[[example.com]].crt
```

You're done! Stop reading :)

Generate private key
====================

`sudo openssl genrsa -des3 -out [[example.com]].key 2048`

Generate CSR
============

`sudo openssl req -new -key [[example.com]].key -out [[example.com]].csr`

- Country = AU
- State = Victoria
- Locality = Melbourne
- Organization Name = Name of website / company SSL will belong to
- Organizational Unit Name = Blank
- Common Name = [domain_as_above]
- Email Address = Blank
- Challenge password = Blank
- Optional company name = Blank

Remove passphrase
=================

This prevents entering the passphrase everytime the web server reboots

```
sudo cp [[example.com]].key [[example.com]].key.org
sudo openssl rsa -in [[example.com]].key.org -out [[example.com]].key
```

Optional - self sign
====================

`sudo openssl x509 -req -days 365 -in [[example.com]].csr -signkey [[example.com]].key -out [[example.com]].crt`

Save the key file
=================

Somewhere secure!

By doing this, if the server catastrophically loses all files, we don't need to purchase a new SSL certificate

Secure key file
===============

An example (differs for each server setup):

```
sudo chmod 600 [[example.com]].key
sudo chown root:root [[example.com]].key
```

Storage location
================

Pick a convention, I like this:

```
/storage/home/[[name]]/ssl/private/[[example.com]].key
/storage/home/[[name]]/ssl/certs/[[example.com]].csr
```

Or

```
/etc/ssl/private/
```
