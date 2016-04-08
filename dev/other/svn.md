SVN cheatsheet
==============

The handiest command of them all;

```
svn help [command]
```

Add this useful command to your ~/.bashrc file:

```
alias svnaddall='svn status | grep "^\?" | awk "{print \$2}" | xargs svn add'
```

Basics
------

```
svn checkout URL
svn checkout URL -r [number]

svn switch URL
svn switch URL -r [number]

svn update
svn update -r [number]

svn commit [path] -m "Message"
svn commit [path] -m "
Line 1
Line 2
"

svn add [--non-recursive] [path]

svn delete [--keep-local] [path]

svn copy [path_old] [path_new]

svn move [path_old] [path_new]

svn propset svn:ignore [ignorename] .
svn propset svn:ignore ‘*’ .
svn propset svn:ignore “one
two
three” .

svn revert [--recursive] [path]

svn status [path]

svn diff
svn diff > patchfile
svn diff -r [number] - show changes made between that revision number and head
svn diff -r [number]:[number] - show changes made between 2 revisions
svn diff -c [number] - show changes committed in that revision

svn cat -r [number] [path] - show the file contents in that revision

svn blame path

svn log [path]
svn log -v      - extra information
svn log -r [number]
svn log -r HEAD - for latest
svn log -r PREV - for one before that

svn export URL [path]
svn export path1 [path2]

svn merge [--dry-run] -c [number] [path]
svn merge [--dry-run] -r [number]:[number] [path] - higher number first
```

Resolving conflicts
-------------------

Sometimes after running svn update you might see a message like this:

```
Conflict discovered in 'filename'.
Select: (p) postpone, (df) diff-full, (e) edit,
       (h) help for more options:

The options are:

 (p)  postpone    - mark the conflict to be resolved later
 (df) diff-full   - show all changes made to merged file
 (e)  edit        - change merged file in an editor
 (r)  resolved    - accept merged version of file
 (mf) mine-full   - accept my version of entire file (ignore their changes)
 (tf) theirs-full - accept their version of entire file (lose my changes)
 (l)  launch      - launch external tool to resolve conflict
 (h)  help        - show this list
```

Usually you would select df to see the conflict

You can then edit the file by hand

When finished you use svn resolve

If merged file by hand, do this:

```
svn resolve --accept working filename
```

Or try one of these:

```
svn resolve --accept mine-full filename
svn resolve --accept theirs-full filename
```

Here’s a good one to resolve everything with your own!

```
svn resolve --accept working -R .
```

Braching
---------

```
svn copy https://monkii.springloops.com/source/xxx/trunk/ https://monkii.springloops.com/source/xxx/branches/xxx/ -m “Created xxx branch from trunk”

svn switch https://monkii.springloops.com/source/xxx/branches/xxx/
```

Keeping branch in sync with trunk;

```
Switch to BRANCH
svn merge https://monkii.springloops.com/source/xxx/trunk/
svn commit -m “Merging trunk into xxx branch”
```

Moving branch into trunk
(You must do above step first for the --reintegrate command to work properly)

```
Switch to TRUNK
svn switch https://monkii.springloops.com/source/xxx/trunk/
svn merge --reintegrate https://monkii.springloops.com/source/xxx/branches/xxx/
svn commit -m “Merging xxx branch into trunk”
```

Removing branch (you should do this after reintegrate)

```
svn delete https://monkii.springloops.com/source/xxx/branches/xxx/ -m "Remove xxx branch"
```

Ignore property recursively
---------------------------

```
svn propget -R svn:ignore
```
