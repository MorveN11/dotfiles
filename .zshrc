# Bottom bar
printf "\e[H\ec\e[${LINES}B"

# Initialize Zellij at start
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

alias zwork='zellij attach work'

if [[ -z "$ZELLIJ" ]]; then
    zwork

    if [[ "$ZELLIJ_AUTO_EXIT" == "true" ]]; then
        exit
    fi
fi

# Enable Powerlevel10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# oh-my-zsh with powerlevel10k
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
POWERLEVEL10K_MODE="nerdfont-complete"

plugins=(
  git
  sudo
  web-search
  zsh-autosuggestions
  zsh-syntax-highlighting
  zsh-github-copilot
)

source $ZSH/oh-my-zsh.sh
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Function to clear terminal
function my-clear {
  clear && printf "\e[H\ec\e[${LINES}B"
  zle && zle .reset-prompt && zle -R
}

zle -N my-clear
bindkey '^L' my-clear

# Aliases
alias vim='nvim'
alias open='xdg-open'

# Bindkeys
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line
bindkey "^[[3~" delete-char
bindkey "^[[1;3C" forward-word
bindkey "^[[1;3D" backward-word

# Local Pathhs
export PATH="$HOME/.local/bin:$PATH"
export PATH="$PATH:/home/morven/bin"

# Console ninja
PATH=~/.console-ninja/.bin:$PATH

# ghcup-env
[ -f "/home/morven/.ghcup/env" ] && source "/home/morven/.ghcup/env" # ghcup-env

# pnpm
export PNPM_HOME="/home/morven/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# bun completions
[ -s "/home/morven/.bun/_bun" ] && source "/home/morven/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Nix installer
if [ -e /home/morven/.nix-profile/etc/profile.d/nix.sh ]; then . /home/morven/.nix-profile/etc/profile.d/nix.sh; fi 

# Go
export GOPATH=$HOME/go

# Ruby
export PATH=$PATH:$(ruby -e 'print Gem.user_dir')/bin

# perl
eval "$(perl -I$HOME/perl5/lib/perl5 -Mlocal::lib=$HOME/perl5)"

# Setup fzf
eval "$(fzf --zsh)"

# Set fd instead fzf
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}

# --- setup fzf theme ---
bg="#181616"
bg_highlight="#303030"
fg="#DCD7BA"
hl="#b99d6a"
info="#738fc6"
pointer="#708c64"

export FZF_DEFAULT_OPTS="--color=fg:${fg},bg:${bg},hl:${hl},fg+:${fg},bg+:${bg_highlight},hl+:${hl},info:${info},prompt:${pointer},pointer:${pointer},marker:${pointer},spinner:${pointer},header:${pointer}"

export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always --line-range :500 {}'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo $'{}"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview "bat -n --color=always --line-range :500 {}" "$@" ;;
  esac
}

# Git fzf
source ~/Desktop/repos/fzf-git/fzf-git.sh

# Set bat instead cat
export BAT_THEME=kanagawa
alias cat='bat'

# Set eza instead ls
alias ls="eza --color=always --git --no-filesize --icons=always --no-time --group-directories-first"

# Set The Fuck
eval $(thefuck --alias)
eval $(thefuck --alias fk)

# Set zoxide instead cd
eval "$(zoxide init zsh)"
alias cd="z"

# Set Copilot bind key
bindkey '^\' zsh_gh_copilot_explain  # bind Ctrl+\ to explain
bindkey '^[\' zsh_gh_copilot_suggest  # bind Alt+\ to suggest
