set fish_greeting ""

function ll
  ls -lahH $argv
end

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
