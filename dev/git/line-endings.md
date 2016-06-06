Git line endings
================

Best to handle within a `.gitattributes` file for consistency across all users.

Great starting point: https://github.com/Danimoth/gitattributes/blob/master/Web.gitattributes

If this file was introduced late in the project, reset line endings;

```bash
git add . -u
git commit -m "Saving files before refreshing line endings"
git rm --cached -r .
git reset --hard
git add .
# You may see a lot of these messages: "warning: CRLF will be replaced by LF in file."
git commit -m "Normalize all the line endings"
```
