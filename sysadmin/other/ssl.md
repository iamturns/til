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

`sudo openssl genrsa -out [full_domain_including_possible_subdomain].key 2048`

Some like to pass in the `des3` param, which will attach a password to the key. Sounds like a good idea, but is actually a pain, as you need to enter the password everytime apache boots. Just keep the generated file secure on the server.

Generate CSR
============

`sudo openssl req -new -key [domain_as_above].key -out [domain_as_above].csr`

- Country = AU
- State = Victoria
- Locality = Melbourne
- Organization Name = Name of website / company SSL will belong to
- Organizational Unit Name = Blank
- Common Name = [domain_as_above]
- Email Address = Blank
- Challenge password = Blank
- Optional company name = Blank

Save the key file
=================

Somewhere secure!

By doing this, if the server catastrophically loses all files, we don't need to purchase a new SSL certificate

Secure key file
===============

An example (differs for each server setup):

```
sudo chmod 600 [domain].key
sudo chown root:root [domain].key
```

Storage location
================

Pick a convention, I like this:

```
/storage/home/[name]/ssl/private/[domain].key
/storage/home/[name]/ssl/certs/[domain].csr
```
