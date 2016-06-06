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
- Firefox
    - Sign in for bookmarks
    - Within Bookmarks, delete everything except for 'Bookmarks Toolbar > LaunchBar Index'
- LaunchBar
    - See setup in ['machine hello' document](./machine-hello.md)
    - When you see 'Conflicting Keyboard Shortcuts';
        - Open Spotlight Preferences
        - Keyboard shortcuts
        - Show Spotlight search
        - Assign to 'All + Space'
    - Users & Groups > Login Items > Add LaunchBar
    - Preferences
        - Shortcuts
            - Untick all except 'Search in Launchbar'
        - Actions
            - Preferred Terminal application: iTerm
        - Clipboard
            - Untick all keyboard shortcuts
            - Except 'Paste and remove from history'
                - Set to All + V
        - Advanced
            - Untick 'Show Dock Icon'
    - Index
        - Disable;
            - Snippets
            - iTunes Library
            - iPhoto Library
            - Safari stuff under Web
        - Google Chrome Bookmarks > Options > Access items via sub-search only > Enable
        - Google Chrome History > Options > Access items via sub-search only > Enable
        - Search for following, then click into each group and disable;
            - iTunes
            - Terminal
        - Under emoji, go to options, and tick 'Available as sub search only'
            - This prevents emoji from clogging up results
        - New > Add folder > ~/Code
            - Options;
                - Search scope: 1 sub folder level
                - Search for: Folders
        - New > Web Bookmarks > Firefox
            - Untick annoying directories (Bookmarks Menu, Bookmarks Toolbar, Unsorted Bookmarks)
            - Options > Enable 'Allow searching for hostname'
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
    - Shortcut for 'Quick Note': All + E
- TickTick
- Workflowy

Fun
---

- Franz - chat (slack, hangouts, facebook messenger, etc)
- Skype
- Spotify
    - Enable high quality streaming
    - Connect to last.fm
    - Disable launch on startup
- Steam
    - Turn off automatic chat login
- Twitter
- VLC
- VOX - playing audio files

Dev
---

- Chrome Canary
- Dash - Offline docs
    - Disable launch on startup
- DiffMerge
- Docker
- FileZilla
- Firefox - For testing
- GitUp
    - Not 100% sure on this
- JetBrains
    - Editor > General > Appearance
        - Enable 'Show whitespaces'
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
