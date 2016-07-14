Git cheatsheet
==============

Misc
----

```
git diff --staged
```

Log
---

```
git log -[[num]] #limit

git log --stat
git log --patch
git log --graph
git log --pretty=oneline
git log --pretty=short
git log --pretty=full
git log --pretty=fuller
git log --pretty=format:"%h - %an, %ar : %s" #totes custom

# [[date]] examples: "2008-01-15", "2 years 1 day 30 minutes ago"
git log --since=[[date]]
git log --after=[[date]]
git log --until=[[date]]
git log --before=[[date]]

git log --author=[[name]]
git log --committer=[[name]]

git log -- [[filename]]
git log -- [[directory]]

git log --grep="[[text in commit message]]"
git log -S[[text in diff]] #no equals
```

Remote
------

```
git remote -v #see all remotes
git remote add [[name]] [[url]]

git fetch [[remote name]] #can then perform merges, diffs, etc

git pull [[remote name]] [[branch name]] #git fetch && git merge
git pull #simpler - works on predefined remote and current branch
```

Branch
------

``
git branch [[branch name]] #create
git checkout [[branch name]] #switch
git checkout -b [[branch name]] #create and switch
git branch -d [[branch name]] #delete
git push [[remote name]] --delete [[branch name]] #delete on remote
```

Remove local branches that have been merged;

```
git branch --merged develop | grep -v "\*" | grep "$feature/" | xargs -n 1 git branch -d
````

Stash
-----

```
git stash show -p 'stash@{0}'
```

Dots
----

Dots are used with `log` and `diff` commands

### Diff

### No dots

Same as two dots (below)

#### Two dots

`git diff foo..bar`

Will show the difference between the two branches (nothing unusual)

#### Three dots

`git diff foo...bar`

Will show the difference between the "merge base" of the two branches, and 'bar'

It ignores everything that has been done on 'foo'

Useful to show changes that work on 'bar' has introduced since splitting from 'foo'

### Log

#### No dots

`git log foo bar`

All commits on foo OR bar, including before they split

#### Two dots

`git log foo..bar`

The same as `git diff bar ^foo`

Will show logs on 'bar', but not on 'foo'

Useful to show logs that occurred after 'bar' split from 'foo'

#### Three dots

`git log foo...bar`

Show logs on 'foo' OR 'bar', but not on both

Useful to show logs that occurred after they split

