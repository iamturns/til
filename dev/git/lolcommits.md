lolcommits
==========

https://github.com/mroth/lolcommits



Install
=======

```bash
brew install imagemagick
gem install lolcommits
```



Setup
=====

* Animate = 1
* Delay = 4
* Fork = true
* Attempt to remove or shrink 'sha' `lolcommits --config -p loltext`



To movie
========

Slow version;

    convert `find . -type f -name "*.gif" -print0 | xargs -0 ls -tlr | awk '{print $9}'` timelapse-slow.mpeg
    
Speed it up (play with 0.25 variable);

    ffmpeg -i timelapse-slow.mpeg -filter:v "setpts=0.25*PTS" timelapse.mp4
