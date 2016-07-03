Apps
====

Must have
---------

- Google Chrome
    - Pushbullet settings
        - General
            - Tick: Use dark iconi
            - Untick: Open things I push to this browser automatically
        - Notifications
            - Untick: Show notifications on my computer
    - Magic Actions settings
        - Disable: Instant control over volume
    - Spreed
        - Tick: Disable Spreed button on all sites
- Dropbox
- LaunchBar
    - When you see 'Conflicting Keyboard Shortcuts';
        - Open Spotlight Preferences
        - Keyboard shortcuts
        - Show Spotlight search
        - Assign to 'All + Space'
    - Users & Groups > Login Items > Add LaunchBar (and tick 'Hide')
    - Preferences
        - Shortcuts
            - Untick all except 'Search in Launchbar'
        - Actions > Options
            - Preferred Terminal application: iTerm
        - Clipboard
            - Untick all keyboard shortcuts
            - Except 'Paste and remove from history'
                - Set to All + V
        - Advanced
            - Untick 'Show Dock Icon'
    - Index
        - Disable;
            - Snippets (use TextExpander)
            - iTunes Library
            - iPhoto Library
            - Safari stuff under Web
        - Emoji > Options > Access items via sub-search only > Enable
        - Google Chrome Bookmarks > Options > Access items via sub-search only > Enable
        - Google Chrome History > Options > Access items via sub-search only > Enable
        - Search for following, then click into each group and disable;
            - iTunes
            - Terminal
        - New > Add folder > Dropbox > Launchbar Bookmarks
        - New > Add folder > ~/Code
            - Options;
                - Search scope: 1 sub folder level
                - Search for: Folders
        - Search Templates (UTF-8) > New > Google Calendar;
            - http://www.google.com/calendar/event?ctext=*&action=TEMPLATE&pprop=HowCreated%3AQUICKA
- Google Drive
    - Remember to only selectively sync some directories
- 1Password
    - Click 'Already have 1Password data somewhere else?'
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

System
------

- Android File Transfer - for getting files from android phone
- AppCleaner - uninstalling apps
- Asepsis - access NTFS drives
- Boxcryptor - access encrypted files stored on cloud
- Caffeine - shortcut to keep mac on (good for presentations etc)
    - Tick: Automatically start Caffeine at login
    - Untick: Show this message when starting Caffeine
- Disk Inventory X - find what it using hard drive space
- Flux - Go easy on the eyes
- Keka - archive files (zip, etc)
    - Click: Set Keka as default compressor / uncompressor
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
    - Disable launch on startup (under advanced settings)
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
- Visual Studio Code
    - `ext install EditorConfig`
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

    mkdir ~/Documents/Nativefier/
    cd ~/Documents/Nativefier/

    nativefier --name "Inbox" --icon ~/Downloads/nativefier-icons/email.png --counter "https://inbox.google.com/"
    nativefier --name "Inbox (Work)" --icon ~/Downloads/nativefier-icons/email-work.png --counter "https://inbox.google.com/"
    nativefier --name "Google Calendar" --icon ~/Downloads/nativefier-icons/calendar.png --counter "https://calendar.google.com/"
    nativefier --name "Google Calendar (Work)" --icon ~/Downloads/nativefier-icons/calendar-work.png --counter "https://calendar.google.com/"

    nativefier --name "Trello" --icon ~/Downloads/nativefier-icons/trello.png --counter "https://trello.com" ~/Documents/Nativefier/Trello/
    nativefier --name "Brain.fm" --icon ~/Downloads/nativefier-icons/brainfm.png --counter "https://brain.fm" ~/Documents/Nativefier/Brain.fm/

    open .
    open /Applications/

### Calendar settings

  - General
      - Notifications
          - Use browser notifications instead of interruptive alerts
          - Disable: Play sound
      - Week starts on
          - Monday
  - Notifications
      - Events
          - Notification | 10 | minutes
          - Email        | 1 | days
          - Email        | 3 | days
          - Email        | 1 | weeks
      - All day events
          - Notification | 0 | days  | 9:00am
          - Email        | 1 | days  | 9:00am
          - Email        | 3 | days  | 9:00am
          - Email        | 1 | weeks | 9:00am
