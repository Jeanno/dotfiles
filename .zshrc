THISPATH=$0:A
THISDIR=$(dirname $THISPATH)

# History
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

# Edit command
export EDITOR=vim
set -o vi
autoload edit-command-line
zle -N edit-command-line
bindkey '^e' edit-command-line
bindkey -v

# Use lf to switch directories and bind it to ctrl-o
lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
bindkey -s '^o' 'lfcd\n'

# FZF
if type rg &> /dev/null; then
  export FZF_DEFAULT_COMMAND='rg --files'
  export FZF_DEFAULT_OPTS='-m --height 50% --border'
fi

# Aliases
alias gf="git fetch"
alias gp="git pull"
alias gP="git push"
alias gpp="git pull && git push"
alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gd="git diff"
alias gvdc="git difftool --tool=vimdiff --no-prompt --cached"
alias gvd="git difftool --tool=vimdiff --no-prompt"

alias v="nvim"

alias n="npm"
alias nr="npm run"

alias lg="lazygit"

# Custom bin
export PATH=$PATH:$THISDIR/bin

# powerlevel10k
source $THISDIR/zsh-plugins/powerlevel10k/powerlevel10k.zsh-theme
## To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f $THISDIR/.p10k.zsh ]] || source $THISDIR/.p10k.zsh

source $THISDIR/zsh-plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

