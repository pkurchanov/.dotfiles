bindkey -e
bindkey "^U" backward-kill-line

mkdir -p "$XDG_STATE_HOME/zsh"
HISTFILE="$XDG_STATE_HOME/zsh/history"
HISTSIZE=1000
SAVEHIST=1000

zstyle :compinstall filename "$HOME/.zshrc"
autoload -Uz compinit
mkdir -p "$XDG_CACHE_HOME/zsh"
compinit -d "$XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION"
source "$ZDOTDIR/minimal.zsh"

export GOPATH="$XDG_DATA_HOME/go"
export PATH="$GOPATH/bin:$PATH"
export MANPAGER="nvim +Man!"
export EDITOR="nvim"

alias ls="ls --color=auto"
alias l="ls -lhA"
alias wget="wget --hsts-file=$XDG_DATA_HOME/wget-hsts"

eval "$(zoxide init zsh --cmd=cd)"
alias fd="fd -E /mnt/c"
alias va="source ./.venv/bin/activate"
alias vi="nvim"

alias fnl="rlwrap fennel --repl"
alias astroterm="astroterm -a 56 -o 93 -cum"
alias rate-mirrors="rate-mirrors arch | sudo tee /etc/pacman.d/mirrorlist"

function pls {
	sudo $(fc -nl -1)
}

function mkcd {
	mkdir -p $1 && cd "$1"
}
