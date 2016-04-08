Slow sendmail fix
=================

Check your mail error log:

`tail /var/log/mail.err`

If you see:

```
sendmail[6059]: My unqualified host name (example-desktop) unknown; sleeping for retry
sm-msp-queue[6053]: unable to qualify my own domain name (example-desktop) -- using short name
```

The fix is to add .localdomain (or some fake domain) to your `/etc/hosts`

Before:

```
127.0.0.1 localhost
127.0.1.1 example-desktop
```

After:

```
127.0.0.1 localhost localhost.localdomain
127.0.1.1 example-desktop example-desktop.localdomain
```