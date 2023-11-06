#!/bin/bash
# 配置したい設定ファイル
dotfiles=(.zshrc)

# .zshrc と .tmux.conf という設定ファイルのシンボリックリンクを
# ホームディレクトリ直下に作成する
for file in "${dotfiles[@]}"; do
        ln -svf $HOME/dotfiles/$file ~/
done

#!/bin/bash
# 配置したい設定ファイル
zsh=(.tmux.conf .p10k.zsh)

# .zshrc と .tmux.conf という設定ファイルのシンボリックリンクを
# ホームディレクトリ直下に作成する
for zshFile in "${zsh[@]}"; do
        ln -svf $HOME/dotfiles/zsh/$zshFile ~/
done
