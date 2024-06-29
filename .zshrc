#------------------------------------------------------------------------------
# startup
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

#------------------------------------------------------------------------------
# alias
#------------------------------------------------------------------------------

# yay -> paru
alias yay="paru"

# vim -> nvim
alias vim='nvim'

# w color
alias grep='grep --color=auto'
alias ls='ls --color=auto'
