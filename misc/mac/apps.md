Apps
====

Must have
---------

In order;

- Google Chrome
- 1Password
- TextExpander
- LaunchBar
- Google Drive
- Dropbox

System
------

- Android File Transfer - for getting files from android phone
- Asepsis - access NTFS drives
- Boxcryptor - access encrypted files stored on cloud
- Caffeine - shortcut to keep mac on (good for presentations etc)
- Disk Inventory X - find what it using hard drive space
- Flux - Go easy on the eyes
- Keka - archive files (zip, etc)
- Spectacle - window snapping
    - Set shortcuts as per [keyboard shortcuts](/misc/keyboard-shortcuts.md)

Productivity
------------

- Evernote
    - Sign in with `+evernote` account
- TickTick
- Workflowy

Fun
---

- Franz - chat (slack, hangouts, facebook messenger, etc)
- Skype
- Spotify
- Steam
- Twitter
- VLC - videos
- VOX - playing music

Dev
---

- Dash - Offline docs
- DiffMerge
- Docker
- FileZilla
- Firefox - Testing
- GitUp
    - Not 100% sure on this
- iTerm - better terminal
- Marked - markdown viewer
- NodeJS
- Sequel Pro
- SourceTree
    - Possibly install an older version on purpose, check reviews
- Vagrant
- Virtualbox
- Xcode

Misc
----

- Adobe Creative Cloud
- licecap - creating gifs
    - Possibly something better now?
- PhotoSweeper X - detect duplicate images
- Rest - take breaks
- Ulysses - writing

Nativefier
----------

Install;

    npm install nativefier -g

Download icons: `./apps/nativefier-icons`

Create apps;

    nativefier --name "Brain.fm" --icon ~/Downloads/brainfm.png --counter --overwrite "https://brain.fm" ~/Documents/Nativefier/Brain.fm/
    nativefier --name "Calendar" --icon ~/Downloads/calendar.png --counter --overwrite "https://calendar.google.com/" ~/Documents/Nativefier/Calendar/
    nativefier --name "Calendar (Work)" --icon ~/Downloads/calendar-work.png --counter --overwrite "https://calendar.google.com/" ~/Documents/Nativefier/Calendar-Work/
    nativefier --name "Trello" --icon ~/Downloads/trello.png --counter --overwrite "https://trello.com" ~/Documents/Nativefier/Trello/

Note: The output directory may need to be a full path rather than `~/`
