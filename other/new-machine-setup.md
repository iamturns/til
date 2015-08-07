New machine setup
=================

### Finder

- Preferences > Set new finder window shows home
- Remove crud from Finders favourites list (especially 'All my files')

#### View hidden files

```
defaults write com.apple.finder AppleShowAllFiles YES
```

Hold 'alt' on your keyboard, then right click on the Finder icon in the dock and click Relaunch

### Apps

- Google Chrome
- Xcode
- PhpStorm
- Virtualbox
- Vagrant
- Asepsis 
- Twitter
- Evernote
- SequalPro
- Sourcetree

#### Virtualbox images

http://modern.ie/

Download the packages you want

Devices > Install Guest Additions

Take a snapshot!

### Brew

http://brew.sh/

```
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

run `brew doctor` to make sure everything was okay

### Fish

A much better shell

```
brew install fish
```

Tell system about new shell:

```
echo "/usr/local/bin/fish" | sudo tee -a /etc/shells
```

Set as default shell:

```
chsh -s /usr/local/bin/fish
```

Fish config:

https://github.com/turnbullm/til/tree/master/sysadmin/fish

### SSH keys

- id_rsa.pub = public key
- id_rsa = private key

```
ssh-keygen -t rsa -C "turnbullm@gmail.com"
```

Default location is good

Enter a strong password

Hand out your public key

Copy to clipboard:

```
pbcopy < ~/.ssh/id_rsa.pub
```

Add to GitHub: https://github.com/settings/ssh

### Git

System usually comes with an old git

```
brew install git
```

Git config:

https://github.com/turnbullm/til/tree/master/dev/git/config

#### Gitflow

```
brew install git-flow
```

### www

```
mkdir ~/Code
sudo ln -s ~/Code /var/www
```

### Ruby

```
brew install --HEAD ruby-build
brew install --HEAD rbenv

rbenv install --list

rbenv install 2.2.1

rbenv rehash

rbenv local 2.2.1
```

### Bundler

```
gem install bundler
```

### Composer

```
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer
```

### Python & Pip

```
brew install python
```

### Node & NPM

```
brew install node
```

### Grunt

```
npm install -g grunt-cli
```

### Bower

```
npm install -g bower
```

### Gulp

```
npm install -g gulp
```

### NodeJS

https://nodejs.org/

### Compass

```
gem install compass
```
