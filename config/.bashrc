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

HISTSIDE=5000000

alias gti="git"
alias h="cat ~/.bash_history | peco | eval"
alias bh="cat ~/.bash_history"
alias c="cd ~/Desktop/Clients/"
alias d="cd ~/Desktop"
alias s="source ~/.bashrc"
alias e="micro \$(git ls-files | peco)"
alias t="open https://twitter.com"
alias aws-console="open https://ap-northeast-1.console.aws.amazon.com/console/home?region=ap-northeast-1"
alias s3="open https://console.aws.amazon.com/s3/home?region=ap-northeast-1"
alias lambda="open https://ap-northeast-1.console.aws.amazon.com/lambda/home?region=ap-northeast-1"
alias term='open -a "/Applications/Utilities/Terminal.app/"'
alias pcheckout='git checkout `git branch | peco | sed -e "s/\* //g" | awk "{print \$1}"`'
alias pdbranch='git branch -D `git branch | peco | sed -e "s/\* //g" | awk "{print \$1}"`'

alias ls='ls --color=auto'
alias ll='ls -la --color=auto'
alias l='ls -a --color=auto'

function ggdb(){
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

function his(){
  eval $(bh | grep $1 | peco)
}

function jurl(){
  curl -v -H "Accept: application/json" -H "Content-type: application/json" -X POST -d $1 $2
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

if hash dircolors 2>/dev/null; then
  eval `dircolors ~/.dircolors-solarized/dircolors.256dark`
fi
