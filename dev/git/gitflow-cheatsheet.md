Gitflow cheatsheet
==================

Install
-------

I recommend the 'AVH' edition, which has more features and is actively maintained

https://github.com/petervanderdoes/gitflow

```
brew install git-flow-avh
```

Don't forget the fish completions!

https://github.com/bobthecow/git-flow-completion

See `/sysadmin/fish/completions/git.fish`

Commands
--------

https://github.com/petervanderdoes/gitflow/wiki

Create branches for you;

```
git flow init
```

To acccept all defaults (wise);

```
git flow init -d
```

Workflow
--------

### Start

```
git flow feature start {{name}}
```

### Sync

```
git checkout develop
git pull
git rebase develop feature//{{name}}
```

### Done

Sync as above

Tweak and tidy git history

```
git flow feature finish {{name}}
git push
```
