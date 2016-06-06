Machine hello
=============



First
=====

Download Xcode via App Store. It takes forever!



Finder
======

- Open Finder
- View
    - Customize toolbar
        - Add in 'Path'
- Preferences
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

### Directories ###

mkdir ~/Code
sudo ln -s ~/Code /var/www
mkdir ~/Code/personal
mkdir ~/Code/play
mkdir ~/Code/vendor
mkdir ~/Code/{{company name}}

### Brew ###

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

# Install latest and use as global default

rbenv install --list
rbenv install 2.2.1
rbenv rehash
rbenv global 2.2.1

# Bundler

gem install bundler

### Python & pip ###

brew install python
```



Terminal setup
==============

Refer to my ['turns-terminal'](https://github.com/turnbullm/turns-terminal) repo.



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
