Git daily standup command
=========================

A summary of commits from the day before

```
git log --author="{{author}}" --since="1 day ago" --all --reverse --date=local --pretty=format:"%C(yellow)%ad %Creset%s"
```

Add `--stat` for more info
