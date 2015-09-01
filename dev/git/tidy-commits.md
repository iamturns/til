Git - tidy commits
==================

Great resource: https://github.com/blog/2019-how-to-undo-almost-anything-with-git

## New commit message for last commit

```
git commit --amend -m "New commit message"
```

## Interactive rebase on last X commits

```
git rebase --interactive HEAD~[[number of commits]]
```

## Interactive rebase since branch creation


Visually see which commit created the new branch:

```
git log --graph --oneline --all
```

Then pass it into:

```
git rebase --interactive [[sha]]
```

## Split commits


Mark commit(s) as 'edit' in interactive rebase:

```
git rebase --interactive HEAD~[[number of commits]]
```

When dropped to console, run this command to undo the commit and get files unstaged

```
git reset HEAD^
```

Finish up with:

```
git rebase --continue
```

## Revert commit

### Pushed

```
git revert [[sha]]
```

Then, if you only want to revert SOME of the files within that commit,

```
git rebase --interactive HEAD~1
git reset HEAD^
```

Commit what is needed, discard the rest, finish with:

```
git rebase --continue
```

### Not yet pushed

```
git reset --soft HEAD~1
```

Now, edit files

