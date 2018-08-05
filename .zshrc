# Created by newuser for 5.3.1
autoload -U compinit
compinit

export LSCOLORS=cxfxcxdxbxegedabagacad
alias ls="ls -G"

zstyle ':completion:*' list-colors 'di=32'

# vcs_infoロード
autoload -Uz vcs_info
# PROMPT変数内で変数参照する
setopt prompt_subst
# avoid no matches found error
setopt nonomatch

# vcsの表示
zstyle ':vcs_info:*' formats '[%F{green}%b%f]'
zstyle ':vcs_info:*' actionformats '[%F{green}%b%f(%F{red}%a%f)]'
# プロンプト表示直前にvcs_info呼び出し
precmd() { vcs_info }
# プロンプト表示
PROMPT='%F{green}$%f '
# PROMPT='%F{green}%~%f${vcs_info_msg_0_}%F{green}$%f '

# ls
alias la="ls -a"
alias lf="ls -F"
alias ll="ls -l"

# git
alias g='git'
alias gs='git status -s -b'
alias gl='git log'
alias gc='git commit'
alias ga='git add'
alias gd='git diff'

# bundler
alias be='bundle exec'

# docker
alias dk='docker'
alias dc='docker-compose'

# vim
alias vf='vim +VimFiler'
