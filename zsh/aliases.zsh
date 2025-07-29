

if [ -x $(which exa) ] ; then
    alias ls="exa -lh --sort type"
    alias la="exa -lah --sort type"
else
    alias ls="ls -lhF"
    alias la="ls -lahF"
fi

alias nv="nvim"
alias config="cd ~/.config/"
alias c="clear"
alias obsidian="cd /Users/khalidbelhadj/Library/Mobile\ Documents/iCloud~md~obsidian/Documents/Khalid\'s\ Vault"
alias bintodec="python3 ~/Desktop/Programming/Python/byte_to_dec.py"
alias em="emacsclient -nw"
alias python="python3"
alias at="tmux attach -t"
alias chrome="open -a 'Google Chrome'"
alias cls="clear"
alias venv="source .venv/bin/activate"
