export GOPATH="$HOME/golang"
export PATH="/usr/local/opt/nodenv/bin:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.nodenv/bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"

# 誤字マン
alias gti="git"

# 遷移マン
alias c="cd ~/Desktop/Clients/"
alias d="cd ~/Desktop"
alias h="cd ~/"

# Webページひたすら開くマン
alias t="open https://twitter.com"
alias aws-console="open https://ap-northeast-1.console.aws.amazon.com/console/home?region=ap-northeast-1"

eval "$(nodenv init -)"
eval "$(rbenv init -)"

echo "甘えるな"
