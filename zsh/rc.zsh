# zmodload zsh/zprof

if [ -d "/opt/homebrew/" ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
else
  eval "$(/usr/local/bin/brew shellenv)"
  HOMEBREW_PREFIX="/usr/local/"
fi

eval "$(starship init zsh)"

setopt nobeep autocd

# autosuggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '^ ' autosuggest-accept

# tab completion
autoload -Uz compinit && compinit
bindkey '^[[Z' reverse-menu-complete
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' list-suffixes
zstyle ':completion:*' expand prefix suffix
zstyle ':completion*' menu select
zstyle ':completion*' list-colours "${(s.:.)LS_COLORS}"

# latex
export PATH="/usr/local/texlive/2023basic/bin/universal-darwin:$PATH"

# other
try_source () {
    if test -r "$1"; then
        source "$1"
    else
        echo "Could not source file $1, does not exist"
    fi
}
try_source_quiet () {
    if test -r "$1"; then
        source "$1"
    fi
}

try_source $HOME/.env.sh
try_source $DOTFILES/zsh/aliases.zsh
# try_source $DOTFILES/zsh/lazy.zsh
try_source $DOTFILES/zsh/not-lazy.zsh
try_source_quiet $HOME/.tokens.sh
try_source_quiet $DOTFILES/zsh/nvim-selector.zsh

# zprof
export MODULAR_HOME="/Users/khalid/.modular"
export PATH="/Users/khalid/.modular/pkg/packages.modular.com_mojo/bin:$PATH"
