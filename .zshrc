# -----------------------------------------------------------------------------
# aliases
# -----------------------------------------------------------------------------

# Obsidian (wayland)
alias obsidian='OBSIDIAN_USE_WAYLAND=1 obsidian -enable-features=UseOzonePlatform -ozone-platform=wayland'

# vim -> nvim
alias vim='nvim'

# rnt (random note) -> custom script for random note selection
alias rnt='source /opt/bin/nb.sh'

# w color
alias ls='ls --color=auto'
alias grep='grep --color=auto'

# -----------------------------------------------------------------------------
# startup
# -----------------------------------------------------------------------------

# tmux
# [[ -z "$TMUX" ]] && exec tmux

eval "$(starship init zsh)"

