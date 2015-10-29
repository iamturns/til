set fish_greeting ""

###
# Path
###

# Composer global installs
set PATH $HOME/.composer/vendor/bin $PATH

# Homebrew
set PATH /usr/local/bin /usr/local/sbin $PATH

# Local scripts
set PATH $HOME/bin $PATH

set -x PATH $PATH

###
# Functions
###

function ll
  ls -lahH $argv
end

###
# rbenv
###

. (rbenv init -|psub)

###
# Git
###

set __fish_git_prompt_showstashstate 'yes'

function fish_prompt
  set_color 444444;
  printf '%s' (prompt_pwd)
  set_color normal

  __fish_git_prompt

  set_color 444444;
  echo -n ' > '
  set_color normal
end

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
