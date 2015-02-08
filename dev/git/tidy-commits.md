Git - tidy commits
==================

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
