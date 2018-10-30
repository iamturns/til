# Machine hello

First step: download Xcode via App Store. It takes forever!

When complete, open and accept the T&Cs.

## Faster keyboard

```bash
# Repeat key when key is held down
defaults write -g ApplePressAndHoldEnabled -bool false

# Speeeeeeeeeeeeeeeeeeeed!
defaults write -g InitialKeyRepeat -int 10
defaults write -g KeyRepeat -int 2
```

Logout / login for settings to take effect

## Finder

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

### Hidden files

In terminal;

    defaults write com.apple.finder AppleShowAllFiles YES

Hold alt (⌥), right click Finder in dock, Relaunch

## Commands

```bash
### SSH key ###

ssh-keygen -t rsa -C "matt@iamturns.com - Machine ID"

# Default location is good
# Enter a strong password

# Copy public key to clipboard and save to GitHub, BitBucket, etc;
cat ~/.ssh/id_rsa.pub | pbcopy

### Directories ###

mkdir ~/Code
sudo ln -s ~/Code /var/www

# Enter password

mkdir /var/www/iamturns
mkdir /var/www/play
mkdir /var/www/vendor
mkdir /var/www/@@COMPANY_NAME@@

### Homebrew ###

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

### Git ###

brew install git
git config --global user.name "Matt Turnbull"
git config --global user.email "matt@iamturns.com"

### Node ###

brew install node

# Install NVM: https://github.com/creationix/nvm

nvm install node
nvm install --lts
nvm alias default 10.12.0
nvm use default

### Ruby ###

brew install ruby-build
brew install rbenv

# Init rbenv
# This is one time only, and will be automatically run within terminal setup later

eval "$(rbenv init -)"

# Install latest and use as global default

rbenv install --list
rbenv install 2.4.1
rbenv rehash
rbenv global 2.4.1

# Bundler

gem install bundler

### Python & pip ###

brew install python

### Misc ###

brew install imagemagick
```

## Git advanced

### Global .gitignore

```bash
git config --global core.excludesfile ~/.gitignore_global
vim ~/.gitignore_global
```

Contents:

```text
# https://raw.githubusercontent.com/github/gitignore/master/Global/macOS.gitignore

# General
.DS_Store
.AppleDouble
.LSOverride

# Icon must end with two \r
Icon


# Thumbnails
._*

# Files that might appear in the root of a volume
.DocumentRevisions-V100
.fseventsd
.Spotlight-V100
.TemporaryItems
.Trashes
.VolumeIcon.icns
.com.apple.timemachine.donotpresent

# Directories potentially created on remote AFP share
.AppleDB
.AppleDesktop
Network Trash Folder
Temporary Items
.apdisk
```

### Commit verification

https://help.github.com/articles/managing-commit-signature-verification/

## Terminal setup

Refer to my ['terminal-setup'](https://github.com/iamturns/terminal-setup) repo.

## Apps

See [`apps.md`](./apps.md).

## Dock

- Finder
- Chrome
- iTerm
- IDE
- Activity Monitor
  - With 'Show CPU history'
- Slack
- Franz
- Spotify

## IE virtualization

http://modern.ie/

Download the packages you want

Devices > Install Guest Additions

Take a snapshot in Virtualbox

## Hide .DS_Store from desktop

- Press Shift-Command-Control-4, and drag out a square over any area. Release the mouse when done, and the area is now on your clipboard.
- Open Preview and press Command-N to open a window with your capture.
- Press Command-A to select all, then press Delete.
- Press Command-C to copy this empty grey square to clipboard.
- Select ".DS_Store" and Command-I to get info.
- Select the icon in the top-left and Command-V to replace with transparency from clipboard.
