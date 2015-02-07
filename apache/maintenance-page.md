Apache maintenance page
=======================

/.htaccess

```
# Not requesting a file
RewriteCond %{REQUEST_FILENAME} !-s

# Not requesting 'coming-soon'
RewriteCond %{REQUEST_URI} !coming-soon/?$

# Not one of the following IPs
RewriteCond %{REMOTE_ADDR} !^xxx.xxx.xxx.xxx$
RewriteCond %{REMOTE_ADDR} !^xxx.xxx.xxx.xxx$

# Not one of the following user agents
RewriteCond %{HTTP_USER_AGENT} !facebookexternalhit/[0-9]
RewriteCond %{HTTP_USER_AGENT} !^PayPal IPN

# Redirect to coming soon page
RewriteRule ^.*$ http://example.com/maintenance/ [R=307,NC,L]
```

/maintenance/index.php

```
<?php

header('HTTP/1.1 503 Service Temporarily Unavailable');
header('Status: 503 Service Temporarily Unavailable');
header('Retry-After: 3600');

$ip = isset($_SERVER['REMOTE_ADDR']) ? $_SERVER['REMOTE_ADDR'] : '?';

?>
<html>
  <head>
    <title>Website Maintenance</title>
  </head>
  <body>
    <h1>Website Maintenance</h1>
    <p>The server is temporarily unable to service your request due to maintenance downtime or capacity problems. Please try again later.</p>
  </body>
</html>

<!-- IP address: <?=htmlspecialchars($ip)?> -->
```