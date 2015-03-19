External access
===============

Local IP address:

```
ipconfig getifaddr en0
```

Homestead config:

```
- map: website.local
  to: /home/vagrant/Code/website

- map: website.192.168.5.42.xip.io
  to: /home/vagrant/Code/website
```

/etc/hosts:

```
192.168.10.10 website.local
192.168.10.10 website.192.168.5.42.xip.io
```

Done

```
homestead provision
```
