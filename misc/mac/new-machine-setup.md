New machine setup
=================

Also see;
 - [Apps](./apps.md).
 - [Fish setup](/sysadmin/fish/setup.md).



Settings
========

Finder
------

Open Finder and remove crud from Finders favourites list (especially 'All my files')

View hidden files in Finder;

    defaults write com.apple.finder AppleShowAllFiles YES

Hold 'alt' on your keyboard, then right click on the Finder icon in the dock and click Relaunch



SSH keys
========

Generate with this command;

    ssh-keygen -t rsa -C "turnbullm@gmail.com"

- Default location is good
- Enter a strong password
- id_rsa.pub = public key
- id_rsa = private key

Copy to clipboard:

    pbcopy < ~/.ssh/id_rsa.pub

Add to GitHub: https://github.com/settings/ssh



Directories
===========

    mkdir ~/Code
    sudo ln -s ~/Code /var/www
    mkdir ~/Code/personal
    mkdir ~/Code/play
    mkdir ~/Code/vendor
    mkdir ~/Code/{{company name}}



Brew
====

http://brew.sh/

    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

Run `brew doctor` to make sure everything was okay



Git
===

    brew install git
    brew install git-extras
    brew install git-flow-avh
    git config --global user.name "Matthew Turnbull"
    git config --global user.email "turnbullm@gmail.com"



Ruby
====

    brew install --HEAD ruby-build
    brew install --HEAD rbenv

    rbenv install --list

Install the latest and use as global default, eg;

    rbenv install 2.2.1
    rbenv rehash
    rbenv global 2.2.1



More
====

    # node & npm
    brew install node

    # python & pip
    brew install python

    # global npm
    npm install -g gulp
    npm install -g bower

    # global gems
    gem install bundler
    gem install compass

    # Composer
    curl -sS https://getcomposer.org/installer | php
    sudo mv composer.phar /usr/local/bin/composer



IE virtualization
=================

http://modern.ie/

Download the packages you want

Devices > Install Guest Additions

Take a snapshot in Virtualbox



LaunchBar
=========

- Under index, disable;
    - Snippets
    - iTunes Library
    - iPhoto Library
    - Safari stuff under Web
    - Dev resources (clutters search)
    - Tags (don't use em)

- Search for following under each group, and remove;
    - iTunes
    - Terminal

- Under emoji, go to options, and tick 'Available as sub search only'
    - This prevents emoji from clogging up results

- Under index, add;
    - Code
        - Search 1 sub folder level
        - Folders only
    - Home
        - No search scope, just to have 'home' as an entry
        - Make sure abbreviation is tilde

- Settings
    - Modifier taps: Both off
    - Instant Info Browsing = TICKED
    - No search in spotlight (just change global key for that in settings)
    - No snippets (text expander rules!)
    - Clipboard shortcuts;
      - All + C = Clipboard history
      - All + V = Paste and remove from history
      - Select from history = NOPE



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
