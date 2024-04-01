eval "$(/opt/homebrew/bin/brew shellenv)"
# eval "$(starship init zsh)"

setopt nobeep autocd
# export LSCOLORS=ExfxcxdxBxegedabagacad
# export CLICOLOR=1

# Autosuggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '^ ' autosuggest-accept

# Tab completion
autoload -Uz compinit && compinit
bindkey '^[[Z' reverse-menu-complete
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' list-suffixes
zstyle ':completion:*' expand prefix suffix
zstyle ':completion*' menu select
zstyle ':completion*' list-colours ${(s.:.)LS_COLORS}

# latex
export PATH="/usr/local/texlive/2023basic/bin/universal-darwin:$PATH"

# bun
[ -s "/Users/khalidbelhadj/.bun/_bun" ] && source "/Users/khalidbelhadj/.bun/_bun"
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

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
try_source $DOTFILES/zsh/lazy.zsh
try_source_quiet $HOME/.tokens.sh
try_source_quiet $DOTFILES/zsh/nvim-selector.zsh
