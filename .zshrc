#------------------------------------------------------------------------------
# behaviors
#------------------------------------------------------------------------------

# TMUX
[[ -z "$TMUX" ]] && exec tmux

# startship
eval "$(starship init zsh)"

# conda
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/leukelele/.miniconda/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/leukelele/.miniconda/etc/profile.d/conda.sh" ]; then
        . "/home/leukelele/.miniconda/etc/profile.d/conda.sh"
    else
        export PATH="/home/leukelele/.miniconda/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# pfetch when terminal
pfetch

# history
HISTDUP=erase
HISTFILE=$HOME/.zsh_history
HISTSIZE=5000
SAVEHIST=$HISTSIZE
setopt appendhistory
setopt hist_find_no_dups
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_save_no_dups
setopt sharehistory

#------------------------------------------------------------------------------
# plugins
#------------------------------------------------------------------------------

# Set the directory for zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source zinit
source "${ZINIT_HOME}/zinit.zsh"

# zsh plugins
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-syntax-highlighting
autoload -U compinit; compinit

#------------------------------------------------------------------------------
# alias
#------------------------------------------------------------------------------

# random note (selects random note from .nb)
alias rnt='source $HOME/.config/qtile/scripts/random.sh'

# vim -> nvim
alias vim='nvim'

# yay -> paru
alias yay="paru"
alias yeet-"paru -Rns"

# w color
alias grep='grep --color=auto'
alias ls='ls --color=auto'
