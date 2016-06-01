Apps
====

Must have
---------

- Google Chrome
    - Pushbullet settings
        - General
            - Tick: Use dark icon
            - Untick: Open things I push to this browser automatically
        - Notifications
            - Untick: Show notifications on my computer
- LaunchBar
    - See setup in ['machine hello' document](./machine-hello.md)
- Google Drive
    - Remember to only selectively sync some directories
- Dropbox
- 1Password
    - Link to Dropbox
    - Preferences > Browsers
        - Disable: Automatically sign in after filling usernames and passwords
        - Enable: Allow filling on pages that closely match saved websites
- TextExpander
    - File in Google Drive (license is for TextExpander 5 only)
    - License stored in 1Password
    - Don't check for updates
    - Preferences
        - Sync
            - Link to Dropbox
        - Appearance
            - Untick: Show TextExpander in menu bar
            - Tick: Hide TextExpander icon in Dock
- iTerm - better terminal
    - http://iterm2colorschemes.com/
    - My fave: Solarized dark high contrast
    - Set system wide hotkey: All + \

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
    - Enable high quality streaming
    - Connect to last.fm
- Steam
    - Turn off automatic chat login
- Twitter
- VLC
- VOX - playing audio files

Dev
---

- Chrome Canary
- Dash - Offline docs
- DiffMerge
- Docker
- FileZilla
- Firefox - For testing
- GitUp
    - Not 100% sure on this
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
