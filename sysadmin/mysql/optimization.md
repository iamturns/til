MySQL optimization / tuning
===========================

Check stats:

```
show global status
```

Some tuning scripts:

```
wget https://raw.github.com/rackerhacker/MySQLTuner-perl/master/mysqltuner.pl
chmod +x mysqltuner.pl
./mysqltuner.pl
```

```
wget http://www.day32.com/MySQL/tuning-primer.sh
chmod +x tuning-primer.sh
./tuning-primer.sh
```

**max_connections**

- Global Buffers: key_buffer_size, innodb_buffer_pool_size, innodb_log_buffer_size, innodb_additional_mem_pool_size, net_buffer_size
- Thread Buffers: sort_buffer_size, myisam_sort_buffer_size, read_buffer_size, join_buffer_size, read_rnd_buffer_size

max_connections = (Available RAM - Global Buffers) / Thread Buffers

**wait_timeout**

Default setting is way too high. Set lower. But the lower it goes, the more often you'll see "MySQL has gone away" error message.

**key_buffer_size**

Caches MyISAM indexes only

- If using MyISAM, set to 20% of *available* RAM
- If using InnoDB, set low (10M - 16M), and tweak innodb_buffer_pool_size instead

Calculate Key_read_requests / Key_reads

If it is high (say, over 10), then the key_buffer is big enough.

Dividing key_reads by key_read_requests gives our ratio of disk reads for accessing indexes the ratio of 0.04% which for this server is quite good. If enough memory is available, you should shoot for less than 0.01%.

**innodb_buffer_pool_size**

Up to 70-80% of memory for innodb only installs

**sort_buffer_size**

This buffer is allocated per connection so be careful increasing this beyond a couple of MB as it can harm performance more than it can help.

Stat to check is 'Sort_merge_passes'

Sort_merge_passes is a count of how many times the result was too large to sort in memory and a temporary file had to be used. As this is the total since the server was started, you need to take into account how long the server has been running. There’s no set rule on what is bad or good for this; obviously, you don’t want hundreds of tmp files every couple minutes but you also don’t want to sacrifice all your memory trying to completely eliminate sort_merge_passes. Since our sort_merge_passes is 0 we won’t be changing the sort_buffer_size.

**innodb_log_file_size**

Very important for write intensive workloads especially for large data sets. Larger sizes offer better performance but increase recovery times so be careful. I normally use values 64M-512M depending on server size.

256M seems to be a good balance between reasonable recovery time and good performance.

**innodb_log_buffer_size**

4M is good for most cases unless you’re piping large blobs to Innodb in this case increase it a bit.

**table_cache / table_open_cache (depending on mysql version)**

Number of table entries held in memory

Opening tables can be expensive. You do not want this to happen so frequently and it is typically best to size your cache so it is large enough to keep most of your tables open.

table_cache = (max_connections * (maxinum number of tables per join in any queries))

If Open_tables is close to table_open_cache setting, or if Opened_tables is much higher than table_open_cache, then it's too low

**query_cache_size**

If your application is read intensive and you do not have application level caches this can be great help. Do not set it too large as it may slow things down as its maintenance may get expensive. Values from 32M to 512M normally make sense

For certain workloads cache hit ratio is lower than would justify having it enabled.

The system will freeze when doing maintenance and cleaning out this cache.

(Qcache_lowmem_prunes / Qcache_inserts) = Percentage (eg 0.26 = 26%) of queries that get cached are being removed due to not enough memory

(Qcache_hits / Qcache_inserts) = Hit ratio. A result of say 5.04 means for every query inserted it's used an average of 5 times

**query_cache_limit**

Do not cache results that are larger than this number of bytes.

Default = 1MB

If query_cache_size is high, then I would set this very high, eg: 128M

If query_cache_size is small, then you want to limit what's stored in cache, so lower this one

**tmp_table_size & max_heap_table_size**

Any tmp tables that MySQL needs to create that is larger than these settings will end up on disk.

Check stat 'Created_tmp_disk_tables' and increase until it's 0

PS - both do the same thing (but affect different types of tables). Set to identical values.

**thread_cache_size**

This setting controls how many threads MySQL will keep cached for new incoming connections. On most servers the default is adequate, but if your database gets hundreds of connections per second increasing this could affect your performance significantly.

(Threads_created / Connections) = Ratio between new connections and creating new threads. Keep this very low (eg: 0.15%)

**read_rnd_buffer_size**

This buffer is used after sorting results to read the sorted rows. If you use ORDER BY often with large results, increasing this can give you a noticeable performance increase. Keep in mind this is allocated for each concurrent connection.

Rule of thumb = 1Mb of read_rnd_buffer_size for 1GB RAM

**join_buffer_size**

Depending on memory, may want to buffer up to 1M or 2M
