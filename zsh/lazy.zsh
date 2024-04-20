# Lazy loading any executable that requires setup
# Inspired by https://github.com/undg/zsh-nvm-lazy-load/tree/master

# Python

pyenv-init() {
  unset -f pyenv
  export PYENV_ROOT="$HOME/.pyenv"
  command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"
}

pyenv() {
  pyenv-init
  pyenv "$@"
}

python3() {
  unset -f python3
  pyenv-init
  python3 "$@"
}

pip3() {
  unset -f pip3
  pyenv-init
  pip3 "$@"
}

# for pyright lsp
nvim() {
  unset -f nvim
  nvim "$@"
}

# Github

gh() {
  unset -f gh
  eval "$(gh completion -s zsh)"
  gh "$@"
}

# JavaScript

load-javascript() {
  # pnpm
  export PNPM_HOME="/Users/khalidbelhadj/Library/pnpm"
  case ":$PATH:" in
    *":$PNPM_HOME:"*) ;;
    *) export PATH="$PNPM_HOME:$PATH" ;;
  esac

  # bun
  export BUN_INSTALL="$HOME/.bun"
  export PATH="$BUN_INSTALL/bin:$PATH"

  # bun completions
  [ -s "/Users/khalidbelhadj/.bun/_bun" ] && source "/Users/khalidbelhadj/.bun/_bun"

  export NVM_DIR="$HOME/.nvm"
  [ -s $HOMEBREW_PREFIX"/opt/nvm/nvm.sh" ] && \. $HOMEBREW_PREFIX"/opt/nvm/nvm.sh"  # This loads nvm
  [ -s $HOMEBREW_PREFIX"/opt/nvm/etc/bash_completion.d/nvm" ] && \. $HOMEBREW_PREFIX"/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
}

nvm() {
  unset -f nvm
  load-javascript
  nvm "$@"
}

node() {
  unset -f node
  load-javascript
  node "$@"
}

npm() {
  unset -f npm
  load-javascript
  npm "$@"
}

pnpm() {
  unset -f pnpm
  load-javascript
  pnpm "$@"
}

bun() {
  unset -f bun
  load-javascript
  bun "$@"
}


# Rust

cargo() {
  unset -f cargo
  source "$HOME/.cargo/env"
  cargo "$@"
}

# Java
sdk() {
  unset -f sdk
  export SDKMAN_DIR="$HOME/.sdkman"
  [[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
  sdk "$@"
}

# Haskell
load-haskell(){
[ -f "/Users/khalidbelhadj/.ghcup/env" ] && source "/Users/khalidbelhadj/.ghcup/env" # ghcup-env
}
[ -f "/Users/khalidbelhadj/.ghcup/env" ] && source "/Users/khalidbelhadj/.ghcup/env" # ghcup-env


cabal() {
  unset -f cabal
  load-haskell
  cabal "$@"
}

# Ocaml

opam() {
  unset -f opam
  [[ ! -r /Users/khalidbelhadj/.opam/opam-init/init.zsh ]] || source /Users/khalidbelhadj/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null
  opam "$@"
}

# Zoxide

load-zoxide() {
eval "$(zoxide init zsh)"
}

z() {
  unset -f z
  load-zoxide
  z "$@"
}

zoxide() {
  unset -f zoxide
  load-zoxide
  zoxide "$@"
}
