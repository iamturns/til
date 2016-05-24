Fish setup
==========

A much better shell

    brew install fish

Tell system about new shell:

    echo "/usr/local/bin/fish" | sudo tee -a /etc/shells

Set as default shell:

    chsh -s /usr/local/bin/fish

Place `./config` (within this repo) into `~/.config/fish/` (on machine)

Fun shell stuff;

    brew install git-extras
    brew install git-flow-avh
    sudo pip install thefuck
    npm install -g tldr

    # Fisherman
    brew tap fisherman/tap
    brew install fisherman

    fisher bobthefish
    fisher tab

Desk
----

Install;

    brew install desk
    desk init
    cp /usr/local/share/fish/vendor_completions.d/desk.fish ~/.config/fish/completions

New desk (and edit);

    desk edit {{name}}

File contents example;

    # Description: Example description here

    example command to run on 'desk go' 1
    example command to run on 'desk go' 2

    # Example description of function here
    function say_hello
        echo Hello $argv
    end

And play with it;

    desk ls
    desk go {{name}}
    desk
    say_hello test
