# -----------------------------------------------------------------------------
# env variables
# -----------------------------------------------------------------------------

# define XDG's config dir
export XDG_CONFIG_HOME=$HOME/.config

# -----------------------------------------------------------------------------
# zinit plugins
# -----------------------------------------------------------------------------

# Sets the directory for storing zinit and plugins. It is done so by assigning
# a path to XDG_DATA_HOME if it doesn't already have a value stored in it. 
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Downloads zinit, if it is not already at the specified folder. The script is 
# a modification of the original script, which includes a check for a git repo.
# The change is for simplicity but also assumes a fresh zinit setup.
if [ ! -d "$ZINIT_HOME" ]; then
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Completes the installation.
source "${ZINIT_HOME}/zinit.zsh"

# zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit ice wait lucid
zinit light Aloxaf/fzf-tab
zinit ice wait"1" lucid
zinit light zsh-users/zsh-completions

# completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls -color $realpath'

# load completions
autoload -U compinit; compinit -d $HOME/.cache/zcompdump
zinit cdreplay -q

# -----------------------------------------------------------------------------
# shell integration
# -----------------------------------------------------------------------------

eval "$(starship init zsh)"
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"

# -----------------------------------------------------------------------------
# behaviors
# -----------------------------------------------------------------------------

# history
HISTDUP=erase
HISTFILE=$HOME/.cache/zsh_history
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

# -----------------------------------------------------------------------------
# aliases
# -----------------------------------------------------------------------------

alias fetch='clear && pfetch'
alias grep='grep --color=auto'
alias ls='ls --color=auto'
alias vim='nvim'
alias yay="paru"
alias yeet="paru -Rns"

# open up notes
alias nb="cd ~/.nb && vim"

# random note (selects random note from .nb)
alias rn='source $HOME/.config/qtile/scripts/random.sh'

# -----------------------------------------------------------------------------
# tmux
# -----------------------------------------------------------------------------

# if not already in a tmux session, then attach a tmux session; otherwise,
# start a new session
if [ -z "${TMUX}" ]; then
    exec tmux new-session -A >/dev/null 2>&1
fi

# remove subsequent artifacts
fetch

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
export CONDARC=$HOME/.config/condarc
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

