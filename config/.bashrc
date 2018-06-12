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

alias gcl='git clone'
alias ga='git add'
alias grm='git rm'
alias gap='git add -p'
alias gall='git add -A'
alias gf='git fetch --all --prune'
alias gft='git fetch --all --prune --tags'
alias gfv='git fetch --all --prune --verbose'
alias gftv='git fetch --all --prune --tags --verbose'
alias gus='git reset HEAD'
alias gpristine='git reset --hard && git clean -dfx'
alias gclean='git clean -fd'
alias gm="git merge"
alias gmv='git mv'
alias g='git'
alias get='git'
alias gst='git status'
alias gs='git status'
alias gss='git status -s'
alias gsu='git submodule update --init --recursive'
alias gl='git pull'
alias glum='git pull upstream master'
alias gpr='git pull --rebase'
alias gpp='git pull && git push'
alias gup='git fetch && git rebase'
alias gp='git push'
alias gpo='git push origin'
alias gpu='git push --set-upstream'
alias gpom='git push origin master'
alias gr='git remote'
alias grv='git remote -v'
alias gra='git remote add'
alias gd='git diff'
alias gdv='git diff -w "$@" | vim -R -'
alias gc='git commit -v'
alias gca='git commit -v -a'
alias gcm='git commit -v -m'
alias gcam="git commit -v -am"
alias gci='git commit --interactive'
alias gb='git branch'
alias gba='git branch -a'
alias gbt='git branch --track'
alias gbm='git branch -m'
alias gbd='git branch -d'
alias gbD='git branch -D'
alias gcount='git shortlog -sn'
alias gcp='git cherry-pick'
alias gco='git checkout'
alias gcom='git checkout master'
alias gcb='git checkout -b'
alias gcob='git checkout -b'
alias gct='git checkout --track'
alias gexport='git archive --format zip --output'
alias gdel='git branch -D'
alias gmu='git fetch origin -v; git fetch upstream -v; git merge upstream/master'
alias gll='git log --graph --pretty=oneline --abbrev-commit'
alias gg="git log --graph --pretty=format:'%C(bold)%h%Creset%C(magenta)%d%Creset %s %C(yellow)<%an> %C(cyan)(%cr)%Creset' --abbrev-commit --date=relative"
alias ggs="gg --stat"
alias gsl="git shortlog -sn"
alias gwc="git whatchanged"
alias gt="git tag"
alias gta="git tag -a"
alias gtd="git tag -d"
alias gtl="git tag -l"
# From http://blogs.atlassian.com/2014/10/advanced-git-aliases/
# Show commits since last pull
alias gnew="git log HEAD@{1}..HEAD@{0}"
# Add uncommitted and unstaged changes to the last commit
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

alias aws-console="open https://ap-northeast-1.console.aws.amazon.com/console/home?region=ap-northeast-1"
alias lambda="open https://ap-northeast-1.console.aws.amazon.com/lambda/home?region=ap-northeast-1"
alias term='open -a "/Applications/Utilities/Terminal.app/"'
alias branch='git checkout `git branch | peco | sed -e "s/\* //g" | awk "{print \$1}"`'
alias pdbranch='git branch -D `git branch | peco | sed -e "s/\* //g" | awk "{print \$1}"`'
alias kp="touch .gitkeep"
alias ls='ls --color=auto'
alias ll='ls -la --color=auto'
alias l='ls -a --color=auto'

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
