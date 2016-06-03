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



First apps
==========

- Google Chrome
- iTerm



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

#
# Brew
#

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

#
# Git
#

brew install git
git config --global user.name "Matthew Turnbull"
git config --global user.email "turnbullm@gmail.com"

#
# Node & npm
#

brew install node

# global modules

npm install -g gulp
npm install -g bower

#
# Ruby
#

brew install --HEAD ruby-build
brew install --HEAD rbenv

# install latest and use as global default

rbenv install --list
rbenv install 2.2.1
rbenv rehash
rbenv global 2.2.1

# global gems

gem install bundler
gem install compass

#
# Python & pip
#

brew install python

#
# Composer
#

php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('SHA384', 'composer-setup.php') === '070854512ef404f16bac87071a6db9fd9721da1684cd4589b1196c3faf71b9a2682e2311b36a5079825e155ac7ce150d') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"
```



Terminal setup
==============

Refer to my ['turns-terminal'](https://github.com/turnbullm/turns-terminal) repo.



IE virtualization
=================

http://modern.ie/

Download the packages you want

Devices > Install Guest Additions

Take a snapshot in Virtualbox



Dock
====

- Finder
- Chrome
- Calendar
- iTerm
- IDE
- TimeDoser
- Franz
- Activity Monitor
    - With 'Show CPU history'



Hide .DS_Store from desktop
===========================

- Press Shift-Command-Control-4, and drag out a square over any area. Release the mouse when done, and the area is now on your clipboard.
- Open Preview and press Command-N to open a window with your capture.
- Press Command-A to select all, then press Delete.
- Press Command-C to copy this empty grey square to clipboard.
- Select ".DS_Store" and Command-I to get info.
- Select the icon in the top-left and Command-V to replace with transparency from clipboard.



LaunchBar config
================

When you see 'Conflicting Keyboard Shortcuts';
    - Open Spotlight Preferences
    - Keyboard shortcuts
    - Show Spotlight search
    - Assign to 'All + Space' 

Preferences
-----------

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

Index
-----

- Disable;
    - Snippets
    - iTunes Library
    - iPhoto Library
    - Safari stuff under Web
- Search for following, then click into each group and disable;
    - iTunes
    - Terminal
- Under emoji, go to options, and tick 'Available as sub search only'
    - This prevents emoji from clogging up results
- New > Add folder > ~/Code
    - Options;
        - Search scope: 1 sub folder level
        - Search for: Folders


JetBrains config
================

- Editor > General > Appearance
    - Enable 'Show whitespaces'
