THISPATH=$0:A
THISDIR=$(dirname $THISPATH)

##
# History
##
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/.zsh_history

##
# File navigation
#
# ctrl-t: paste fzf path to cursor
# alt-c: cd into fzf directory
# ctrl-r: fuzzy search command history

# z: jump to fuzzy directory
# cd -<TAB>: jump to previous directories
##

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

## FZF
if type rg &> /dev/null; then
  export FZF_DEFAULT_COMMAND='rg --files'
  export FZF_DEFAULT_OPTS='-m --height 50% --border'
fi


##
# File preview
#
# bat: cat with syntax highlighting
##

##
# Edit command
##
export EDITOR=vim
set -o vi
autoload edit-command-line
zle -N edit-command-line
bindkey '^e' edit-command-line
bindkey -v

##
# Custom scripts
##
export PATH=$PATH:$THISDIR/bin

source "$THISDIR/zshrc.d/alias"

# powerlevel10k
source $THISDIR/zsh-plugins/powerlevel10k/powerlevel10k.zsh-theme
## To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f $THISDIR/.p10k.zsh ]] || source $THISDIR/.p10k.zsh

source $THISDIR/zsh-plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

