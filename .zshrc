# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# -----------------------------
# General
# -----------------------------
setopt auto_cd #cd省略
setopt no_beep #ピープ音を鳴らさないように変更
setopt auto_param_keys #括弧の対応を自動補完
setopt correct #コマンドスペルチェック
setopt correct_all #コマンドラインのスペルチェック
setopt complete_in_word # 単語の入力途中でもtab補完有効化
setopt correct # コマンドミスを修正
setopt auto_list # 補完候補を一覧表示にする
setopt auto_menu # TAB で順に補完候補を切り替える
setopt no_flow_control
autoload -Uz compinit && compinit # 自動補完
function chpwd() { ls } # 自動ls

# -----------------------------
# Color
# -----------------------------

autoload -Uz colors ; colors #色を使用
export LSCOLORS=Exfxcxdxbxegedabagacad #色の設定
export LS_COLORS='di=01;34:ln=01;35:so=01;32:ex=01;31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30' # 補完時の色設定
autoload -U colors ; colors ; zstyle ':completion:*' list-colors "${LS_COLORS}" # 補完候補に色つける

# -----------------------------
# History
# -----------------------------
HISTFILE=$HOME/.zsh-history # 履歴を保存するファイル
HISTSIZE=100000             # メモリ上に保存する履歴のサイズ
SAVEHIST=1000000            # 上述のファイルに保存する履歴のサイズ

# share .zshhistory
setopt inc_append_history   # 実行時に履歴をファイルにに追加していく
setopt share_history        # 履歴を他のシェルとリアルタイム共有する
setopt hist_ignore_all_dups #すでにhistoryにあるコマンドは残さない

# -----------------------------
# COMPLEMENT
# -----------------------------

autoload -Uz compinit && compinit

# 補完候補をそのまま探す -> 小文字を大文字に変えて探す -> 大文字を小文字に変えて探す
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' '+m:{[:upper:]}={[:lower:]}'

### 補完方法毎にグループ化する。
zstyle ':completion:*' format '%B%F{blue}%d%f%b'
zstyle ':completion:*' group-name ''


### 補完侯補をメニューから選択する。
### select=2: 補完候補を一覧から選択する。補完候補が2つ以上なければすぐに補完する。
zstyle ':completion:*:default' menu select=2

# -----------------------------
# Added by Zinit's installer
# -----------------------------

if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# -----------------------------
# End of Zinit's installer chunk
# -----------------------------

# -----------------------------
# PATH
# -----------------------------
SCRIPT_DIR=$HOME/dotfiles

source $SCRIPT_DIR/zsh/plugins.zsh
source $SCRIPT_DIR/zsh/config.zsh
source $SCRIPT_DIR/zsh/p10k.zsh
source $SCRIPT_DIR/zsh/peco.zsh
source $SCRIPT_DIR/zsh/cdr.zsh

PATH=$PATH:$HOME/bin:/usr/local/go/bin
