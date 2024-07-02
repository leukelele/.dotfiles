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
zinit light Aloxaf/fzf-tab

#------------------------------------------------------------------------------
# behaviors
#------------------------------------------------------------------------------

# TMUX
[[ -z "$TMUX" ]] && exec tmux

# init
eval "$(starship init zsh)"
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"

# plugin configs
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls -color $realpath'

autoload -U compinit; compinit
zinit cdreplay -q

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

# history
HISTDUP=erase
HISTFILE=$HOME/.zsh_history
HISTFILESIZE=900
HISTSIZE=900
SAVEHIST=$HISTSIZE
setopt appendhistory
setopt hist_find_no_dups
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_save_no_dups
setopt sharehistory

# pfetch when terminal
# pfetch

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
