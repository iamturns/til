Machine hello
=============

First step: download Xcode via App Store. It takes forever!

When complete, open and accept the T&Cs. 



Faster keyboard
===============

```bash
# Repeat key when key is held down
defaults write -g ApplePressAndHoldEnabled -bool false

# Speeeeeeeeeeeeeeeeeeeed!
defaults write -g InitialKeyRepeat -int 10
defaults write -g KeyRepeat -int 2
```

Logout / login for settings to take effect



Finder
======

- Open Finder
- View
    - Customize toolbar
        - Add in 'Path'
- Preferences
    - General
        - New Finder window shows: 
    - Sidebar
        - Remove crud, including;
            - All my files
            - iCloud Drive
            - Tags
    - Advanced
        - Tick 'Show all filename extensions'

Hidden files
------------

In terminal;

    defaults write com.apple.finder AppleShowAllFiles YES

Hold alt (⌥), right click Finder in dock, Relaunch



Commands
========

```bash
### SSH key ###

ssh-keygen -t rsa -C "machine_identifier_matthew_turnbull_turnbullm@gmail.com"

# Default location is good
# Enter a strong password

# Copy public key to clipboard and save to GitHub, BitBucket, etc;
cat ~/.ssh/id_rsa.pub | pbcopy

### Directories ###

mkdir ~/Code
sudo ln -s ~/Code /var/www

# Enter password

mkdir /var/www/personal
mkdir /var/www/play
mkdir /var/www/vendor
mkdir /var/www/@@COMPANY_NAME@@

### Homebrew ###

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

### Git ###

brew install git
git config --global user.name "Matthew Turnbull"
git config --global user.email "turnbullm@gmail.com"

### Node & npm ###

brew install node

### Ruby ###

brew install --HEAD ruby-build
brew install --HEAD rbenv

# Init rbenv
# This is one time only, and will be automatically run within terminal setup later

eval "$(rbenv init -)"

# Install latest and use as global default

rbenv install --list
rbenv install 2.2.1
rbenv rehash
rbenv global 2.2.1

# Bundler

gem install bundler

### Python & pip ###

brew install python

### Misc ###

brew install imagemagick
```



Terminal setup
==============

Refer to my ['ily-terminal'](https://github.com/turnbullm/ily-terminal) repo.



Apps
====

See [`apps.md`](./apps.md).



Dock
====

- Finder
- Chrome
- Calendar
- iTerm
- IDE
- TimeDoser
- Workflowy
- Activity Monitor
    - With 'Show CPU history'
- Slack
- Franz



IE virtualization
=================

http://modern.ie/

Download the packages you want

Devices > Install Guest Additions

Take a snapshot in Virtualbox



Hide .DS_Store from desktop
===========================

- Press Shift-Command-Control-4, and drag out a square over any area. Release the mouse when done, and the area is now on your clipboard.
- Open Preview and press Command-N to open a window with your capture.
- Press Command-A to select all, then press Delete.
- Press Command-C to copy this empty grey square to clipboard.
- Select ".DS_Store" and Command-I to get info.
- Select the icon in the top-left and Command-V to replace with transparency from clipboard.
