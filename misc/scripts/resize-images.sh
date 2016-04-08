Resize images
=============

```
#!/bin/bash
for filepath in *.jpg
do
  echo "$filepath"
  height=$( identify -format '%h' "$filepath" )
  if [ "$height" -le "800" ]
  then
    echo " skipping, height = $height"
    continue
  fi
  echo " resizing..."
  convert "$filepath" -resize x800 -quality 95 "$filepath"
done
```
