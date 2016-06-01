Git sync branches
=================

{{remote-name}} in most cases will be 'origin'.

Your local branches can easily become out of sync when a branch is deleted by somebody else.

### Remove local remote-tracking branches deleted on remote

```
git fetch {{remote-name}} --prune
```

You may see output with a `x` and `[deleted]` marker, eg;

```
x [deleted]         (none)     -> origin/{{branch-name}}
```

It is recommended to also delete your local branch for each of the deleted remote-tracking branches listed above;

```
git branch -d {{branch-name}}
```

### Remove local branches deleted on remote

This is more of a manual process.

First, list all branches that have been merged;

```
git branch --merge
```
    
And delete applicable branches;

```
git branch -d {{branch-name}}
```
