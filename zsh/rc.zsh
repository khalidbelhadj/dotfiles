eval "$(starship init zsh)"

source_if_exists () {
    if test -r "$1"; then
        source "$1"
    else
        echo "Could not source file $1, does not exist"
    fi
}

source_if_exists $HOME/.env.sh
source_if_exists $HOME/.tokens.sh
source_if_exists $DOTFILES/zsh/aliases.zsh
source_if_exists $DOTFILES/zsh/nvim-selector.zsh
source_if_exists $DOTFILES/zsh/lazy.zsh

setopt nobeep autocd
export LSCOLORS=ExfxcxdxBxegedabagacad
export CLICOLOR=1
export BAT_THEME="OneHalfDark"

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
eval "$(gh completion -s zsh)" # Enable completion for github cli

vterm_printf() {
    if [ -n "$TMUX" ] && ([ "${TERM%%-*}" = "tmux" ] || [ "${TERM%%-*}" = "screen" ]); then
        # Tell tmux to pass the escape sequences through
        printf "\ePtmux;\e\e]%s\007\e\\" "$1"
    elif [ "${TERM%%-*}" = "screen" ]; then
        # GNU screen (screen, screen-256color, screen-256color-bce)
        printf "\eP\e]%s\007\e\\" "$1"
    else
        printf "\e]%s\e\\" "$1"
    fi
}

vterm_prompt_end() {
    vterm_printf "51;A$(whoami)@$(hostname):$(pwd)"
}

setopt PROMPT_SUBST
PROMPT=$PROMPT'%{$(vterm_prompt_end)%}'

export PATH="/usr/local/texlive/2023basic/bin/universal-darwin:$PATH"
TERM=xterm-256color
