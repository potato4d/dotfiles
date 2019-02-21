source ~/.git-prompt.sh
source ~/.git-completion.sh
export PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '
export HISTFILESIZE=5000000
HISTSIZE=50000000

if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi
export PATH="/usr/local/sbin:$PATH"
export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"
