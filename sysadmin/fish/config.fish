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
