Librarian-Chef
==============

https://github.com/applicationsonline/librarian-chef

Bundler for chef repositories

Similar to composer, npm, etc

Reads `Cheffile` contents and installs within `cookbooks/` directory

Any site specific stuff should be moved to somewhere like `site-cookbooks/`

Go shopping at: https://supermarket.chef.io/

Cheffile
--------

This example should be self explanatory;

```
site 'https://supermarket.getchef.com/api/v1'

cookbook 'ntp'
cookbook 'timezone', '0.0.1'

cookbook 'rvm',
  :git => 'https://github.com/fnichol/chef-rvm',
  :ref => 'v0.7.1' # default = 'master'
  :path => '' # use this for any repositories with many cookbooks

cookbook 'rvm',
  :github => 'fnichol/chef-rvm'

cookbook 'cloudera',
  :path => 'vendor/cookbooks/cloudera-cookbook'

```

Usage
-----

```
sudo apt-get install ruby-dev

gem install librarian-chef
echo /cookbooks >> .gitignore
echo /tmp >> .gitignore

# Create chef file:
librarian-chef init

librarian-chef install [--clean] [--verbose]

git add Cheffile
git add Cheffile.lock

# See what's outdated:
librarian-chef outdated [--verbose]

# Update versions:
librarian-chef update [package1] [package2...] [--verbose]

```

Config
------

Three sources (high to low)
- The local config (`./.librarian/chef/config`)
- The environment
- The global config (`~/.librarian/chef/config`)

```
# Inspect config:
librarian-chef config

librarian-chef config [key]

librarian-chef config [key] [value] --global
librarian-chef config [key] --global --delete

librarian-chef config [key] [value] --local
librarian-chef config [key] --local --delete

```

