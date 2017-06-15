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
alias p="cd ~/Desktop/Clients/pixiv.net"
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
alias ll='ls -la'
alias l='ls -a'

function ggdb(){
  git branch -D $(git branch | grep $1)
}

function his(){
  eval $(bh | grep $1 | peco)
}

function jurl(){
  curl -v -H "Accept: application/json" -H "Content-type: application/json" -X POST -d $1 $2
}

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

eval "$(rbenv init -)"
eval "$(phpenv init -)"
eval "$(pyenv init -)"