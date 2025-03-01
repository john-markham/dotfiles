### SETTINGS ### 
set -o vi
autoload -Uz compinit && compinit # allow git autocompletion
alias de='cd ~/Desktop'
alias gql='cd ~/Desktop/graphql-monolith'
alias grouter='cd ~/Desktop/graphql-router'
### git Command Line Prompt ### 
autoload -Uz vcs_info
precmd () { vcs_info }
zstyle ':vcs_info:git:*' formats '%b'
### Command Line Prompt/Color Formatting ### 
setopt PROMPT_SUBST
export CLICOLOR=1
PS1='%F{yellow}[$(basename $(dirname "$PWD"))/$(basename "$PWD")]%F{magenta}%B[${vcs_info_msg_0_}]%b %F{green}$ %F{reset}'
### ALIASES ### 
# Note to self: if you alias over a built-in command, you can always invoke it with
# \CMD. This will bypass any aliases
alias l='ls'
alias gl='git log'
alias gm='git commit -m'
alias cb='cd ~/Desktop/coinbase'
alias mt='make test'
alias gob='go build'
alias rates='de && cd rates'
alias ys='yarn start'
alias mt='make test'
alias grm='git rebase master'
alias gc='git checkout'
alias repo='de && cd repo'
alias ers='de && cd exchange-rates-sidecar'
alias gti='git'
alias gl='git log'
alias candles='de && cd exchange-repo/repo/pro/candles'
alias gcm='git checkout master'
alias gpf='git push --force'
alias grc='git rebase --continue'
alias ams='cd ~/Desktop/asset-metadata-service'
alias ads='cd ~/Desktop/asset-data-sidecar'
alias ass='cd ~/Desktop/asset-stats-service'
alias branch='git branch'
alias gtop="cd $(git rev-parse --show-toplevel)"
alias gs="git status"
alias gp="git push"
alias gpu="git pull origin master"
alias gaaa="git add . && git commit --amend --no-edit"
alias clena='clean'
alias nv='nvim'
alias rc='vim $HOME/.zshrc && source $_'
alias sane='stty sane'
alias v='nvim'
alias vrc='nv ~/.vimrc'
export HOMEBREW_NO_AUTO_UPDATE="1"
### FUNCTIONS ###
SHEBANG="#!/usr/bin/env bash"
addcusage() {
    echo "Usage: ${FUNCNAME[0]} -c command_name -d command_desc"
}
# Updates editor information when the keymap changes.
function zle-keymap-select() {
  # update keymap variable for the prompt
  VI_KEYMAP=$KEYMAP
  zle reset-prompt
  zle -R
}
zle -N zle-keymap-select
function vi-accept-line() {
  VI_KEYMAP=main
  zle accept-line
}
zle -N vi-accept-line
bindkey -v
bindkey -M viins 'jk' vi-cmd-mode
bindkey -M viins 'Jk' vi-cmd-mode
# use custom accept-line widget to update $VI_KEYMAP
bindkey -M vicmd '^J' vi-accept-line
bindkey -M vicmd '^M' vi-accept-line
# allow v to edit the command line (standard behaviour)
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd 'v' edit-command-line
# allow ctrl-p, ctrl-n for navigate history (standard behaviour)
bindkey '^P' up-history
bindkey '^N' down-history
# allow ctrl-h, ctrl-w, ctrl-? for char and word deletion (standard behaviour)
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
# allow ctrl-r and ctrl-s to search the history
bindkey '^r' history-incremental-search-backward
bindkey '^s' history-incremental-search-forward
# allow ctrl-a and ctrl-e to move to beginning/end of line
bindkey '^a' beginning-of-line
bindkey '^e' end-of-line
# if mode indicator wasn't setup by theme, define default
if [[ "$MODE_INDICATOR" == "" ]]; then
  MODE_INDICATOR="%{$fg_bold[red]%}<%{$fg[red]%}<<%{$reset_color%}"
fi
### FZF ###
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PATH="/opt/overrides/bin:$PATH"
export PATH="/usr/local/opt/ruby/bin:$PATH"
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
export GOPROXY=https://gomodules.cbhq.net/
export GONOSUMDB=github.cbhq.net
export GEM_HOME="$HOME/.gem"
export PATH="$GEM_HOME/bin:$PATH"
function dstop() {
    docker stop $(docker ps -a -q)
    docker rm $(docker ps -a -q)
}
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
# Homebrew
export GOROOT="/usr/local/go"
# Manual install
# export GOROOT=/usr/local/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin
export GO_PATH=~/go
export PATH=$PATH:/$GO_PATH/bin
export PATH="$PATH:$HOME/.local/bin"
# rbenv
# export RUBY_CFLAGS="-Wno-error=implicit-function-declaration"
# export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1) --with-readline-dir=$(brew --prefix readline) --with-libyaml-dir=$(brew --prefix libyaml) --with-zlib-dir=$(brew --prefix zlib)"
# 
# export PATH="/opt/homebrew/opt/openssl@1.1/bin:$PATH"
# export LDFLAGS="-L/opt/homebrew/opt/openssl@1.1/lib"
# export CPPFLAGS="-I/opt/homebrew/opt/openssl@1.1/include"
# export PKG_CONFIG_PATH="/opt/homebrew/opt/openssl@1.1/lib/pkgconfig"
# export PATH="/usr/local/sbin:$PATH"
#
SYSTEM_VERSION_COMPAT=1
alias gtc='go clean -testcache'
export PATH=/opt/homebrew/bin:$PATH
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export DOCKER_DEFAULT_PLATFORM=linux/amd64


eval "$(direnv hook zsh)"

export PATH="/opt/homebrew/opt/zip/bin:$PATH"
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$PATH

export PATH=${GOROOT}/bin:$PATH

alias gmt='go mod tidy'
