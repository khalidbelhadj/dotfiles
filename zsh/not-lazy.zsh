# Python
USER=$(whoami)

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

eval "$(gh completion -s zsh)"

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
[ -s $HOMEBREW_PREFIX"/opt/nvm/etc/bash_completion.d/nvm" ] && \. $HOMEBREW_PREFIX"/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

source "$HOME/.cargo/env"

# Java
sdk() {
  unset -f sdk
  export SDKMAN_DIR="$HOME/.sdkman"
  [[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
  sdk "$@"
}

# Haskell
[ -f "/Users/$USER/.ghcup/env" ] && source "/Users/$USER/.ghcup/env" # ghcup-env


# Ocaml

opam() {
  unset -f opam
  [[ ! -r /Users/$USER/.opam/opam-init/init.zsh ]] || source /Users/$USER/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null
  opam "$@"
}

# Zoxide

eval "$(zoxide init zsh)"
