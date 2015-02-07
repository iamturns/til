LittleChef
==========

https://github.com/tobami/littlechef

A pocket Chef that doesn't need a Chef Server

Uses 'Chef Solo' behind the scenes - a way to use Chef Server stuff without a Chef Server

Kitchen
-------

- `littlechef.cfg` - auth, run-time options
- `nodes/`
- - `[fqdn].json` - run list
- `cookbooks/`
- `site-cookbooks/`
- `environments/` - dunno yet? @todo
- `roles/` - dunno yet? @todo
-

Environments
------------

Chef 10 does not support environments
However LittleChef allows this to be defined as 'chef_environment' in a role or node

Installation
------------

```
sudo apt-get install python-pip python-dev
pip install littlechef
```

Usage
-----

```
fix new_kitchen
```
