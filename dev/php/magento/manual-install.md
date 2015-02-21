Magento manual install
======================

The file you want is: `app/etc/local.xml`

Better to base local.xml off an existing install, as it contains encryption key (which must match)

Permissions;

```
chmod -R o+w media var
```

Database paths;

```
UPDATE core_config_data SET value = 'http://example.com/' WHERE path = 'web/unsecure/base_url';
UPDATE core_config_data SET value = 'https://example.com/' WHERE path = 'web/secure/base_url';
```
