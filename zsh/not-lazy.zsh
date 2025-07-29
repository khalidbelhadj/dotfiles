# Python
USER=$(whoami)

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Lazy loading node environment (NVM is super slow)
load_node() {
    # pnpm
    export PNPM_HOME="/Users/$USER/Library/pnpm"
    case ":$PATH:" in
        *":$PNPM_HOME:"*) ;;
        *) export PATH="$PNPM_HOME:$PATH" ;;
    esac


    # bun
    export BUN_INSTALL="$HOME/.bun"
    export PATH="$BUN_INSTALL/bin:$PATH"

    # bun completions
    [ -s "/Users/$USER/.bun/_bun" ] && source "/Users/$USER/.bun/_bun"


    export NVM_DIR="$HOME/.nvm"
    [ -s $HOMEBREW_PREFIX"/opt/nvm/nvm.sh" ] && \. $HOMEBREW_PREFIX"/opt/nvm/nvm.sh"  # This loads nvm
    [ -s $HOMEBREW_PREFIX"/opt/nvm/etc/bash_completion.d/nvm" ] && \.    $HOMEBREW_PREFIX"/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
}

# Rust
[ -f "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"

# Java
export SDKMAN_DIR=$(brew --prefix sdkman-cli)/libexec
[[ -s "${SDKMAN_DIR}/bin/sdkman-init.sh" ]] && source "${SDKMAN_DIR}/bin/sdkman-init.sh"

# Haskell
[ -f "/Users/$USER/.ghcup/env" ] && source "/Users/$USER/.ghcup/env" # ghcup-env


# Ocaml
eval $(opam env)

# Zoxide
eval "$(zoxide init zsh)"
