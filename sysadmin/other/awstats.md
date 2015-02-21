AWstats
=======

Download, place inside /usr/local/awstats/

Either update an existing config: `sudo nano /etc/awstats/awstats.xxx.conf`

Or create a new one: `sudo perl /usr/local/awstats/tools/awstats_configure.pl`

```
sudo rm /var/lib/awstats/* -r

sudo /usr/local/awstats/wwwroot/cgi-bin/awstats.pl -update -config=xxx

http://localhost/awstats/awstats.pl?config=xxx
```
