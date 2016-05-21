# Path to Oh My Fish install.
set -gx OMF_PATH /Users/matt.turnbull/.local/share/omf

# Customize Oh My Fish configuration path.
#set -gx OMF_CONFIG /Users/matt.turnbull/.config/omf

# Load oh-my-fish configuration.
source $OMF_PATH/init.fish

##########
# CUSTOM #
##########

###
# Theme
###

set -g theme_display_ruby no

###
# Path
###

# Local scripts
set PATH $HOME/bin $PATH

# Homebrew
set PATH /usr/local/bin /usr/local/sbin $PATH

# rbenv
set PATH $HOME/.rbenv/bin $PATH

# Go
set PATH /usr/local/opt/go/libexec/bin $PATH

# Composer PHP
set PATH $HOME/.composer/vendor/bin $PATH

# Android SDK
set PATH $HOME/Documents/android-sdk-macosx/platform-tools $PATH
set PATH $HOME/Documents/android-sdk-macosx/tools $PATH

set -x PATH $PATH

###
# rbenv
###

. (rbenv init -|psub)

###
# Fuck
###

function fuck -d 'Correct your previous console command'
    set -l exit_code $status
    set -l eval_script (mktemp 2>/dev/null ; or mktemp -t 'thefuck')
    set -l fucked_up_command $history[1]
    thefuck $fucked_up_command > $eval_script
    . $eval_script
    rm $eval_script
    if test $exit_code -ne 0
        history --delete $fucked_up_command
    end
end
