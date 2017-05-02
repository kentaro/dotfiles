set -x LANG ja_JP.UTF-8
set -x EDITOR vim

# Ruby
set fish_user_paths $HOME/.rbenv/shims $fish_user_paths

# Go
set -x GOPATH $HOME
set -x GHQ_ROOT $GOPATH/src

# Rust
set fish_user_paths $HOME/.cargo/bin $fish_user_paths

# commands
set fish_user_paths $HOME/bin $fish_user_paths
