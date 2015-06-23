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

Feature
-------

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
git checkout develop
git push
```

Release
-------

See Semantic Versioning: http://semver.org/

### Start

```
git flow release start {{version}}
```

### Done

```
git flow release finish {{version}}
git checkout master
git push
git checkout develop
git push
```

Hotfix
------

See Semantic Versioning: http://semver.org/

### Start

```
git flow hotfix start {{version}}
```

### Done

```
git flow hotfix finish {{version}}
git checkout master
git push
git checkout develop
git push
```
