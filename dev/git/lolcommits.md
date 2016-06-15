lolcommits
==========

https://github.com/mroth/lolcommits



Install
=======

```bash
brew install imagemagick ffmpeg
gem install lolcommits
```



Setup
=====

```bash
lolcommits --enable --delay=5 --animate=1 --fork
```



More
====

```bash
lolcommits --browse
lolcommits --disable
```



To movie
========

Slow version;

    convert `find . -type f -name "*.gif" -print0 | xargs -0 ls -tlr | awk '{print $9}'` timelapse-slow.mpeg
    
Speed it up (play with 0.25 variable);

    ffmpeg -i timelapse-slow.mpeg -filter:v "setpts=0.25*PTS" timelapse.mp4
