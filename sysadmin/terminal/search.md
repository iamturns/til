Search
======

Search for files by pattern;

```
find /path/ -name '*.xxx'
```

Search for text within files;

```
grep -r 'search term' /directory/
```

or if within directory;

```
grep -r 'search term' *
```

Search and replace;

```
sed -i -s 's/SEARCH/REPLACE/g' file
```
