Force push
==========

Sometimes, you really want to rebase, but you've already pushed

So, disgusted with yourself, you force push it up

What about your poor teammates? They need to be told BEFORE you do it, and they need to be okay with it

Once finished, here's how they update;

```
git checkout {{branch-name}}
git fetch
git reset --hard origin/{{branch-name}}
```
