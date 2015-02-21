Puppet cheatsheet
=================

Resource
========

Unit of configuration

Defined as:

```
type {'title':
  attribute => value,
}
```

Alternate method - array of titles

Treated as multiple resource declarations with identical attributes

```
type { ['title1', 'title2', 'title3']:
  attribute => value
}
```

Alternate method - semicolon after attribute block

```
type {
  'title1':
    attribute => value,
    attribute => value;

  'title2':
    attribute => value,
    attribute => value;
}
```

type
----

- Common ones include files on disk, cron jobs, user accounts, services, software packages, etc
- Reference: http://docs.puppetlabs.com/references/latest/type.html

title
-----

- Identifying string
- Does not need to bear any relationship to actual target system
- Must be unique per resource type

attributes
----------

Common attributes:
- ensure
- present
- absent
- file
- directory
- link

Full example
------------

```
file {'name':
  path => '/path/' (usually not required, defaults to 'name')
  content => '',
  mode => 0644,
}
```

Parse order
===========

Not applied in order they are written

http://docs.puppetlabs.com/puppet/latest/reference/lang_relationships.html

Containment
===========

Classes and defined types

http://docs.puppetlabs.com/puppet/latest/reference/lang_containment.html

Add or modify attributes
========================

```
type {'title':
  attribute => value
}

type['title'] {
  attribute => value
}
```

Manifests
=========

.pp files
Contain the resources

puppet apply /path/to/manifest.pp


Ordering
========

Use 'before', 'require', 'notify' and 'subscribe' params

The value of these params is a resource reference, eg: Type['title']

Notice capitalized type and square brackets

*before*

- Run me before this other thing

*require*

- Run other thing before me

*subscribe*

- Run me if this other thing changes
- Usually used on service type, subscribe to config file. Will restart service if config updated.

*notify*

- Run other thing if I change
- Usually used on config file. Will notify service to restart if changed.

Chaining arrows
---------------

-> = set order
~> = set notification

```
Type['title'] -> Type['title']
```

Or

```
type {'title':
  attribute => value
}
->
type {'title'}
```

Variables
=========

```
$my_variable = "String"
notify {$my_variable:}
```

All variables also have a fully-qualified name

Eg: `$scope::my_variable`

`$::variable_name` refers to top/global scope

Can only be assigned once in a given scope. Similar to constants.

Facts
=====

Built-in pre-assigned variables to use, eg: `$ipaddress`, `$operatingsystem`, `$puppetversion`

All facts are strings, if you need them as boolean, use str2bool("$variable")

Conditional statements
======================

```
if condition {
  block of code
}
elsif condition {
  block of code
}
else {
  block of code
}
```

Classes
=======

```
class my_class {
  $my_variable = "Whatever"
  notify {"Hello":}
}
```

Run the code within the class:

```
include my_class
```

Use variables within the class elsewhere:

```
$my_class::my_variable
```

Parameters

```
class echo_class ($to_echo = "default value") {
  notify {"What are we echoing? ${to_echo}.":}
}

class {'echo_class':
  to_echo => 'Custom value',
}
```

Modules
=======

Directories with files arranged in a predictable structure

Name of directory = module name

- Must contain a 'manifests' directory
  - Contains .pp files
  - Should contain 'init.pp' file
  - Single class definition - same name as module name

Other common directories

- files/
  - Static files, which nodes can download
- templates/
  - More on templates later
- lib/
  - Plugins, custom facts, custom resource types
- tests/ or examples/

Puppet file could consist of something like:

```
include module1
include module2
```

Every file within must contain a class named as follows:

- `<MODULE NAME>::<OPTIONAL SUBDIRECTORY NAME>::<FILENAME>`

Eg:

- file on disk: `modules/apache/manifests/mod_passenger.pp`
- name of class: `apache::mod_passenger`

Templates
=========

```
file {'path':
  content => template('sub-dir/template-name.erb')
}
```

Variable access

```
@my_variable
scope.lookupvar('scope::my_variable')
```

Print a variable

```
<%= my_variable %>
```

Array loop

```
<% @_servers.each do |this_server| -%>
server <%= this_server %>
<% end -%>
```

If statements

```
<% if @is_virtual == "true" -%>
```
