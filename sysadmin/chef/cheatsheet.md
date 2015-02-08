Cheatsheet
==========

Basics
------

**Resource**

Piece of infastructure to manage

Eg: file, package, service

**Action**

Performed on a resource

Eg: actions on a file = 'create', 'delete'

Every resource has a default action

Eg: default action on a file = 'create'

**Recipe**

A collection of resources and actions

Stored within an .rb file

`[sudo] chef-apply [filename]`

**Cookbook**

Collection of recipes

Eg: setup mysql

Recipe
------

```
package 'apache2'

service 'apache2' do
  action [:start, :enable]
end

file '/var/www/html/index.html' do
  content '<html>
  <body>
    <h1>hello world</h1>
  </body>
</html>'
end

```

Cookbook
--------

```
mkdir cookbooks
cd cookbooks
chef generate cookbook learn_chef_apache2
```

Run a cookbook:

```
sudo chef-client --local-mode --runlist 'recipe[learn_chef_apache2]'
```

Templates
---------

```
chef generate template learn_chef_apache2 index.html
```

Will create a file at: `learn_chef_apache2/templates/default/index.html.erb`

Reference it within the recipe:

```
template '/var/www/html/index.html' do
  source 'index.html.erb'
end
```

Dynamic config
--------------

Update `index.html.erb`:

```
<html>
  <body>
    <h1>hello from <%= node['fqdn'] %></h1>
    <pre>
      <%= node['hostname'] %>
      <%= node['platform'] %> - <%= node['platform_version'] %>
      <%= node['memory']['total'] %> RAM
      <%= node['cpu']['total'] %> CPUs
    </pre>
  </body>
</html>
```

Cookbook dependencies
---------------------

Witin `metadata.rb`:

```
depends '{{cookbook name}}'
```
