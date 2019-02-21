if [ -f ~/.bash_extends ]; then
  . ~/.bash_extends
fi

LC_COLLATE="en_US.UTF-8"
LC_CTYPE="en_US.UTF-8"
LC_MESSAGES="en_US.UTF-8"
LC_MONETARY="en_US.UTF-8"
LC_NUMERIC="en_US.UTF-8"
LC_TIME="en_US.UTF-8"
LC_ALL="en_US.UTF-8"

HISTSIZE=5000000

# Git

alias pc='git checkout $(git branch | peco)'
alias gnew="git log HEAD@{1}..HEAD@{0}"
alias gcaa="git commit -a --amend -C HEAD"
alias ggui="git gui"
alias gcsam="git commit -S -am"
alias gstd="git stash drop"
alias gstl="git stash list"
alias gh='cd "$(git rev-parse --show-toplevel)"'


alias ssh="ssh -A"
alias gti="git"
alias h="cat ~/.bash_history | peco | eval"
alias bh="cat ~/.bash_history"
alias c="cd ~/Desktop/Clients/"
alias d="cd ~/Desktop"
alias s="source ~/.bashrc"
alias e="micro \$(git ls-files | peco)"
alias t="open https://twitter.com"

alias g='cd $(ghq root)/$(ghq list | peco)'
alias gh='hub browse $(ghq list | peco | cut -d "/" -f 2,3)'

alias kp="touch .gitkeep"
alias ls='ls -lha'
# alias ll='ls -la -G'
# alias l='ls -a -G'

alias docker_clean='docker image prune;docker container prune;docker volume prune'

function md5 () {
  php -r "echo md5(\"$1\");";
  echo '';
}

function cappy () {
  cat $1 | pbcopy
}

function p(){
  c
  cd potato4d
  cd $1
}

function delbranch(){
  git branch -D $(git branch | grep $1)
}

function devtomaster(){
  git reset --hard
  git checkout master
  git pull
  git checkout develop
  git rebase master
  git push
}

function padd(){
  git add $(git status | grep "modified" | sed "s/modified://" | peco)
}

export HISTCONTROL="ignoredups"
peco-history() {
    local NUM=$(history | wc -l)
    local FIRST=$((-1*(NUM-1)))

    if [ $FIRST -eq 0 ] ; then
        history -d $((HISTCMD-1))
        echo "No history" >&2
        return
    fi

    local CMD=$(fc -l $FIRST | sort -k 2 -k 1nr | uniq -f 1 | sort -nr | sed -E 's/^[0-9]+[[:blank:]]+//' | peco | head -n 1)

    if [ -n "$CMD" ] ; then
        history -s $CMD

        if type osascript > /dev/null 2>&1 ; then
            (osascript -e 'tell application "System Events" to keystroke (ASCII character 30)' &)
        fi
    else
        history -d $((HISTCMD-1))
    fi
}
bind -x '"\C-r":peco-history'

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

if hash rbenv 2>/dev/null; then
  eval "$(rbenv init -)"
fi

if hash phpenv 2>/dev/null; then
  eval "$(phpenv init -)"
fi

if hash pyenv 2>/dev/null; then
  eval "$(pyenv init -)"
fi

#if hash dircolors 2>/dev/null; then
#  eval `dircolors ~/.dircolors-solarized/dircolors.256dark`
#fi

eval "$(direnv hook bash)"
