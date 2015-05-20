Gitflow cheatsheet
==================

Install
-------

I recommend the 'AVH' edition, which has more features and is maintained

https://github.com/petervanderdoes/gitflow

```
brew install git-flow-avh
```

Don't forget the fish completions!

See `/sysadmin/fish/completions/git.fish`

Workflow
--------

Start

```
git flow feature start {{name}}
```

Done

```
git checkout develop
git pull
git rebase develop feature/{{name}}
git flow feature finish {{name}}
```

To squash commits:

```
git flow feature finish -S {{name}}
```

Commands
--------

https://github.com/nvie/gitflow/wiki/Command-Line-Arguments

Create branches for you;

```
git flow init
```

To acccept all defaults (wise);

```
git flow init -d
```

```
git flow feature list
git flow feature start {{name}}
git flow feature finish {{name}}

git flow release # list
git flow release start {{version}}
git flow release finish {{version}}

git flow hotfix # list
git flow hotfix start {{name}}
git flow hotfix finish {{name}}
```




