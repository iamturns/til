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
```

Stash
-----

```
git stash show -p 'stash@{0}' 
```
