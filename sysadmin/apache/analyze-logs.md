Analyze Apache logs
===================

Extract date range;

```
awk '/22\/Aug\/2011:00:00:/, /28\/Aug\/2011:23:59:/' access.log
```

Merge with awstats;

```
sudo /usr/local/awstats/tools/logresolvemerge.pl /path/to/logs/*>/path/to/logs/all.log
```

Get activity by IP address from access logs;

```
tail -10000 access.log | awk '{print $1}' | sort | uniq -c | sort -n
```
