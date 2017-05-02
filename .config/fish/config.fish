# Fish
# http://futurismo.biz/archives/6087

# 環境変数読み込み
. ~/.config/fish/env.fish

# Ruby
rbenv init - | source

# Git
hub alias -s fish

# Ensure fisherman and plugins are installed
if not test -f $HOME/.config/fish/functions/fisher.fish
  echo "==> Fisherman not found.  Installing."
  curl -sLo ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisher
  fisher
end

function fish_user_key_bindings
  # ghqを選択
  bind \cs peco_select_ghq_repository
  # コマンド履歴を見る
  bind \cr peco_select_history
end
