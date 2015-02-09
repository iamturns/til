Git stash
=========

Usually run `git add -A` before stashing, otherwise untracked files won’t be stashed

**Simple stash**

```
git stash
```

**Stash with a name (recommended)**

```
git stash save "[[name]]"
```

**List of stashes**

```
git stash list
```

**Reference a stash**

```
stash@{[[num]]}
```

Eg: `git diff stash@{0}`

**Apply latest stash**

```
git stash apply
```

**Apply specific stash**

```
git stash apply stash@{[[num]]}
```

**Delete stash**

Good idea after applying, if not needed again

```
git stash drop stash@{[[num]]}
```

**Pop**

Stash should be a temporary holding place; ideally you will have 1 stash, and then apply and drop it soon

To apply and drop the latest stash

```
git stash pop
```

If you get conflicts with the above command, you will need to fix and then drop the stash manually

```
git stash drop
```

**Remove all stashes**

```
git stash clear
```

**Late branching**

A common problem - you just decided (a little too late) that you should have created a branch for the work you’ve already begun

```
git stash
git stash branch [[new branch name]]
```

Too easy!
