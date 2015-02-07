Capistrano cheatsheet
=====================

Basics
------

Install:

```
bundle exec cap install
```

View all available tasks:

```
cap -T
```

Capfile
-------

Read first

Essentially a ruby script

Defines server roles and tasks

Tasks
-----

```
task :search_libs, :hosts -> "www.capify.org" do
  run "ls -x1 /usr/lib | grep -i xml"
end
```

Execute with: `cap search_libs`

Roles
-----

Adding 'hosts' to each task will get pretty crazy, use *roles*

```
role :libs, "www.capify.org"

task :search_libs do
  run "ls -x1 /usr/lib | grep -i xml"
end

task :count_libs do
  run "ls -x1 /usr/lib | wc -l"
end
```

By default, a task is executed on all servers and all roles

Multiple servers
----------------

```
role :libs, "private.capify.org", "mail.capify.org"
```

Multiple roles
--------------

```
role :libs, "crimson.capify.org", "magenta.capify.org"
role :files, "fuchsia.capify.org"

task :search_libs, :roles -> :libs do
  run "ls -x1 /usr/lib | grep -i xml"
end

task :count_libs, :roles -> :libs do
  run "ls -x1 /usr/lib | wc -l"
end

task :show_free_space, :roles -> :files do
  run "df -h /"
end
```

Deploy structure
----------------

```
[deploy_to]
[deploy_to]/releases
[deploy_to]/releases/20080819001122
[deploy_to]/releases/...
[deploy_to]/shared
[deploy_to]/shared/log
[deploy_to]/shared/pids
[deploy_to]/shared/system
[deploy_to]/current -> [deploy_to]/releases/20100819001122
```

Each deploy, a new 'release' is create, and 'current' directory is symbolically linked to it

The web server root should be set to something like `[deploy_to]/current/public`

Deploy commands
---------------

```
deploy:setup - setup directory tree as above
deploy:check - check permissions, and that required dependencies exist
deploy:update - push files out to server
deploy:start
deploy:restart
```

Deploy flow
-----------

```
deploy
  deploy:starting
    [before]
      deploy:ensure_stage
      deploy:set_shared_assets
    deploy:check
  deploy:started
  deploy:updating
    git:create_release
    deploy:symlink:shared
  deploy:updated
    [before]
      deploy:bundle
    [after]
      deploy:migrate
      deploy:compile_assets
      deploy:normalize_assets
  deploy:publishing
    deploy:symlink:release
  deploy:published
  deploy:finishing
    deploy:cleanup
  deploy:finished
    deploy:log_revision
```
