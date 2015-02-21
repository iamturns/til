Apache optimization
===================

Tune the 'prefork' area. Most Apache's are setup to use prefork option, as it's the oldest and most stable method.

**KeepAlive**

Allows connection to stay open, and have the client request multiple things over the one connection.

**KeepAliveTimeout**

Set this to something reasonably low, 1.5 to 2 times your page load speed.

**TimeOut**

The default is around 2 minutes – way too long to tie up a single process. I set mine to 20 seconds.

**StartServers**

The number of threads Apache starts with. I set this to 2 threads. Most sites should do fine with 2-5 startup threads. Busy sites should tune based on the number and speed of CPU’s.

If you keep a small number of servers active most of the time, keep this number low. Keep it low especially if MaxSpareServers is also low, as if there is no load Apache will kill its children before they have been utilized at all. If your service is heavily loaded, make this number close to MaxClients, and keep MaxSpareServers equal to MaxClients.

**MinSpareServers**

How many idle threads should be running to quickly accept new connections.

If your server performs other work besides web serving, make this low so the memory of unused children will be freed when the load is light. If your server's load varies (you get loads in bursts) and you want fast response for all clients at any time, you will want to make it high, so that new children will be respawned in advance and are waiting to handle bursts of requests.

**MaxSpareServers**

The logic is the same as for MinSpareServers - low if you need the machine for other tasks, high if it's a dedicated web host and you want a minimal delay between the request and the response.

**MaxClients**

The maximum number of clients Apache threads will handle before adding new connection requests to the queue. The main constraint Apache usually hits is server memory, so a good rule of thumb is to set this based on Apache thread memory and your system free memory.

We want this variable to be as small as possible, because in this way we can limit the resources used by the server children

MaxClients = Total RAM dedicated to Webserver / Max child's process size

Not too low, so you don't get into a situation where clients are waiting for the server to start serving them (they might wait, but not for very long). However, do not set it too high. With a high MaxClients, if you get a high load the server will try to serve all requests immediately. Your CPU will have a hard time keeping up, and if the child size * number of running children is larger than the total available RAM your server will start swapping. This will slow down everything, which in turn will make things even slower, until eventually your machine will die.

**MaxRequestsPerChild**

Limit on the number of requests that an individual child server process will handle

After MaxRequestsPerChild requests, the child process will die.

Setting this to non-zero limits solves memory leaks

Set number low - allows system to reclaim memory a child process consumed

However if too low then server is spending too much time creating children processes unnecessarily
