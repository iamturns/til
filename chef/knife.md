Knife
=====

Interface between local chef repo and chef server

Skipping most information about this, as using 'LittleChef' is easier

Nodes
-----

Any phsyical, virtual, or cloud machine configured to be maintainted by chef

Environment
-----------

Allows for different workflows, eg 'production', 'staging', 'testing', 'development'

Begins with 'default' environment, which cannot be deleted

Does not seem to specify much

Roles
-----

Eg: 'master', 'child'

Consists of a run list, and usually attributes and config for cookbooks

Data bag
--------

Global variable

Stored as JSON

Can be loaded by recipe or accessed during search

Attributes
----------

Attributes are always applied by the chef-client in the following order:
- A default attribute located in a cookbook attribute file
- A default attribute located in a recipe
- A default attribute located in an environment
- A default attribute located in role
- A force_default attribute located in a cookbook attribute file
- A force_default attribute located in a recipe
- A normal attribute located in a cookbook attribute file
- A normal attribute located in a recipe
- An override attribute located in a cookbook attribute file
- An override attribute located in a recipe
- An override attribute located in a role
- An override attribute located in an environment
- A force_override attribute located in a cookbook attribute file
- A force_override attribute located in a recipe
- An automatic attribute identified by Ohai at the start of the chef-client run

Create cookbook
---------------

```
knife cookbook create {{cookbook name}} -o directory/
```

However this is generally overkill, and you will probably only require a default recipe file;
- `site-cookbooks/{{cookbook name}}/recipes/default.rb`
