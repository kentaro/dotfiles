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
rc () { cd $GHQ_ROOT/github.com/jonathandturner/rls_vscode && code . && cd - ; }

# VSCode
code () { VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $* ; }
