APC
===

**shm_size**

Total memory available. Want this as large as possible.

**ttl**

set to 0 by default, which means once old files are held in cache, they stay forever

If your memory is getting full, or close to full, increase this number

Othewise, the higher the number the better (and disabling with 0 is best!)

**num_files_hint**

Set low by default (1000) - most frameworks have many more files

**max_file_size**

Set to 1M by default. If you want larger PHP files cached, turn this up.

**stat**

Faster, but means you have to manually clear APC cache when changing PHP files
