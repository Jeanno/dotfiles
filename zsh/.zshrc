# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# # Initialization code that may require console input (password prompts, [y/n]
# # confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="robbyrussell"
# ZSH_THEME="af-magic"
# ZSH_THEME="miloshadzic"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# plugins=(git)
plugins=(zsh-syntax-highlighting zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

THISPATH=$0:A
THISDIR=$(dirname $THISPATH)

##
# Edit command
##
export EDITOR=nvim
set -o vi
bindkey -v
autoload edit-command-line
zle -N edit-command-line
bindkey '^e' edit-command-line

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
# Custom scripts
#
export PATH=$PATH:$THISDIR/bin

source "$THISDIR/zshrc.d/alias"
source "$THISDIR/zshrc.d/functions"

# powerlevel10k
source $THISDIR/zsh-plugins/powerlevel10k/powerlevel10k.zsh-theme
## To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f $THISDIR/.p10k.zsh ]] || source $THISDIR/.p10k.zsh

source $THISDIR/zsh-plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


# Customize to your needs...
export PATH=/usr/local/bin:/opt/local/bin:/opt/local/sbin:/opt/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/Users/jeanno/bin
export PATH="/usr/local/opt/binutils/bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export ZSH_AUTOSUGGEST_STRATEGY=(
    history
    completion
)

. /usr/local/etc/profile.d/z.sh


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/jeanno/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/jeanno/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/jeanno/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/jeanno/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
