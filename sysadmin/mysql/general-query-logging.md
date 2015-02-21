MySQL general query logging
===========================

```
mysql
SET global log_output = 'FILE';
SET global general_log_file='/var/log/mysql/general.log';
SET global general_log = 1;
exit
sudo tail -f /var/log/mysql/general.log
```
