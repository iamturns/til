Ubuntu mono sound
=================

Sometimes I code with just one earbud in, so I can hear my surroundings.

However, you can often miss out quite a bit of music, perhaps hearing only one guitarist of the two in the band!

Create a file: `~/.asoundrc` with the contents:

```
pcm.mono_right {
  type route
  slave.pcm  "cards.pcm.default"
  ttable.0.1 0.5 #in-channel 0, out-channel 1, 50% volume
  ttable.1.1 0.5 #in-channel 1, out-channel 1, 50% volume
}

pcm.mono_left {
  type route
  slave.pcm  "cards.pcm.default"
  ttable.0.0 0.5  #in-channel 0, out-channel 0, 50% volume
  ttable.1.0 0.5  #in-channel 1, out-channel 0, 50% volume
}

# Replacing default device
# choose the correct line and comment another one
#pcm.!default pcm.mono_right
pcm.!default pcm.mono_left
```

Toggle the comment between the last two lines, or comment them both to disable the script
