Compression
===========

Tar
---

````
tar -cvf {{archive_name}} {{input_directory}}
tar -xvf {{archive_name}} [-C {{output_directory}}]

Add one of these compression methods:
-a method based on filename suffix (not well supported)
-z gz
-j bz2
```

Zip
---

```
zip -r archive_name.zip directory_to_compress
unzip archive_name.zip
```
