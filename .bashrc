export PATH=$HOME/bin:$PATH

# Git
eval "$(hub alias -s)"

# Go
export GOPATH=$HOME
export GHQ_ROOT=$GOPATH/src

# Ruby
export PATH=$HOME/.rbenv/bin:$PATH
eval "$(rbenv init -)"

# Rust
source $HOME/.cargo/env
