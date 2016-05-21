Fish setup
==========

A much better shell

    brew install fish

Tell system about new shell:

    echo "/usr/local/bin/fish" | sudo tee -a /etc/shells

Set as default shell:

    chsh -s /usr/local/bin/fish

Place `./config` (within this repo) into `~/.config/fish/` (on machine);
Next steps;

- iTerm2-color-schemes github
- Solarized dark high contrast
- Install oh my fish
- Install bobthefish theme
- sudo pip install thefuck
- omf install tab
- npm install -g tldr
