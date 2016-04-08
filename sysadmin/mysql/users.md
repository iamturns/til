MySQL users
===========

### Create user

```
CREATE USER 'username'@'host' IDENTIFIED BY 'password';
```

'host' can be '%', meaning any host

### Grant all privileges

```
GRANT ALL PRIVILEGES ON *.* TO 'username'@'host' WITH GRANT OPTION;
```

### Grant common web privileges

```
GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, INDEX, ALTER, SHOW DATABASES, CREATE TEMPORARY TABLES, LOCK TABLES, FILE ON *.* TO 'username'@'host';
```

### View list of users

```
SELECT user, host FROM mysql.user ORDER BY user, host;
```

### View privileges of current user

```
SHOW GRANTS;
```

### View privileges of other user

```
SHOW GRANTS FOR 'username'@'host';
```

### Remember to flush for changes to take affect

```
FLUSH PRIVILEGES;
```