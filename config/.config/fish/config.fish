export GOPATH="$HOME/golang"
export PATH="$GOPATH/bin:$PATH"
export PATH="$HOME/.anyenv/bin:$PATH"
export NODE_PATH='$HOME/.anyenv/envs/nodenv/versions/10.14.1/lib/node_modules'
export PATH="$HOME/.anyenv/envs/nodenv/versions/10.14.1/bin:$PATH"
export HISTFILESIZE=5000000

function fish_user_key_bindings
  bind \cr peco_select_history # Bind for peco select history to Ctrl+R
end

function c
  set_color $argv
end

function hostprefix
  hostname | sed -e "s/\.local//g"
end

function fish_prompt
  set -l git_branch (git branch ^/dev/null | sed -n '/\* /s///p')
  echo -n (whoami)'@'(hostprefix)' '(c green)(prompt_pwd)(c normal)'('(c yellow)"$git_branch"(c normal)')> '
end

function g
  cd (ghq root)/(ghq list | peco)
end

function pc
  git checkout (git branch | peco | sed -e "s/ //g" | sed -e "s/\*//g")
end

# peco
function fish_user_key_bindings
  bind \cr peco_select_history # Bind for peco select history to Ctrl+R
  bind \cf peco_change_directory # Bind for peco change directory to Ctrl+F
end

eval (direnv hook fish)
