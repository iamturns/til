MySQL cheatsheet
================

### import file into database

```
mysql -u username -p databasename < filename
```

### dump database to a file

```
mysqldump -u username -p dbname > filename
```

### dump a single table from a database to a file

```
mysqldump -u username -p databasename tablename > filename
```

### dump multiple databases to a file

```
mysqldump -u username -p --databases dbname1 dbname2 > filename
```

### dump a query from a database to a file

```
mysqldump --databases X --tables Y --where="column < 1000"
```

### run single query into database

```
mysql -u username -p -e "query"
```
