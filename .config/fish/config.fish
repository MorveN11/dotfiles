# Disable the default welcome message
set fish_greeting

# Setup Environment Variables
set -gx BAT_THEME kanagawa
set -gx TERM xterm-256color
set -gx EDITOR nvim
set -gx HYPRSHOT_DIR /home/morven/screenshots
set -gx HOMEBREW_NO_AUTO_UPDATE 1
set -gx DOCKER_CONFIG $HOME/.docker
set -gx BROWSER /usr/bin/brave

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
