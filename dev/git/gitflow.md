Gitflow
=======

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
git flow feature finish --no-ff {{name}}
git checkout develop
git push
```

Release
-------

### Change log

Ensure all changes are summarised within `/CHANGELOG.md` under `Unreleased`.

Group changes to describe their impact;

- Added - New feature added
- Changed - Stable feature changed
- Deprecated - Stable feature removed
- Removed - Deprecated feature completely removed
- Fixed - Include description of bug fixed
- Security - Include description of vulnerability fixed

Order changes within each group from high impact to low impact.

### Semantic version

Decide on a new [semantic version number](http://semver.org/) based on the changes.

Increment the;
- MAJOR version when you make incompatible API changes,
- MINOR version when you add functionality in a backwards-compatible manner, and
- PATCH version when you make backwards-compatible bug fixes.

The remaining documentation refers to `{{version}}`, which must include a 'v' prefix and two dots.

### Branch

```
git flow release start {{version}}
```

### Update version

Within `/CHANGELOG.md`, change the 'Unreleased' heading to the new version number and release date.

Update the version number in `/package.json`.

### Finish & publish

```
git add -A
git commit -m "Prepare {{version}}"
git flow release finish {{version}}
git push --tags
git checkout master
git push
git checkout develop
git push
```

### Reset development branch

```
git checkout develop
```

@TODO - Perhaps prematurely increment the minor version, and append a '-dev'? This would mean anything referring to the version will at least get a different version than the official one.

Add the following heading just above the new version within `/CHANGELOG.md`

```
Unreleased
----------
```

This encourages change log activity during development.

```
git add CHANGELOG.md
git commit -m "Prepare next development version"
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
