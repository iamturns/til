Git workflow cheatsheet
=======================

Works well for me :)

Begin
-----

```
git checkout -b [[feature name]]
```

Master to branch sync
---------------------

```
git fetch origin master
git rebase origin/master
```

Done
----

```
# Update master
git checkout master
git fetch origin
git rebase origin/master

# Merge master into feature branch
git checkout [[feature name]]
git rebase master

# Fast forward master branch to include feature
git checkout master
git rebase [[feature name]]

# Done
git push
git branch -d [[feature name]]
```
