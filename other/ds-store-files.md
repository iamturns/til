Kill .DS_Store files
====================

Careful with this, it can traverse into shared directories

```
sudo find / -name ".DS_Store" -depth -exec rm {} \;
```

Then install Asepsis and it'll never happen again


