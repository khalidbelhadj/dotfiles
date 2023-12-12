alias l="exa -lh --sort type"
alias la="exa -lah --icons --sort type"
alias nv="nvim"
alias config="cd ~/.config/"
alias c="clear"
alias obsidian="cd /Users/khalidbelhadj/Library/Mobile\ Documents/iCloud~md~obsidian/Documents/Khalid\'s\ Vault"
alias bintodec="python3 ~/Desktop/Programming/Python/byte_to_dec.py"
alias em="emacsclient -nw"
alias python="python3"
alias eplus="open /usr/local/opt/emacs-plus@28/Emacs.app"
alias emac="open /usr/local/opt/emacs-mac/Emacs.app"
alias todo="~/today.sh"
alias doom="~/.config/emacs/bin/doom"
alias lvim="~/.local/bin/lvim"
alias emacs29="/usr/local/Cellar/emacs-plus@29/29.0.90/bin/emacs"
alias rm="trash"
alias remove="rm"
alias at="tmux attach -t"
alias u="cd .."
alias chrome="open -a 'Google Chrome'"
alias notes="cd ~/iCloud/iCloud~md~obsidian/Documents/Notes/"
# alias base="cd '$(git rev-parse --show-toplevel)'"

function zoxide_and_nvim() {
  z "$1" && nvim
}

alias n="zoxide_and_nvim"
