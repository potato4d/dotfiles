export GOPATH="$HOME/golang"
export PATH="$GOPATH/bin:$PATH"
export EDITOR="micro"
export PATH="$HOME/.ghq/github.com/potato4d/degrade/dist:$PATH"
export GHQ_ROOT="$HOME/.ghq"
function fish_user_key_bindings
  bind \cr peco_select_history # Bind for peco select history to Ctrl+R
end

function fish_prompt
  set -l git_branch (git branch ^/dev/null | sed -n '/\* /s///p')
#  echo -n (whoami)'@'(hostprefix)' '(c green)(prompt_pwd)(c normal)'('(c yellow)"$git_branch"(c normal)')> '
  echo -n 'potato4d@'(hostprefix)' '(c green)(prompt_pwd)(c normal)'('(c yellow)"$git_branch"(c normal)')> '
end

function c
  set_color $argv
end

function hostprefix
  hostname | sed -e "s/\.local//g"
end

function g
  cd (ghq root)/(ghq list | peco)
end

function pc
  git checkout (git branch | peco | sed -e "s/ //g" | sed -e "s/\*//g")
end

function fish_user_key_bindings
  bind \cr peco_select_history # Bind for peco select history to Ctrl+R
  bind \cf peco_change_directory # Bind for peco change directory to Ctrl+F
end

eval (direnv hook fish)
anyenv init - | source
export PATH="$HOME/.anyenv/envs/nodenv/versions/12.12.0/bin/:$PATH"
# set -g fish_user_paths "/usr/local/opt/php@7.2/bin" $fish_user_paths
# set -g fish_user_paths "/usr/local/opt/php@7.2/sbin" $fish_user_paths
