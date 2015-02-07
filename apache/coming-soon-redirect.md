Apache coming soon redirect
===========================

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
RewriteRule ^.*$ http://example.com/coming-soon/ [R=307,NC,L]
```
