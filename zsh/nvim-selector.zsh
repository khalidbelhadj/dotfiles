# export NVIM_APPNAME="LazyVim"
export NVIM_APPNAME="nvchad"

function nvims() {
  items=("LazyVim" "default" "nvim-personal" "nvchad" "nvchaddefault")
  config=$(printf "%s\n" "${items[@]}" | fzf --prompt=" Neovim Config  " --height=~50% --layout=reverse --border --exit-0)
  if [[ -z $config ]]; then
    echo "Nothing selected"
    return 0
  elif [[ $config == "default" ]]; then
    config=""
  fi
  NVIM_APPNAME=$config nvim $@
}

