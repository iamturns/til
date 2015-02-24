Git global ignore
=================

```
vi ~/.gitignore_global
```

```
# OS files
.DS_Store
.DS_Store?
._*
.Spotlight-V100
.Trashes
ehthumbs.db
Thumbs.db

# IDE files
.idea
*.iml
```

```
git config --global core.excludesfile ~/.gitignore_global
```
