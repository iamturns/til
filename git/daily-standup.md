Git daily standup
=================

A summary of commits from the day before

```
git log --author="{{author}}" --since=yesterday --all --reverse --format=format:'%ai - %s'

# Some more info:
git log --author="{{author}}" --since=yesterday --all --reverse --format=format:'%ai - %s' --stat
```
