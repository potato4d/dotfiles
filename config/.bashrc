export GOPATH="$HOME/golang"
export PATH="/usr/local/opt/nodenv/bin:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.nodenv/bin:$PATH"
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$GOPATH/bin:$PATH"

# 誤字マン
alias gti="git"

# 遷移マン
alias c="cd ~/Desktop/Clients/"
alias d="cd ~/Desktop"
alias h="cd ~/"

# Webページひたすら開くマン
alias t="open https://twitter.com"
alias aws-console="open https://ap-northeast-1.console.aws.amazon.com/console/home?region=ap-northeast-1"
alias s3="open https://console.aws.amazon.com/s3/home?region=ap-northeast-1"
alias lambda="open https://ap-northeast-1.console.aws.amazon.com/lambda/home?region=ap-northeast-1"

alias term='open -a "/Applications/Utilities/Terminal.app/"'

eval "$(nodenv init -)"
eval "$(rbenv init -)"

echo "甘えるな"
